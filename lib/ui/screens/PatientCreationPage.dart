import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remedi/ui/themes/AppPalette.dart';
import 'package:remedi/ui/themes/AppTextStyles.dart';
import 'package:remedi/data/models/Patient.dart';
import 'package:remedi/data/models/Prescription.dart';
import 'package:remedi/ui/widgets/PrescriptionTable.dart';
import 'package:remedi/data/models/PracticeState.dart';

class PatientCreationPage extends StatelessWidget {
  const PatientCreationPage({super.key});

  Widget _buildHeader() {
    return Column(
      children: [
        Text("환자 생성 완료!", style: AppTextStyles.h2()),
        const SizedBox(height: 4),
        Text("Re:medi가 가상의 환자를 생성했어요", style: AppTextStyles.body(color: AppPalette.gray)),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildPatientInfo(Patient patient) {
    return Column(
      children: [
        CircleAvatar(
          radius: 70,
          backgroundImage: AssetImage(patient.imageUrl),
        ),
        const SizedBox(height: 12),
        Text("${patient.name}(${patient.age}/${patient.gender})", style: AppTextStyles.h3()),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      height: 1.0,
      color: AppPalette.lightGray,
    );
  }

  Widget _buildPrescription(Prescription prescription) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 28.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDivider(),
          Text(
            "처방전 - 총 ${prescription.medications.length}개의 약물",
            style: AppTextStyles.h4(color: AppPalette.gray),
          ),
          const SizedBox(height: 12),
          PrescriptionTable(prescription: prescription),
        ],
      ),
    );
  }

  Widget _buildFooterButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppPalette.primary,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        onPressed: () {
          final practiceType = Provider.of<PracticeState>(context, listen: false).practiceType;
          if (practiceType == PracticeType.practiceChat) {
            Navigator.pushReplacementNamed(context, '/chat');
          } else if (practiceType == PracticeType.realChat) {
            Navigator.pushReplacementNamed(context, '/real');
          }
        },
        child: Text("복약지도 시작하기", style: AppTextStyles.buttonText()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final practiceState = Provider.of<PracticeState>(context);
    final patient = practiceState.patient!;
    final prescription = practiceState.prescription!;

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
            _buildPatientInfo(patient),
            _buildPrescription(prescription),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: _buildFooterButton(context),
            ),
          ],
        ),
      ),
    );
  }
}