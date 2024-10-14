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
  List<String> _messages = [];
  final String _defaultPromptText = "버튼을 눌러 대답해보세요.";
  final String _defaultActivatePromptText = "지금 말하세요...";
  late String _recognizedText;
  double _soundLevel = 0.0;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    _recognizedText = _defaultPromptText;
  }

  Future<void> _startListening() async {
    if (_isListening) return;

    setState(() {
      _isListening = true;
      _recognizedText = _defaultActivatePromptText;
    });

    bool available = await _speech.initialize(
      onError: (val) => print("Error: ${val.errorMsg}"),
    );

    if (available) {
      await _speech.listen(
        onResult: (val) {
          setState(() {
            if (_isListening) _recognizedText = _addQuestionMark(val.recognizedWords);
          });
        },
        onSoundLevelChange: (level) {
          setState(() {
            _soundLevel = level;
          });
        },
        listenFor: const Duration(seconds: 100),
        pauseFor: const Duration(seconds: 100),
        partialResults: true,
      );
    } else {
      setState(() {
        _isListening = false;
      });
    }
  }

  String _addQuestionMark(String text) {
    final questionWords = ['어디', '언젠', '어떤', '언제', '어떻게', '왜', '무엇', '누가', '무슨'];
    final sentenceEndings = ['요', '다', '죠', '까', '나'];
    final List<String> output = [];


    String buffer = "";
    bool isQuestion = false;

    for (int i = 0; i < text.length; i++) {
      String char = text[i];
      buffer += char;

      if (sentenceEndings.any((ending) => buffer.endsWith(ending))) {
        if (questionWords.any((word) => buffer.contains(word))) {
          isQuestion = true;
        }
        if (isQuestion && !buffer.endsWith('?')) {
          buffer = buffer.trim() + '?';
        }
        output.add(buffer);
        buffer = "";
        isQuestion = false;
      }
    }
    if (buffer.isNotEmpty) {
      output.add(buffer);
    }
    return output.join(' ');
  }

  Future<void> _stopListening() async {
    if (_isListening) await _speech.cancel();

    setState(() {
      _isListening = false;
      _recognizedText = _defaultPromptText;
    });
  }

  Future<void> _saveRecording() async {
    if (_isListening) {
      await _speech.stop();
      _isListening = false;
    }

    setState(() {
      if (_recognizedText.isEmpty || _recognizedText == _defaultActivatePromptText) {
        _recognizedText = "죄송해요. 잘 못 알아 들었어요. 다시 말씀해주시겠어요?";
      } else {
        _messages.add(_recognizedText);
        _recognizedText = _defaultPromptText;
      }
    });
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
            Positioned.fill(
              child: ListView.builder(
                  padding: const EdgeInsets.all(20.0),
                  itemCount: _messages.length + 1,
                  itemBuilder: (context, index) {
                    final isLiveText = index == _messages.length;
                    return Align(
                      alignment: Alignment.centerRight,
                      child: MessageBubble(
                        text: isLiveText ? _recognizedText : _messages[index],
                        isLive: isLiveText,
                      ),
                    );
                  }
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

class MessageBubble extends StatelessWidget { // StatefulWidget 대신 StatelessWidget 사용
  final String text;
  final bool isLive;

  const MessageBubble({
    Key? key,
    required this.text,
    this.isLive = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.7,
      ),
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14),
      decoration: BoxDecoration(
        color: isLive ? AppPalette.lightGray : Colors.transparent,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(4.0),
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
        border: isLive ? null : Border.all(
          color: AppPalette.primary,
          width: 1.0,
        ),
      ),
      child: Text(
        text,
        style: AppTextStyles.body(color: AppPalette.midGray),
      ),
    );
  }
}