import 'package:flutter/material.dart';

enum SearchState { open, discard, search, searched, found, current }

class SearchModel {
  SearchModel(this.value)
      : state = ValueNotifier(SearchState.open),
        color = Colors.black54,
        key = GlobalKey();

  final int value;
  ValueNotifier<SearchState> state;
  Color color;
  GlobalKey key;

  void reset() {
    state.value = SearchState.open;
    color = Colors.black54;
  }
  
  void current(){
    state.value = SearchState.search;
    color = Color.fromARGB(255, 215, 33, 243);
  }
  void potential() {
    state.value = SearchState.search;
    color = Colors.blue;
  }

  void discard() {
    state.value = SearchState.discard;
    color = Colors.black;
  }

  void found() {
    state.value = SearchState.found;
    color = Colors.blue;
  }

  void searched() {
    state.value = SearchState.searched;
  }
}
