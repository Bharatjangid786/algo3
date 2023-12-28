import 'package:algo3/Home.dart';
// import 'package:algo3/widgets/search/search_message.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: screenwidth * .5),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFD1D1),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(180.0),
                        ),
                      ),
                      height: screenHeight * 0.25,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.36,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFD1E1FF),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100.0),
                        topRight: Radius.circular(100.0),
                      ),
                    ),
                    height: screenHeight * 0.39,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 105,
              right: 0,
              left: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/instruction.png',
                    width: 40,
                    height: 40,
                  ),
                  Text(
                    "Set of Instructions",
                    style: TextStyle(
                        color: Color(0xFFFFACB8C2),
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Positioned(
              top: 150,
              right: 0,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Algorithm",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Visualizer",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 70,
              right: 0,
              left: 5,
              child: Image.asset(
                'assets/images/Main.png',
                width: 400,
                height: 700,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 35, right: 130),
        child: SizedBox(
          width: 65,
          height: 65,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            backgroundColor: Colors.black,
            child: Icon(
              Icons.arrow_forward,
              size: 32,
            ),
          ),
        ),
      ),
    );
  }
}

// void main() {
//   runApp(const MaterialApp(
//     home: Homepage(),
//   ));
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title});
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// final List<String> sortItems = [
//   'Bubble Sort',
//   'Insertion Sort',
//   'Selection Sort',
//   // 'Heap Sort',
//   // 'Redox Sort',
// ];
// final List<String> sortImages = [
//   'assets/gif/BubbleSort.gif',
//   'assets/gif/InsertionSort.gif',
//   'assets/gif/selectionSort.gif'
// ];
// final List<String> searchImages = [
//   'assets/gif/linearSearch.gif',
//   'assets/gif/binarySearch.gif'
// ];

// final List<String> searchItems = ['Linear Search', 'Binary Search'];

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     double screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const Text(
//           "Algorithm Visvlizer",
//           style: TextStyle(
//               fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: Home(screenHeight: screenHeight),
//     );
//   }
// }

// class Home extends StatelessWidget {
//   const Home({
//     super.key,
//     required this.screenHeight,
//   });

//   final double screenHeight;

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         color: Colors.white,
//         padding: EdgeInsets.all(screenHeight * 0.016),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             const Text(
//               "Search Algorithms",
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: screenHeight * 0.016),
//             // const Text(
//             //   "Choose a search algorithm to explore:",
//             //   style: TextStyle(
//             //     fontSize: 16,
//             //   ),
//             // ),
//             // SizedBox(height: screenHeight * 0.016),
//             buildGridView(searchItems, context, searchImages),
//             const Divider(),
//             SizedBox(height: screenHeight * 0.016),
//             const Text(
//               "Explore Sorting Algorithms",
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             // SizedBox(height: screenHeight * 0.016),
//             // const Text(
//             //   "Select a sorting algorithm to learn more:",
//             //   style: TextStyle(
//             //     fontSize: 16,
//             //   ),
//             // ),
//             SizedBox(height: screenHeight * 0.016),
//             buildGridView(sortItems, context, sortImages),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Widget buildGridView(
//     List<String> items, dynamic context, List<String> itemsGif) {
//   return GridView.builder(
//     shrinkWrap: true,
//     physics: const NeverScrollableScrollPhysics(),
//     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//       crossAxisCount: 2,
//       childAspectRatio: 1.44,
//       crossAxisSpacing: 10.0,
//       mainAxisSpacing: 10.0,
//     ),
//     itemCount: items.length,
//     itemBuilder: (context, index) {
//       return ItemTile(
//         title: items[index],
//         itemNo: index,
//         imageUrl: itemsGif[index], // Pass the image URLs
//       );
//     },
//   );
// }

// class ItemTile extends StatelessWidget {
//   final int itemNo;
//   final String title;
//   final String imageUrl;
//   ItemTile({required this.itemNo, required this.title, required this.imageUrl});

//   @override
//   Widget build(BuildContext context) {
//     final Color color = Theme.of(context).primaryColor;
//     double screenHeight = MediaQuery.of(context).size.height;
//     return Container(
//       // height: 200,
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(8.0),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.5),
//             spreadRadius: 2,
//             blurRadius: 4,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: InkWell(
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) =>
//                     SearchMessage2()), // Replace SecondScreen with the screen you want to navigate to.
//           );
//         },
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Image.asset(imageUrl), // Display the image
//             // SizedBox(height: 8),
//             if (title == 'Linear Search')
//               SizedBox(height: screenHeight * 0.018),
//             Text(
//               title,
//               style: const TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
