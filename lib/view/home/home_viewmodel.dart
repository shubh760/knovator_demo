import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:knovator_assignment/model/post_data_model.dart';
import 'package:knovator_assignment/service/Api_service.dart';
import 'package:knovator_assignment/service/local_db.dart';

class HomeViewmodel extends ChangeNotifier {
  List<PostData> dataList = [];
  late ApiService apiService;
  List timers = [];
  List visibilityidxs = [];
  List markedIndex = [];
  Timer? timer;
  bool isRunning = false;

  void startTimer() {
    if (!isRunning) {
      isRunning = true;
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        changeTimeritem();
      });
    }
  }

  void pauseTimer() {
    isRunning = false;
    timer?.cancel();
    timer = null;
  }

  Future<void> getReadIndex() async {
    final indexStorage = IndexStorage();
    markedIndex = await indexStorage.getIndices();
    notifyListeners();
  }

  void addMarkedIndex(int index) {
    markedIndex.add(index);
    log("Changed");
    notifyListeners();
  }

  void resetTimer() {
    pauseTimer();
    notifyListeners();
  }

  void checkTimerCondition() {
    bool allZero = timers.any((item) => item != 0);
    if (!allZero) {
      pauseTimer();
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  HomeViewmodel() {
    apiService = ApiService();
    getReadIndex();
    startTimer();
  }

  // Setter for testing purposes
  void setApiService(ApiService service) {
    apiService = service;
  }

  void changeVisibility(int idx, bool isVisible) {
    visibilityidxs[idx] = isVisible;
  }

  fetchData() async {
    dataList.clear();
    timers.clear();
    try {
      dataList = await ApiService.getpost();
      log(dataList.toString());
      timers = List.filled(dataList.length, 20);
      visibilityidxs = List.filled(dataList.length, false);
      notifyListeners();
      return dataList;
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  void changeTimeritem() {
    for (int i = 0; i < timers.length; i++) {
      if (visibilityidxs[i] == true && timers[i] != 0) {
        timers[i]--;
      }
    }
    notifyListeners();
    checkTimerCondition();
  }
}
