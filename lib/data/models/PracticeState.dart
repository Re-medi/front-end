import 'package:flutter/material.dart';
import './Disease.dart';

enum PracticeType {
  practiceChat,   // AI 환자와 연습 대화
  realChat,       // AI 환자와 실전 대화
}

class PracticeState extends ChangeNotifier {
  PracticeType? _practiceType;
  DiseaseCategory? _selectedDiseaseCategory;

  PracticeType? get practiceType => _practiceType;
  DiseaseCategory? get selectedDiseaseCategory => _selectedDiseaseCategory;


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
}