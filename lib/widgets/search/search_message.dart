// import 'package:algorithms_visualizer/providers/search/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constraints/constrant.dart';
import '../../providers/search_provider.dart';

class SearchMessage<T extends SearchProvider> extends StatefulWidget {
  const SearchMessage({
    Key? key,
  }) : super(key: key);

  @override
  _SearchMessageState<T> createState() => _SearchMessageState<T>();
}

class _SearchMessageState<T extends SearchProvider>
    extends State<SearchMessage<T>> {
  var _fontSize = 16.0;

  var _color = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Selector<T, int>(
        selector: (_, provider) => provider.position,
        builder: (_, position, __) {
          String outputMessage;
          if (position == -2) {
            outputMessage = '';
            _fontSize = 0;
            _color = Colors.black;
          } else if (position == -1) {
            outputMessage = 'Value not found';
            _fontSize = 24;
            _color = const Color.fromARGB(255, 0, 0, 0);
          } else {
            outputMessage =
                'Value found at position: ${(position + 1).toString()}';
            _fontSize = 24;
            _color = Colors.black;
          }
          if (position != -2) {
            return Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                color: Constants.primaryColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Shadow color
                    blurRadius: 4, // Spread of the shadow
                    offset: Offset(0, 2), // Offset of the shadow (x, y)
                  ),
                ],
              ),
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 400),
                curve: Curves.ease,
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      fontSize: _fontSize,
                      color: _color,
                    ),
                child: Center(
                  child: Text(
                    outputMessage,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          }
          return Container(
            height: 50,
          );
        });
  }
}
