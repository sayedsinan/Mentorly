import 'dart:async';

import 'package:get/get.dart';

class AssessmentController extends GetxController {
  var remainingSeconds = 600.obs;
  var selectedAnswer = ''.obs;
  Timer? _timer;
  
    void selectAnswer(String answer) {
    selectedAnswer.value = answer;
  }
  void startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds.value > 0) {
        remainingSeconds.value--;
      } else {
        timer.cancel();
      }
    });
  }
  
  String get formattedTime {
    int minutes = remainingSeconds.value ~/ 60;
    int seconds = remainingSeconds.value % 60;
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }
  
  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}