import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remedi/ui/themes/app_text_styles.dart';
import 'package:remedi/ui/themes/app_palette.dart';
import 'package:remedi/ui/themes/icon_assets.dart';
import 'package:remedi/data/models/practice_state.dart';
import 'package:remedi/data/models/disease.dart';
import 'package:remedi/ui/widgets/exit_confirmation_dialog.dart';


class MedicationChatPage extends StatefulWidget {
  const MedicationChatPage({super.key});

  @override
  MedicationChatPageState createState() => MedicationChatPageState();
}

class MedicationChatPageState extends State<MedicationChatPage> {
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
            icon: const Icon(Icons.close),
            onPressed: () => _onWillPop(),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Text("복약지도 Chat 대화를 시작합니다.", style: AppTextStyles.h3()),
            ],
          ),
        ),
      ),
    );
  }
}