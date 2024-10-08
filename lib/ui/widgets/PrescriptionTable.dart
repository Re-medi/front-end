import 'package:flutter/material.dart';
import 'package:remedi/ui/themes/AppPalette.dart';
import 'package:remedi/ui/themes/AppTextStyles.dart';
import 'package:remedi/data/models/Prescription.dart';

class PrescriptionTable extends StatelessWidget {
  final Prescription prescription;

  const PrescriptionTable({super.key, required this.prescription});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: AppPalette.strokeGray),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: const {
        0: FlexColumnWidth(5),
        1: FlexColumnWidth(3),
        2: FlexColumnWidth(2),
        3: FlexColumnWidth(2),
        4: FlexColumnWidth(6),
      },
      children: [
        TableRow(
          decoration: BoxDecoration(color: AppPalette.lightGray),
          children: [
            Center(child: Text("의약품 명칭", style: AppTextStyles.tableTitle())),
            Center(child: Text('1회\n투약량', style: AppTextStyles.tableTitle(), textAlign: TextAlign.center)),
            Center(child: Text("1회\n투여횟수", style: AppTextStyles.tableTitle(), textAlign: TextAlign.center)),
            Center(child: Text("총\n투여일수", style: AppTextStyles.tableTitle(), textAlign: TextAlign.center)),
            Center(child: Text("용  법", style: AppTextStyles.tableTitle())),
          ],
        ),
        for (var med in prescription.medications)
          TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(med.name, style: AppTextStyles.tableText()),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text("${med.singleDose} TAB", style: AppTextStyles.tableText()),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text("${med.doseFrequency} 회", style: AppTextStyles.tableText()),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text("${med.totalDays} 일", style: AppTextStyles.tableText()),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(med.usage, style: AppTextStyles.tableText()),
              ),
            ],
          ),
      ],
    );
  }
}