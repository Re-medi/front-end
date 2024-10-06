import 'package:flutter/material.dart';

enum PracticeType {
  practiceChat,   // AI 환자와 연습 대화
  realChat,       // AI 환자와 실전 대화
}

class PracticeState extends ChangeNotifier {
  PracticeType? _practiceType;

  PracticeType? get practiceType => _practiceType;

  void selectPracticeType(PracticeType practiceType) {
    _practiceType = practiceType;
    print('PracticeType changed to: $practiceType');
    notifyListeners(); // 상태 변경을 알림
  }
}