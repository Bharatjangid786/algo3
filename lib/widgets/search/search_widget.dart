// import 'package:algorithms_visualizer/models/search_model.dart';
import 'package:flutter/material.dart';

import '../../constraints/constrant.dart';
import '../../models/search_model.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key, required this.number}) : super(key: key);

  final SearchModel number;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<SearchState>(
      valueListenable: number.state,
      builder: (context, state, child) {
        // Default values for styling
        double fontSize = 20;
        Color? backgroundColor = Colors.white;
        double borderWidth = 0.0;
        TextStyle textStyle = TextStyle(
          fontSize: fontSize,
          decoration: TextDecoration.none,
          color: number.color,
        );

        // Customize styling based on the search state
        if (state == SearchState.search) {
          fontSize = 42;
          backgroundColor = Color.fromARGB(255, 208, 161, 192);
          borderWidth = 2.0;
        } else if (state == SearchState.found) {
          fontSize = 42;
          backgroundColor = Constants.primaryColor;
          borderWidth = 2.0;
          //  TextCol
        } else if (state == SearchState.searched) {
          fontSize = 20;
        }

        return AnimatedContainer(
          key: number.key,
          duration: const Duration(milliseconds: 900),
          curve: Curves.ease,
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(
              color: Colors.black.withOpacity(0.3),
              width: borderWidth,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: Offset(0, 2),
              ),
            ],
            // ],
          ),
          child: CustomTextStyle(
            fontSize: fontSize,
            textStyle: textStyle,
            numberValue: number.value.toString(),
          ),
        );
      },
    );
  }
}

class CustomTextStyle extends StatelessWidget {
  const CustomTextStyle({
    Key? key,
    required this.fontSize,
    required this.textStyle,
    required this.numberValue,
  }) : super(key: key);

  final double fontSize;
  final TextStyle textStyle;
  final String numberValue;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedDefaultTextStyle(
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
        style: textStyle,
        child: Text(
          numberValue,
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2),
        ),
      ),
    );
  }
}


    // child: AnimatedContainer(
      //   key: number.key,
      //   duration: const Duration(milliseconds: 900),
      //   curve: Curves.ease,
      //   width: 60,
      //   height: 60,
      //   decoration: BoxDecoration(
      //     border: (number.state.value == SearchState.found)
      //         ? Border.all(
      //             color: Colors.green,
      //           )
      //         : null,
      //     borderRadius: const BorderRadius.all(Radius.circular(5.0)),
      //   ),
      //   child: AnimatedDefaultTextStyle(
      //     curve: Curves.easeOut,
      //     duration: const Duration(milliseconds: 300),
      //     style: TextStyle(
      //       fontSize: fontSize,
      //       decoration: (number.state.value == SearchState.discard)
      //           ? TextDecoration.lineThrough
      //           : TextDecoration.none,
      //       decorationStyle: TextDecorationStyle.solid,
      //       decorationThickness: 1.7,
      //       color: number.color,
      //     ),
      //     child: Center(
      //       child: Text(
      //         number.value.toString(),
      //       ),
      //     ),
      //   ),
      // ),