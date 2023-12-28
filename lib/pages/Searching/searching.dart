import 'package:algo3/constraints/constrant.dart';
import 'package:algo3/providers/search/binary_search_provider.dart';
import 'package:algo3/providers/search/linear_search_provider.dart';
// import 'package:algo3/widgets/search/search_message.dart';
import 'package:flutter/material.dart';

// import '../../widgets/search/linear_search/linear_search_indicator.dart';
// import '../../widgets/search/linear_search/linear_search_visualizer.dart';
// import '../search_page.dart';
import 'search.dart';
import 'search_page.dart';

class Searching extends StatefulWidget {
  final String title;

  const Searching({Key? key, required this.title}) : super(key: key);

  @override
  State<Searching> createState() => _SearchingState();
}

var binary = BinarySearchProvider;
final List<String> SearchAlgo = ['Linear Search', 'Binary Search'];

class _SearchingState extends State<Searching> {
  // ignore: non_constant_identifier_names

  @override
  Widget build(BuildContext context) {
    GlobalKey key = GlobalKey(debugLabel: widget.title);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Constants.primaryColor,
        title: Text(
          widget.title,
          style: const TextStyle(
              fontSize: 20, // Customize text size
              fontWeight: FontWeight.bold, // Make text bold
              color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 9),
        child: Row(
          children: [
            Container(
              width: 340,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 9 / 2,
                  crossAxisCount: 1,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                ),
                itemCount: SearchAlgo.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Constants.primaryColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 30,
                        ),
                      ), // Left icon
                      title: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          SearchAlgo[index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      // subtitle: Text("subtitle"),
                      trailing: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          width: 80,
                          height: 40,
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                if (SearchAlgo[index] == 'Binary Search') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SearchingPage<BinarySearchProvider>(
                                              title: 'Binary Search',
                                            )),
                                  );
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SearchingPage<LinearSearchProvider>(
                                              title: 'LinaerSearch',
                                            )),
                                  );
                                }
                                // if (SearchAlgo[index] == 'Searching') {
                              },
                              // },,
                              child: const Text(
                                'visualizes',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Placeholder(),
          ],
        ),
      ),
    );
  }
}
