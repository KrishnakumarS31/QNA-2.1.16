import 'package:flutter/material.dart';

class QuestionNumProvider extends ChangeNotifier {
  int _questionNum = 1;

  int get questionNum => _questionNum;

  void increment() {
    _questionNum++;
    notifyListeners();
  }

  void decrement() {
    _questionNum--;
    notifyListeners();
  }

  void reset() {
    _questionNum = 1;
    notifyListeners();
  }

  void skipToEnd(int totalQuestion) {
    _questionNum = totalQuestion;
    notifyListeners();
  }

  void skipQuestionNum(int questionNum) {
    _questionNum = questionNum;
    notifyListeners();
  }
}

class Questions extends ChangeNotifier {
  final Map _quesAns = {};
  bool _assessmentSubmitted = false;

  Map get totalQuestion => _quesAns;
  bool get assessmentSubmitted => _assessmentSubmitted;

  void updateAssessmentSubmit(bool submitted){
    _assessmentSubmitted=submitted;
    notifyListeners();
  }


  void createQuesAns(int totalQuestion) {
    for (int i = 1; i <= totalQuestion; i++) {
      _quesAns['$i'] = [[], const Color.fromRGBO(179, 179, 179, 1), false];
    }
    notifyListeners();
  }

  void selectOption(
      int quesNum, List<dynamic> option, Color colorFlag, bool notSure) {
    _quesAns['$quesNum'] = [option, colorFlag, notSure];
    notifyListeners();
  }



}
