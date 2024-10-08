import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remedi/ui/themes/AppPalette.dart';
import 'package:remedi/ui/themes/AppTextStyles.dart';
import 'package:remedi/ui/themes/IconAssets.dart';
import 'package:remedi/data/models/Patient.dart';
import 'package:remedi/data/models/Prescription.dart';
import 'package:remedi/ui/widgets/PrescriptionTable.dart';
import 'package:remedi/data/models/PracticeState.dart';

class Loadingpage extends StatelessWidget {
  const Loadingpage({super.key});

  Widget _buildHeader() {
    return Column(
      children: [
        Text("환자 생성 중...", style: AppTextStyles.h2()),
        const SizedBox(height: 4),
        Text("Re:medi가 실습에 적절한 환자를 생성하고 있어요.", style: AppTextStyles.body(color: AppPalette.gray)),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildLoading() {
    return Expanded(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconAssets.animationLoading(),
            const SizedBox(height: 100),
          ]
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    final practiceState = Provider.of<PracticeState>(context, listen: false);

    Future.delayed(const Duration(seconds: 3), () async {
      // 예시 데이터로 초기화:
      final Patient patient = Patient(
        name: "유해진",
        gender: "M",
        age: 56,
        idNumber: "650101",
        prescriptionId: "123456",
        imageUrl: "assets/icons/sample_patient.png",
      );
      final Prescription prescription = Prescription(
        patientId: "123456",
        medications: [
          Medication(name: "루리드정", singleDose: 1.0, doseFrequency: 2, totalDays: 14, usage: "PO 의사 지시대로", imageUrl: ""),
          Medication(name: "록솔정", singleDose: 1.0, doseFrequency: 2, totalDays: 14, usage: "PO 의사 지시대로", imageUrl: ""),
          Medication(name: "베로텍 흡입액", singleDose: 1.0, doseFrequency: 2, totalDays: 14, usage: "PO 식후 30분", imageUrl: ""),
          Medication(name: "타이레놀", singleDose: 1.0, doseFrequency: 2, totalDays: 14, usage: "PO 식후 30분", imageUrl: ""),
        ],
      );

      // PracticeState에 데이터를 저장
      practiceState.setPatient(patient);
      practiceState.setPrescription(prescription);

      // 데이터를 저장한 후 다음 페이지로 이동
      Navigator.pushReplacementNamed(context, '/patient');
    });

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: AppPalette.background,
      ),
      body: Center(
        child: Column(
          children: [
            _buildHeader(),
            _buildLoading()
          ],
        ),
      ),
    );
  }
}