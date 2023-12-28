// import 'package:algorithms_visualizer/providers/sort/sort_provider.dart';
import 'package:algo3/constraints/constrant.dart';
import 'package:algo3/providers/sort/sort_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SortButton<T extends SortProvider> extends StatelessWidget {
  const SortButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Selector<BubbleSortProvider, bool>(
    // selector: (_, bubble) => bubble.isSorting,
    // builder: (_, data, child) {
    //   return RaisedButton(
    //       onPressed: data
    //           ? null
    //           : () {
    //               Provider.of<BubbleSortProvider>(context, listen: false)
    //                   .sort();
    //             },
    //       child: child);
    // },
    // child: const Text('Sort'));
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5, top: 4),
          child: Row(
            children: [
              Text(
                "Start",
                style:
                    TextStyle(color: Constants.sortsecondryColor, fontSize: 15),
              )
            ],
          ),
        ),
        Selector<T, bool>(
          selector: (_, provider) => provider!.isSorting,
          builder: (_, isSorting, child) {
            return Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                // margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants
                      .sortsecondryColor, // Customize the color as needed
                ),
                child: Center(
                  child: IconButton(
                    icon: const Icon(Icons.play_arrow),
                    color: Colors.white,
                    onPressed: isSorting
                        ? null
                        : () {
                            Provider.of<T>(context, listen: false).sort();
                          },
                  ),
                ),
              ),
            );

            // InkWell(
            //   child: child,
            //   // color: Colors.blue,
            //   // disabledColor: Colors.blueGrey,
            //   onTap: isSorting
            //       ? null
            //       : () {
            //           Provider.of<T>(context, listen: false).sort();
            //         },
            // );
          },
          child: const Text('Sort',
              style:
                  TextStyle(fontSize: 30, color: Color.fromARGB(255, 5, 5, 5))),
        ),
      ],
    );
  }
}
