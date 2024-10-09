class Medication {
  final String name;
  final double singleDose;
  final int doseFrequency;
  final int totalDays;
  final String usage;
  final String imageUrl;

  Medication({
    required this.name,
    required this.singleDose,
    required this.doseFrequency,
    required this.totalDays,
    required this.usage,
    required this.imageUrl,
  });
}

class Prescription {
  final String patientId;
  final List<Medication> medications;

  Prescription({
    required this.patientId,
    required this.medications,
  });
}