import 'package:flutter/material.dart';
import 'package:remedi/ui/themes/app_text_styles.dart';
import 'package:remedi/ui/themes/app_palette.dart';
import 'package:remedi/ui/widgets/exit_confirmation_dialog.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:remedi/ui/widgets/sound_wave_painter.dart';
import 'package:remedi/ui/widgets/recording_chat_button.dart';

class MedicationChatPage extends StatefulWidget {
  const MedicationChatPage({super.key});

  @override
  MedicationChatPageState createState() => MedicationChatPageState();
}

class MedicationChatPageState extends State<MedicationChatPage> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  bool _isSaved = false;
  String _sendMessages = "";
  String _recognizedText = "버튼을 눌러 음성을 인식하세요.";
  double _soundLevel = 0.0;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  void _startListening() async {
    bool available = await _speech.initialize(
      onError: (val) => print("Error: ${val.errorMsg}"),
    );
    print("Speech available: $available");

    if (available) {
      setState(() => _isListening = true);
      _speech.listen(
        onResult: (val) => setState(() {
          _recognizedText = val.recognizedWords;
          _isSaved = false; // 새로운 녹음을 시작하면 저장 상태 초기화
        }),
        onSoundLevelChange: (level) {
          setState(() {
            _soundLevel = level;
          });
        },
        listenFor: const Duration(seconds: 30),
        pauseFor: const Duration(seconds: 30),
      );
    } else {
      print("Speech recognition not available.");
    }
  }

  void _stopListening() {
    setState(() {
      _isListening = false;
      _recognizedText = "버튼을 눌러 음성을 인식하세요."; // 초기화
      _isSaved = false;
    });
    _speech.stop();
  }

  void _saveRecording() {
    setState(() {
      _isSaved = true; // 녹음이 저장됨
      _isListening = false;
    });
    _sendMessages += _recognizedText;
    print("채팅 저장: $_recognizedText");
  }

  Future<bool> _onWillPop() async {
    return await showExitConfirmationDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    final barCount = 12;
    final barWidth = 9.0;
    final spacing = 5.0;
    final totalWidth = barCount * barWidth + (barCount - 1) * spacing;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppPalette.background,
          centerTitle: true,
          title: Text("음성 인식 예제", style: AppTextStyles.h4()),
          leading: IconButton(
            icon: const Icon(Icons.close_rounded),
            onPressed: () => Navigator.of(context).maybePop(),
          ),
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_sendMessages, style: AppTextStyles.h3(color: AppPalette.gray)),
                  const SizedBox(height: 20),
                  Text(_recognizedText, style: AppTextStyles.h3()),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            if (_isListening)
              Positioned(
                bottom: 120.0,
                child: Container(
                  width: totalWidth,
                  height: 60,
                  child: CustomPaint(
                    painter: SoundWavePainter(_soundLevel),
                  ),
                ),
              ),
          ],
        ),
        floatingActionButton: RecordingChatButton(
          isListening: _isListening,
          onStart: _startListening,
          onStop: _stopListening,
          onSend: _saveRecording,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}