import 'package:algo3/StartPage.dart';
import 'package:algo3/providers/String_Algorithm/kadane_provider.dart';
import 'package:algo3/providers/search/combinationprovider.dart';
import 'package:algo3/providers/search_provider.dart';
import 'package:algo3/providers/sort/bubble_sort_provider.dart';
import 'package:algo3/providers/sort/insertion_sort_provider.dart';
import 'package:algo3/providers/sort/quick_sort_provider.dart';
import 'package:algo3/providers/sort/selection_sort_provider.dart';
import 'package:flutter/material.dart';
// import 'package:algorithms_visualizer/providers/sort/insertion_sort_provider.dart';
// import 'package:algorithms_visualizer/providers/sort/quick_sort_provider.dart';
// import 'package:algorithms_visualizer/providers/sort/selection_sort_provider.dart';
// import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:algorithms_visualizer/providers/search/linear_search_provider.dart';
// import 'package:algorithms_visualizer/providers/search/binary_search_provider.dart';
// import 'package:algorithms_visualizer/providers/sort/bubble_sort_provider.dart';
// import 'package:algorithms_visualizer/ux/pages/home/home.dart';

import 'providers/search/binary_search_provider.dart';
import 'providers/search/linear_search_provider.dart';
// import 'providers/sort/bubble_sort_provider.dart';
// import 'providers/sort/insertion_sort_provider.dart';
// import 'providers/sort/selection_sort_provider.dart';
// import 'widgets/search/linear_search/linear_search.dart';
// import 'widgets/search/search_message.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => kadaneProvider()),
      ChangeNotifierProvider(create: (_) => LinearSearchProvider()),
      ChangeNotifierProvider(create: (_) => BinarySearchProvider()),
      ChangeNotifierProvider(create: (_) => BubbleSortProvider()),
      ChangeNotifierProvider(create: (_) => InsertionSortProvider()),
      ChangeNotifierProvider(create: (_) => SelectionSortProvider()),
      ChangeNotifierProvider(create: (_) => QuickSortProvider())
    ],
    child: const MyApp(),
  )

      // MaterialApp(
      //   home: MultiProvider(providers: [
      //     ChangeNotifierProvider(create: (_) => LinearSearchProvider()),
      //     // ... other providers
      //   ], child: StartPage()),
      // ),
      );
}

// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Algorithm Explorer',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: const Scaffold(
        body: StartPage(),

        // MultiProvider(providers: [
        // ChangeNotifierProvider(create: (_) => LinearSearchProvider()),
        // ChangeNotifierProvider(
        //   create: (_) => LinearSearchProvider(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => LinearSearchProvider(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => BinarySearchProvider(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => BubbleSortProvider(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => InsertionSortProvider(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => QuickSortProvider(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => SelectionSortProvider(),
        // )
        // ], child:

        // ),
      ),
    );
  }
}
