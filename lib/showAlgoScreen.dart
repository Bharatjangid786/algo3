import 'package:algo3/pages/Searching/search_page.dart';
import 'package:algo3/pages/Searching/searching.dart';
import 'package:algo3/pages/Sorting/sorting.dart';
import 'package:algo3/pages/String_Algo/Kadane_Algorithm.dart';
import 'package:algo3/providers/String_Algorithm/kadane_provider.dart';
import 'package:algo3/providers/sort/bubble_sort_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'constraints/constrant.dart';
import 'pages/Sorting/sort.dart';
import 'providers/search/binary_search_provider.dart';

class ShowAlgoScreen extends StatefulWidget {
  ShowAlgoScreen({
    super.key,
  });
  final List<String> algo2 = ['Searching', 'Sorting', 'Hashing'];
  final List<String> algo1 = ['String', 'LinkList', 'Tree', 'Graph'];
  @override
  State<ShowAlgoScreen> createState() => _ShowAlgoScreenState();
}

class _ShowAlgoScreenState extends State<ShowAlgoScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Row(
          children: [
            const SizedBox(
              width: 15,
            ),
            Container(
              width: 150,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 3.8 / 4,
                  crossAxisCount: 1,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                ),
                itemCount: widget.algo2.length,
                itemBuilder: (context, index) {
                  return Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Container(
                        height: 100,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Constants.primaryColor,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.algo2[index],
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              width: 80,
                              height: 40,
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    if (widget.algo2[index] == 'Searching') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Searching(
                                                  title: 'Searching',
                                                )),
                                      );
                                    }
                                    if (widget.algo2[index] == 'Sorting') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SortPage<BubbleSortProvider>(
                                                  title: 'Bubble Sort',
                                                )),
                                      );
                                    }
                                  },
                                  child: const Text(
                                    'Show',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ));
                },
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                width: 150,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 5 / 4,
                    crossAxisCount: 1,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                  ),
                  itemCount: widget.algo1.length,
                  itemBuilder: (context, index) {
                    return Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Container(
                          height: 150,
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Constants.primaryColor,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.algo1[index],
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 16),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                width: 80,
                                height: 40,
                                child: Center(
                                  child: InkWell(
                                    onTap: () {
                                      if (widget.algo1[index] == 'String') {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => kadane_Page<
                                                      kadaneProvider>(
                                                    title: 'Binary Search',
                                                  )),
                                        );
                                      }
                                    },
                                    child: const Text(
                                      'Show',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
