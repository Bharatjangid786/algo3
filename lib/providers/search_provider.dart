// import 'package:algorithms_visualizer/providers/base_provider.dart';
import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:algorithms_visualizer/models/search_model.dart';

import '../models/search_model.dart';
import 'base_provider.dart';
// import './utiles/wait.dart';

abstract class SearchProvider extends BaseProvider {
  List<SearchModel> numbers = [
    SearchModel(0),
    SearchModel(1),
    SearchModel(4),
    SearchModel(11),
    SearchModel(19),
    // SearchModel(22),
    SearchModel(34),
    SearchModel(35),
    SearchModel(38),
    SearchModel(39),
    SearchModel(44),
    SearchModel(46),
    SearchModel(47),
    SearchModel(49),
    SearchModel(57),
    SearchModel(62),
    SearchModel(69),
    SearchModel(74),
  ];

  void genratedSize(TextEditingController controller) {
    int count = int.tryParse(controller.text) ?? 0;
    List<SearchModel> generateRandomNumbers(int count, int min, int max) {
      Random random = Random();
      List<SearchModel> randomNumbers = [];

      for (int i = 0; i < count; i++) {
        int randomValue = min + random.nextInt(max - min + 1) % 100;
        randomNumbers.add(SearchModel(randomValue));
      }

      return randomNumbers;
    }

    numbers = generateRandomNumbers(count, 0, 1000);
    numbers.sort((a, b) => a.value.compareTo(b.value));
    // numbers.insert(index, element)
  }

  void addElement(TextEditingController controller) {
    int val = int.tryParse(controller.text) ?? 0;
    numbers.add(SearchModel(val));

    // Sort the list based on the 'value' property of SearchModel
    numbers.sort((a, b) => a.value.compareTo(b.value));
  }

  bool _isSearching = false;
  int _position = -2;

  // bool _isSearching = false;
  //int _position = -2;
  //  bool get isSearching => _isSearching;
  // int get position => _position;

  bool get isSearching => _isSearching;
  int get position => _position;
  int _kadaneStart = -1;
  int _kadaneEnd = -1;
  int get kadaneStart => _kadaneStart;
  int get kadaneEnd => _kadaneEnd;

  @mustCallSuper
  void search({int value = 34}) {
    reset();
    _isSearching = true;
  }

  // @mustCallSuper
  // void search({int value = 34}) {
  //   reset();
  //   _isSearching = true;
  // }

  @protected
  void reset() {
    _isSearching = false;
    _position = -2;
    for (var number in numbers) {
      number.reset();
    }
    numbers.sort((a, b) => a.value.compareTo(b.value));
    notifyListeners();
  }

  //   @protected
  // void reset() {
  //   _isSearching = false;
  //   _position = -2;
  //   for (var number in numbers) {
  //     number.reset();
  //   }
  //   notifyListeners();
  // }
  @protected
  void potentialNode(int index) {
    numbers[index].potential();
    notifyListeners();
  }

  @protected
  void UpdateStart(int index) {
    _kadaneStart = index;
    notifyListeners();
  }

  @protected
  void UpdateEnd(int index) {
    _kadaneEnd = index;
    notifyListeners();
  }

  @protected
  int GiveEndIndex() {
    // _kadaneEnd = index;
    notifyListeners();
    return _kadaneEnd;
  }

  @protected
  int GiveStartIndex() {
    // _kadaneEnd = index;
    notifyListeners();
    return _kadaneStart;
  }
  

  @protected
  void searchedNode(int index) {
    numbers[index].searched();
    notifyListeners();
  }

  @protected
  void discardNode(int index) {
    numbers[index].discard();
    notifyListeners();
  }

  @protected
  void discardNodes(int left, int right) {
    for (var index = left; index <= right; index++) {
      numbers[index].discard();
    }
    notifyListeners();
  }

  @protected
  void currentSum(int left, int right) {
    for (var index = left; index <= right; index++) {
      numbers[index].current();
    }
  }

  @protected
  void foundNode(int index) {
    _isSearching = false;
    numbers[index].found();
    _position = index;
    notifyListeners();
  }

  @protected
  void nodeNotFound() {
    _isSearching = false;
    _position = -1;
    notifyListeners();
  }
}
