import 'dart:async';
import 'package:flutter/material.dart';

class TimerService extends ChangeNotifier {
  final Map<int, int> _elapsedTimes = {};
  final Map<int, Timer?> _timers = {};
  final Map<int, bool> _isVisible = {};

  int getElapsedTime(int postId) => _elapsedTimes[postId] ?? 0;

  void startTimer(int postId) {
    if (_isVisible[postId] == true && _timers[postId] == null) {
      _timers[postId] = Timer.periodic(const Duration(seconds: 1), (timer) {
        _elapsedTimes[postId] = (_elapsedTimes[postId] ?? 0) + 1;
        notifyListeners();
      });
    }
  }

  void pauseTimer(int postId) {
    _timers[postId]?.cancel();
    _timers[postId] = null;
  }

  void onVisibilityChanged(int postId, bool isVisible) {
    _isVisible[postId] = isVisible;
    if (isVisible) {
      startTimer(postId);
    } else {
      pauseTimer(postId);
    }
  }

  @override
  void dispose() {
    for (var timer in _timers.values) {
      timer?.cancel();
    }
    _timers.clear();
    super.dispose();
  }
}