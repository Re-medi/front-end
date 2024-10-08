import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remedi/ui/themes/app_palette.dart';
import 'package:remedi/ui/themes/app_text_styles.dart';
import 'package:remedi/ui/themes/icon_assets.dart';
import 'package:remedi/data/models/patient.dart';
import 'package:remedi/data/models/prescription.dart';
import 'package:remedi/data/models/practice_state.dart';
import 'package:remedi/ui/screens/patient_creation_page.dart';


class Loadingpage extends StatefulWidget {
  const Loadingpage({super.key});

  @override
  _LoadingpageState createState() => _LoadingpageState();
}

class _LoadingpageState extends State<Loadingpage> {
  @override
  void initState() {
    super.initState();

    final practiceState = Provider.of<PracticeState>(context, listen: false);

    Future.delayed(const Duration(seconds: 3), () async {
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

      practiceState.setPatient(patient);
      practiceState.setPrescription(prescription);

      if (mounted) {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => const PatientCreationPage(),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );
      }
    });
  }

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