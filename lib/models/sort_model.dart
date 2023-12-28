import 'package:algo3/constraints/constrant.dart';
import 'package:flutter/material.dart';

enum SortState {
  open,
  sort,
  sorted,
  pivot,
  swap,
}

class SortModel {
  SortModel(this.value)
      : key = GlobalKey(),
        state = SortState.open,
        color = Colors.black54;

  late final int value;
  late final GlobalKey key;
  late SortState state;
  Color color;
  // Color color;

  void reset() {
    state = SortState.open;
    color = Colors.black54;
  }

  void sort() {
    state = SortState.sort;
    color = Constants.primaryColor;
  }

  void sorted() {
    state = SortState.sorted;
    color = Colors.green;
  }

  void pivot() {
    state = SortState.pivot;
    color = Colors.pink;
  }
}
