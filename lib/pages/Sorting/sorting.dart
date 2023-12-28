// import 'package:algo3/constraints/constrant.dart';
// import 'package:algo3/pages/Sorting/sort.dart';
// import 'package:algo3/providers/search/binary_search_provider.dart';
// import 'package:algo3/providers/search/linear_search_provider.dart';
// import 'package:algo3/providers/sort/bubble_sort_provider.dart';
// import 'package:algo3/providers/sort/insertion_sort_provider.dart';
// import 'package:algo3/providers/sort/quick_sort_provider.dart';
// import 'package:algo3/providers/sort/selection_sort_provider.dart';
// // import 'package:algo3/widgets/search/search_message.dart';
// import 'package:flutter/material.dart';

// // import '../../widgets/search/linear_search/linear_search_indicator.dart';
// // import '../../widgets/search/linear_search/linear_search_visualizer.dart';
// // import '../search_page.dart';
// // import 'search.dart';

// class Sorting extends StatefulWidget {
//   final String title;

//   const Sorting({Key? key, required this.title}) : super(key: key);

//   @override
//   State<Sorting> createState() => _SortingState();
// }

// final List<String> SortAlgo = [
//   'Bubble Sort',
//   'Insertion Sort',
//   'Quick Sort',
//   'Selection Sort'
// ];

// class _SortingState extends State<Sorting> {
//   // ignore: non_constant_identifier_names

//   @override
//   Widget build(BuildContext context) {
//     GlobalKey key = GlobalKey(debugLabel: widget.title);
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Constants.primaryColor,
//         title: Text(
//           widget.title,
//           style: const TextStyle(
//               fontSize: 20, // Customize text size
//               fontWeight: FontWeight.bold, // Make text bold
//               color: Colors.black),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(top: 20, left: 9),
//         child: Row(
//           children: [
//             Container(
//               width: 340,
//               child: GridView.builder(
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   childAspectRatio: 9 / 2,
//                   crossAxisCount: 1,
//                   crossAxisSpacing: 16.0,
//                   mainAxisSpacing: 16.0,
//                 ),
//                 itemCount: SortAlgo.length,
//                 itemBuilder: (context, index) {
//                   return Container(
//                     decoration: BoxDecoration(
//                       color: Constants.primaryColor,
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     child: ListTile(
//                       leading: const Padding(
//                         padding: EdgeInsets.only(top: 20),
//                         child: Icon(
//                           Icons.sort,
//                           color: Colors.black,
//                           size: 30,
//                         ),
//                       ), // Left icon
//                       title: Padding(
//                         padding: const EdgeInsets.only(top: 20),
//                         child: Text(
//                           SortAlgo[index],
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20,
//                           ),
//                         ),
//                       ),
//                       // subtitle: Text("subtitle"),
//                       trailing: Padding(
//                         padding: const EdgeInsets.only(top: 20),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: Colors.black,
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                           width: 80,
//                           height: 40,
//                           child: Center(
//                             child: InkWell(
//                               onTap: () {
//                                 if (SortAlgo[index] == 'Bubble Sort') {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) =>
//                                             SortPage<BubbleSortProvider>(
//                                               title: 'Bubble Sort',
//                                             )),
//                                   );
//                                 } else if (SortAlgo[index] ==
//                                     'Insertion Sort') {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) =>
//                                             SortPage<InsertionSortProvider>(
//                                               title: 'Insertion Sort',
//                                             )),
//                                   );
//                                 } else if (SortAlgo[index] == 'Quick Sort') {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) =>
//                                             SortPage<QuickSortProvider>(
//                                               title: 'Quick Sort',
//                                             )),
//                                   );
//                                 } else {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) =>
//                                             SortPage<SelectionSortProvider>(
//                                               title: 'Selection Sort',
//                                             )),
//                                   );
//                                 }
//                                 // if (SearchAlgo[index] == 'Searching') {
//                               },
//                               // },,
//                               child: const Text(
//                                 'visualizes',
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             // Placeholder(),
//           ],
//         ),
//       ),
//     );
//   }
// }
