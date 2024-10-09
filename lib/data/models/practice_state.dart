import 'package:flutter/material.dart';
import './disease.dart';
import './patient.dart';
import './prescription.dart';

enum PracticeType {
  practiceChat,   // AI 환자와 연습 대화
  realChat,       // AI 환자와 실전 대화
}

class PracticeState extends ChangeNotifier {
  PracticeType? _practiceType;
  DiseaseCategory? _selectedDiseaseCategory;
  Patient? _patient;
  Prescription? _prescription;

  PracticeType? get practiceType => _practiceType;
  DiseaseCategory? get selectedDiseaseCategory => _selectedDiseaseCategory;
  Patient? get patient => _patient;
  Prescription? get prescription => _prescription;

  void selectPracticeType(PracticeType practiceType) {
    _practiceType = practiceType;
    print('Provider Log: PracticeType changed to $practiceType');
    notifyListeners();
  }

  void selectDiseaseCategory(DiseaseCategory category) {
    _selectedDiseaseCategory = category;
    print('Provider Log: DiseaseCategory selected $category');
    notifyListeners();
  }

  void setPatient(Patient patient) {
    _patient = patient;
    print('Provider Log: Patient set to ${patient.name}');
    notifyListeners();
  }

  void setPrescription(Prescription prescription) {
    _prescription = prescription;
    print('Provider Log: Prescription set for patient ID ${prescription.patientId}');
    notifyListeners();
  }
}