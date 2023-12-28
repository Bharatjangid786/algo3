// import 'package:algorithms_visualizer/providers/sort/sort_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constraints/constrant.dart';
import '../../providers/sort/sort_provider.dart';

class SortSpeed<T extends SortProvider> extends StatelessWidget {
  const SortSpeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '1x',
              style:
                  TextStyle(color: Constants.sortsecondryColor, fontSize: 16),
            ),
            SizedBox(
              width: screenWidth * .17,
            ),
            Text(
              '.5x',
              style:
                  TextStyle(color: Constants.sortsecondryColor, fontSize: 16),
            ),
            SizedBox(
              width: screenWidth * .17,
            ),
            Text(
              '.25x',
              style:
                  TextStyle(color: Constants.sortsecondryColor, fontSize: 16),
            ),
            SizedBox(
              width: screenWidth * .17,
            ),
            Text(
              '.12x',
              style:
                  TextStyle(color: Constants.sortsecondryColor, fontSize: 16),
            ),
            // SizedBox(
            //   width: screenWidth * .17,
            // ),
            // Text(
            //   '5x',
            //   style:
            //       TextStyle(color: Constants.sortsecondryColor, fontSize: 16),
            // ),
          ],
        ),
        Selector<T, double>(
          selector: (context, provider) => provider.executionSpeed,
          builder: (context, executionSpeed, child) {
            return Container(
              constraints: BoxConstraints(maxWidth: screenWidth * .98),
              child: Slider(
                // focusNode: FocusNode(),
                activeColor: Constants.sortsecondryColor,
                value: executionSpeed,
                onChanged: (value) => Provider.of<T>(context, listen: false)
                    .executionSpeed = value,
              ),
            );
          },
        ),
      ],
    );
  }
}
