import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remedi/ui/themes/app_text_styles.dart';
import 'package:remedi/ui/themes/app_palette.dart';
import 'package:remedi/data/models/practice_state.dart';
import 'package:remedi/data/models/disease.dart';
import 'package:remedi/ui/widgets/exit_confirmation_dialog.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:remedi/ui/widgets/sound_wave_painter.dart';
import 'package:remedi/ui/widgets/recording_button.dart';

class MedicationRealPage extends StatefulWidget {
  const MedicationRealPage({super.key});

  @override
  MedicationRealPageState createState() => MedicationRealPageState();
}

class MedicationRealPageState extends State<MedicationRealPage> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
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
        }),
        onSoundLevelChange: (level) => setState(() {
          _soundLevel = level;
        }),
        listenFor: const Duration(seconds: 30),
        pauseFor: const Duration(seconds: 30),
      );
    } else {
      print("Speech recognition not available.");
    }
  }

  void _stopListening() {
    setState(() => _isListening = false);
    _speech.stop();
  }

  Future<bool> _onWillPop() async {
    return await showExitConfirmationDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    final practiceState = Provider.of<PracticeState>(context);
    final selectedCategory = practiceState.selectedDiseaseCategory;
    final patient = practiceState.patient;
    final prescription = practiceState.prescription;

    final medicationNames = prescription?.medications.map((med) => med.name).toList() ?? [];
    final firstMedicationName = medicationNames.isNotEmpty ? medicationNames[0] : '';
    final remainingMedicationsCount = (medicationNames.length > 1) ? ' 외' : '';

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
          title: Text(
            "${diseaseCategoryToKorean[selectedCategory]}: ${patient?.age}세 ${patient?.gender == 'M' ? '남성' : '여성'} ($firstMedicationName$remainingMedicationsCount)",
            style: AppTextStyles.h4(),
          ),
          leading: IconButton(
            icon: const Icon(Icons.close_rounded),
            onPressed: () => Navigator.of(context).maybePop(),
          ),
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            _buildContent(),
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
        floatingActionButton: RecordingButton(
          isListening: _isListening,
          onStart: _startListening,
          onStop: _stopListening,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  Widget _buildContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Text(_recognizedText, style: AppTextStyles.h3()),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}