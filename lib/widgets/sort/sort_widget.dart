// import 'package:algorithms_visualizer/models/sort_model.dart';
// ignore_for_file: prefer_const_declarations

import 'package:algo3/constraints/constrant.dart';
import 'package:flutter/material.dart';

import '../../models/sort_model.dart';

class SortWidget extends StatelessWidget {
  const SortWidget({
    Key? key,
    required this.number,
    required this.index,
    required this.widgetSize,
    required this.containerWidth,
  }) : super(key: key);

  final SortModel number;
  final int index;
  final double widgetSize;
  final double containerWidth;

  Offset _getPosition(double width) {
    final horizontalFit = width ~/ widgetSize;
    final leftOver = width - (horizontalFit * widgetSize);
    final verticalIndex = index ~/ horizontalFit;
    final horizontalIndex = index % horizontalFit;
    return Offset((widgetSize * horizontalIndex) + leftOver / 2,
        widgetSize * verticalIndex);
  }

  @override
  Widget build(BuildContext context) {
    final offset = _getPosition(containerWidth);

    var _fontSize = 20.0;
    var _borderRadius = 5.0;
    var _borderWidth = 1.0;
    var _borderColor = Colors.black54;
    var _backgroundColor = Constants.primaryColor;
    var _label = ''; // Add a label to signify sorting state

    if (number.state == SortState.sort) {
      _fontSize = 32;
      _borderRadius = 40.0;
      _borderWidth = 2.0;
      _borderColor = Colors.blue;
      _backgroundColor = Constants.primaryColor;
      _label = 'Sorting';
    } else if (number.state == SortState.sorted) {
      _fontSize = 20;
      _borderRadius = 5.0;
      _borderWidth = 1.0;
      // _borderColor = Colors.green;
      _backgroundColor = Constants.sorteedColor;
      // _backgroundColor = Colors.amber;
      _label = 'Sorted';
    }

    // Add animations to signify the sorting process
    final animationDuration = const Duration(milliseconds: 1000);
    final curve = Curves.linear;
    final isComparing = number.state == SortState.sort;
    final isSorted = number.state == SortState.sorted;

    return AnimatedPositioned(
      duration: animationDuration,
      curve: curve,
      left: offset.dx,
      top: offset.dy,
      child: SizedBox(
        width: widgetSize,
        height: widgetSize,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimatedContainer(
            duration: animationDuration,
            curve: curve,
            decoration: BoxDecoration(
              color: _backgroundColor,
              border: Border.all(
                color: _borderColor,
                width: _borderWidth,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(_borderRadius),
              ),
              boxShadow: isComparing
                  ? [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.4),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ]
                  : (isSorted
                      ? [
                          // BoxShadow(
                          //   color: Colors.green.withOpacity(0.4),
                          //   blurRadius: 10,
                          //   spreadRadius: 1,
                          // ),
                        ]
                      : null),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  number.value.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: _fontSize,
                  ),
                ),
                if (_label.isNotEmpty)
                  Text(
                    _label,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
