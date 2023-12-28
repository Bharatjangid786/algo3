// // import 'package:algorithms_visualizer/providers/search/binary_search_provider.dart';
// // import 'package:algorithms_visualizer/providers/search/linear_search_provider.dart';
// // import 'package:algorithms_visualizer/providers/sort/bubble_sort_provider.dart';
// // import 'package:algorithms_visualizer/providers/sort/insertion_sort_provider.dart';
// // import 'package:algorithms_visualizer/providers/sort/quick_sort_provider.dart';
// // import 'package:algorithms_visualizer/providers/sort/selection_sort_provider.dart';
// // import 'package:algorithms_visualizer/ux/pages/search_page.dart';
// // import 'package:algorithms_visualizer/ux/pages/sort_page.dart';
// import 'package:algo3/providers/search/binary_search_provider.dart';
// import 'package:algo3/providers/search/linear_search_provider.dart';
// import 'package:flutter/material.dart';

// import '../pages/search_page.dart';

// class PagesProvider extends ChangeNotifier {
//   String categoryKey = 'Search';

//   // final _searchPages = [
//   //   SearchPage<LinearSearchProvider>(title: 'Linear Search'),
//   //   SearchPage<BinarySearchProvider>(title: 'Binary Search'),
//   // ];
//   // final _sortPages = [
//   //    SortPage<SelectionSortProvider>(title: 'Selection Sort'),
//   //    SortPage<QuickSortProvider>(
//   //     title: 'Quick Sort',
//   //     blockSize: 70,
//   //   ),
//   //    SortPage<BubbleSortProvider>(title: 'Bubble Sort'),
//   //    SortPage<InsertionSortProvider>(
//   //     title: 'Insertion Sort',
//   //   ),
//   // ];

//   void changeKey(String key) {
//     categoryKey = key;
//     notifyListeners();
//   }

//   List<StatelessWidget> get pages {
//     // if (categoryKey == 'Search') {
//     //   return
//     // }
//     switch (categoryKey) {
//       case 'Search':
//         return _searchPages;
//         // ignore: dead_code
//         break;
//       // case 'Sort':
//       //   return _sortPages;
//       //   // ignore: dead_code
//       //   break;
//       default:
//         return _searchPages;
//         // ignore: dead_code
//         break;
//     }
//   }
// }
