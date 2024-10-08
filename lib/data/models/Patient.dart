
class Patient {
  final String name;
  final int age;
  final String gender;
  final String idNumber;
  final String imageUrl;
  final String prescriptionId;

  Patient({
    required this.name,
    required this.age,
    required this.idNumber,
    required this.gender,
    required this.imageUrl,
    required this.prescriptionId,
  });
}
