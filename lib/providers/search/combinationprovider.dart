import 'package:algo3/utiles/wait.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/search_model.dart';

class CombinedProvider extends ChangeNotifier {
  double _executionSpeed = 0.5;
  double get executionSpeed => _executionSpeed;
  set executionSpeed(double speed) {
    if (speed > 1.0) {
      _executionSpeed = 1;
      return;
    }
    if (speed < 0) {
      _executionSpeed = 0;
      return;
    }
    _executionSpeed = speed;
     notifyListeners();
  }

  final List<SearchModel> numbers = [
    SearchModel(0),
    SearchModel(1),
    SearchModel(4),
    SearchModel(11),
    SearchModel(19),
    SearchModel(22),
    // Add more SearchModel instances here if needed
  ]; 
  
  bool _isSearching = false;
  int position = -2;

  bool get isSearching => _isSearching;
  // int get position => _position;

  @mustCallSuper
  void search({int value = 34}) {
    reset();
    _isSearching = true;
    _startSearch(numbers, value);
  }

  @protected
  void reset() {
    _isSearching = false;
    position = -2;
    for (var number in numbers) {
      number.reset();
    }
    notifyListeners();
  }

  @protected
  void potentialNode(int index) {
    numbers[index].potential();
    notifyListeners();
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
  void foundNode(int index) {
    _isSearching = false;
    numbers[index].found();
    position = index;
    notifyListeners();
  }

  @protected
  void nodeNotFound() {
    _isSearching = false;
    position = -1;
    notifyListeners();
  }

  Future _startSearch(List<SearchModel> list, int target) async {
    for (var index = 0; index < list.length; index++) {
      potentialNode(index);
      await pause();
      if (numbers[index].value == target) {
        foundNode(index);
        return;
      } else {
        discardNode(index);
      }
    }
    nodeNotFound();
  }

  @protected
  Future pause() async {
    await wait(speed: executionSpeed);
  }

  static CombinedProvider of(BuildContext context) {
    return Provider.of<CombinedProvider>(context, listen: false);
  }
}
