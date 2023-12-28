// ignore_for_file: prefer_const_constructors

import 'package:algo3/constraints/constrant.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'showAlgoScreen.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;

  final List<Widget> _pages = [
    ShowAlgoScreen(),
    ShowAlgoScreen(),
    ShowAlgoScreen(),
    ShowAlgoScreen(),
    // ShowAlgoScreen(algo2: algo2, algo1: algo1),
    // ShowAlgoScreen(algo2: algo2, algo1: algo1),
    // ShowAlgoScreen(algo2: algo2, algo1: algo1)
    // HomePage(),
    // FavoritesPage(),
    // CartPage(),
    // ScannerPage(),
    // ProfilePage(),
  ];

  final List<String> items = List.generate(3, (index) => 'Item $index');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3, // Number of tabs
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Row(
              children: [
                Image.asset(
                  'assets/images/TImage.png',
                  width: 40,
                  height: 40,
                ),
                const Text(
                  'Algo Visualzer',
                  style: TextStyle(
                      color: Color(0xFFFF393939),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 109,
                ),
                IconButton(
                    iconSize: 30,
                    color: const Color(0xFFFF393939),
                    onPressed: () {},
                    icon: const Icon(Icons.menu))
              ],
            ),
          ),
          body: _pages[_pageIndex],
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.white,
            animationCurve: Curves.linearToEaseOut,
            color: Constants.primaryColor,
            height: 50,
            items: const <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.home,
                    size: 30,
                  ),
                  // Text('Home'),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite,
                    size: 30,
                  ),
                  // Text('Favorite'),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star,
                    size: 30,
                  ),
                  // Text('Important'),
                ],
              ),
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Icon(Icons.qr_code),
              //     Text('Scan'),
              //   ],
              // ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person,
                    size: 30,
                  ),
                  // Text('Profile'),
                ],
              ),
            ],
            onTap: (index) {
              setState(() {
                _pageIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}


// class RoundedTabBar extends StatelessWidget {
//   final List<Widget> tabs;

//   RoundedTabBar({required this.tabs});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//             // topLeft: Radius.circular(20.0),
//             // topRight: Radius.circular(20.0),
//             // bottomLeft: Radius.circular(20.0),
//             // bottomRight: Radius.circular(20.0)
//             ),
//       ),
//       child: TabBar(
//         labelColor: Colors.white,
//         indicator: const BoxDecoration(
//           borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(25.0),
//               topRight: Radius.circular(25.0),
//               bottomLeft: Radius.circular(25.0),
//               bottomRight: Radius.circular(25.0)),
//           color: Color(0xFFFF393939),
//         ),
//         tabs: tabs,
//       ),
//     );
//   }
// }


/**
 * 
 * 
 * GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: 16.0, // Spacing between columns
                  mainAxisSpacing: 16.0, // Spacing between rows
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  // The builder function for creating each grid item
                  return Card(
                    elevation: 3.0,
                    child: Center(
                      child: Text(items[index]),
                    ),
                  );
                },
              ),
 */