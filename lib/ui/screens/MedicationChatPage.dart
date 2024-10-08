import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remedi/ui/themes/AppTextStyles.dart';
import 'package:remedi/ui/themes/AppPalette.dart';
import 'package:remedi/data/models/PracticeState.dart';
import 'package:remedi/data/models/Disease.dart';

class MedicationChatPage extends StatefulWidget {
  const MedicationChatPage({Key? key}) : super(key: key);

  @override
  _MedicationChatPageState createState() => _MedicationChatPageState();
}

class _MedicationChatPageState extends State<MedicationChatPage> {
  @override
  Widget build(BuildContext context) {
    final practiceState = Provider.of<PracticeState>(context);
    final selectedCategory = practiceState.selectedDiseaseCategory;
    final patient = practiceState.patient;
    final prescription = practiceState.prescription;

    // 약물 목록에서 첫 번째 약물 이름과 나머지 약물 개수를 가져옴
    final medicationNames = prescription?.medications.map((med) => med.name).toList() ?? [];
    final firstMedicationName = medicationNames.isNotEmpty ? medicationNames[0] : '';
    final remainingMedicationsCount = (medicationNames.length > 1) ? ' 외' : '';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppPalette.background,
        centerTitle: true,
        title: Text(
          "${diseaseCategoryToKorean[selectedCategory]}: ${patient?.age}세 ${patient?.gender == 'M' ? '남성' : '여성'} ($firstMedicationName$remainingMedicationsCount)",
          style: AppTextStyles.h4(),
        ),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const SizedBox(height: 20),
            Text("복약지도 Chat 대화를 시작합니다.", style: AppTextStyles.h3()),
            // 여기에 대화 기능 구현
          ],
        ),
      ),
    );
  }
}