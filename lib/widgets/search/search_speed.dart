// import 'package:algorithms_visualizer/providers/search/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constraints/constrant.dart';
import '../../providers/search_provider.dart';

class SearchSpeed<T extends SearchProvider> extends StatelessWidget {
  const SearchSpeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Search Speed', style: Theme.of(context).textTheme.caption),
        Consumer<T>(
          builder: (context, provider, child) {
            return Container(
              constraints: const BoxConstraints(maxWidth: 200),
              child: Slider(
                value: provider.executionSpeed,
                onChanged: (value) => provider.executionSpeed = value,
                activeColor: Constants.primaryColor, // Set the primary color
                thumbColor: Constants.primaryColor,
                // overlayColor: Constants.primaryColor
                //     .withOpacity(0.3),
                secondaryActiveColor: Constants.primaryColor,
              ),
            );
          },
        ),
      ],
    );
  }
}
