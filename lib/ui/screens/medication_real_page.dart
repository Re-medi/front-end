import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remedi/ui/themes/app_text_styles.dart';
import 'package:remedi/ui/themes/app_palette.dart';
import 'package:remedi/ui/themes/icon_assets.dart';
import 'package:remedi/data/models/practice_state.dart';
import 'package:remedi/data/models/disease.dart';
import 'package:remedi/ui/widgets/exit_confirmation_dialog.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;


class MedicationRealPage extends StatefulWidget {
  const MedicationRealPage({super.key});

  @override
  MedicationRealPageState createState() => MedicationRealPageState();
}

class MedicationRealPageState extends State<MedicationRealPage> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _recognizedText = "버튼을 눌러 음성을 인식하세요.";

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
          listenFor: Duration(seconds: 30), // 듣기 시간 설정
          pauseFor: Duration(seconds: 30)   // 단어 사이의 최대 침묵 시간
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
              icon: IconAssets.iconVoice(),
              onPressed: () => _onWillPop(),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Text(_recognizedText, style: AppTextStyles.h3()),
              ],
            ),
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 36.0),
            child: SizedBox(
              width: 80.0,
              height: 80.0,
              child: FloatingActionButton(
                onPressed: _isListening ? _stopListening : _startListening,
                backgroundColor: _isListening ? AppPalette.primaryHighlight : AppPalette.primary,
                elevation: 0,
                child: Icon(
                  _isListening ? Icons.upload : Icons.mic,
                  size: 40,
                  color: _isListening ? AppPalette.primary : AppPalette.white,
                ),
                shape: CircleBorder(
                  side: BorderSide(
                    color: _isListening ? AppPalette.primaryDark :AppPalette.primary, // 테두리 색상
                    width: 4.0,
                  ),
                ),
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        ),
    );
  }
}