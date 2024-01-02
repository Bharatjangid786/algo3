// ignore_for_file: invalid_use_of_protected_member, unused_field

import 'package:algo3/Home.dart';
import 'package:algo3/constraints/constrant.dart';
import 'package:algo3/providers/sort/selection_sort_provider.dart';
import 'package:algo3/showAlgoScreen.dart';
import 'package:algo3/widgets/sort/sort_speed.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../providers/sort/bubble_sort_provider.dart';
import '../../providers/sort/insertion_sort_provider.dart';
import '../../providers/sort/quick_sort_provider.dart';
import '../../providers/sort/sort_provider.dart';
import '../../widgets/sort/sort_button.dart';
import '../../widgets/sort/sort_visualizer.dart';

class SortPage<T extends SortProvider> extends StatefulWidget {
  const SortPage({Key? key, required this.title, this.blockSize = 100})
      // ignore: unnecessary_null_comparison
      : assert(title != null),
        super(key: key);

  final String title;
  final double blockSize;

  @override
  _SortPageState<T> createState() => _SortPageState<T>();
}

class _SortPageState<T extends SortProvider> extends State<SortPage<T>> {
  void _goBack(BuildContext context) {
    Provider.of<BubbleSortProvider>(context, listen: false).reset();
    Navigator.pop(context);
  }

  void updateComplexities(String title) {
    setState(() {
      if (widget.title == 'Bubble Sort') {
        worstTimeComplexity = Constants.bubbleSortworstTimeComplexity;
        goodTimeComplexity = Constants.bubbleSortgoodTimeComplexity;
        avgTimeComplexity = Constants.bubbleSortavgTimeComplexity;
        worstSpaceComplexity = Constants.bubbleSortworstSpaceComplexity;
        description = Constants.bubbleSort;
      } else if (widget.title == 'Insertion Sort') {
        worstTimeComplexity = Constants.InsertionSortworstTimeComplexity;
        goodTimeComplexity = Constants.InsertionSortgoodTimeComplexity;
        avgTimeComplexity = Constants.InsertionSortavgTimeComplexity;
        worstSpaceComplexity = Constants.InsertionSortworstSpaceComplexity;
        description = Constants.InsertionSort;
      } else if (widget.title == 'Quick Sort') {
        worstTimeComplexity = Constants.QuickSortworstTimeComplexity;
        goodTimeComplexity = Constants.QuickSortgoodTimeComplexity;
        avgTimeComplexity = Constants.QuickSortavgTimeComplexity;
        worstSpaceComplexity = Constants.QuickSortworstSpaceComplexity;
        description = Constants.QuickSort;
      } else {
        worstTimeComplexity = Constants.SelectionSortworstTimeComplexity;
        goodTimeComplexity = Constants.SelectionSortgoodTimeComplexity;
        avgTimeComplexity = Constants.SelectionSortavgTimeComplexity;
        worstSpaceComplexity = Constants.SelectionSortworstSpaceComplexity;
        description = Constants.SelectionSort;
      }
    });
  }

  final TextEditingController _sizeEditingController = TextEditingController();
  final TextEditingController _elementEditingController =
      TextEditingController();
  String worstTimeComplexity = "";
  String goodTimeComplexity = "";
  String avgTimeComplexity = "";
  String worstSpaceComplexity = "";
  String description = "Bharat";
  bool show = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return LayoutBuilder(builder: (_, constraints) {
      return MaterialApp(
          home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            elevation: 0,
            backgroundColor: const Color.fromRGBO(47, 50, 55, 255),
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.sortsecondryColor,
                ),
                child: Center(
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        Navigator.pop(context);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => HomePage()),
                        // );
                        // _scaffoldKey.currentState?.openEndDrawer();
                      });
                    },
                  ),
                ),
              ),
            ),
            title: Center(
              child: Text(
                widget.title,
                style:
                    TextStyle(color: Constants.sortsecondryColor, fontSize: 25),
              ),
            ),
          ),
          endDrawer: Drawer(
            width: screenWidth * 0.8,
            backgroundColor: Constants.primaryColor,
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Container(
                  height: 50,
                  decoration: const BoxDecoration(
                      // border: Border(
                      //   bottom: BorderSide(
                      //     color: Constants.sortsecondryColor,
                      //     width: 2.0,
                      //   ),
                      // ),
                      ),
                  child: Center(
                    child: Text(
                      'Algorithms',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Constants.sortsecondryColor,
                      ),
                    ),
                  ),
                ),
                buildDrawerItem('Bubble Sort'),
                buildDrawerItem('Insertion Sort'),
                buildDrawerItem('Quick Sort'),
                buildDrawerItem('Selection Sort'),
                const SizedBox(
                  height: 300,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Constants.sortsecondryColor,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  trailing: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.settings)),
                  title: Text(
                    'Setting',
                    style: TextStyle(
                      fontSize: 20,
                      color: Constants.sortsecondryColor,
                    ),
                  ),
                  onTap: () {
                    // Handle drawer item tap
                    Navigator.pop(context);
                  },
                ),
                // buildDrawerItem(),
              ],
            ),
          ),
          body: SlidingUpPanel(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            panelSnapping: false,
            minHeight: MediaQuery.of(context).size.height - 720,
            maxHeight: double.maxFinite,
            panel: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        height: 900,
                        decoration: BoxDecoration(
                          color: Constants.primaryColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Row(
                                children: [
                                  SortSpeed<T>(),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 5),
                                          child: Row(
                                            children: [
                                              Text(
                                                "custom",
                                                style: TextStyle(
                                                    color: Constants
                                                        .sortsecondryColor,
                                                    fontSize: 15),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Constants.sortsecondryColor,
                                          ),
                                          child: Center(
                                            child: IconButton(
                                              icon: const Icon(Icons.tune),
                                              color: Colors.white,
                                              onPressed: () {
                                                AddElmentsSizeOfArray(context);
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 5),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Size",
                                                style: TextStyle(
                                                    color: Constants
                                                        .sortsecondryColor,
                                                    fontSize: 15),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Constants.sortsecondryColor,
                                          ),
                                          child: Center(
                                            child: IconButton(
                                              icon: const Icon(Icons.bar_chart),
                                              color: Colors.white,
                                              onPressed: () {
                                                genrateSizeOfArray(context);
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 5),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Reset",
                                                style: TextStyle(
                                                    color: Constants
                                                        .sortsecondryColor,
                                                    fontSize: 15),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Constants.sortsecondryColor,
                                          ),
                                          child: Center(
                                            child: IconButton(
                                              icon: const Icon(Icons.replay),
                                              color: Colors.white,
                                              onPressed: () {
                                                Provider.of<T>(context,
                                                        listen: false)
                                                    .reset();
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SortButton<T>(),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * .05,
                            ),
                            if (show == false)
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      updateComplexities(widget.title);
                                      show = true;
                                    });
                                  },
                                  child: const Text("cheack")),
                            if (show == true)
                              Padding(
                                padding:
                                    EdgeInsets.only(left: screenWidth * .06),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.title,
                                      style: TextStyle(
                                          color: Constants.sortsecondryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )
                                  ],
                                ),
                              ),
                            if (show == true)
                              Padding(
                                padding: EdgeInsets.only(
                                    left: screenWidth * .06,
                                    top: screenHeight * .02),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      description,
                                      style: TextStyle(
                                          color: Constants.sortsecondryColor,
                                          // fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    )
                                  ],
                                ),
                              ),
                            if (show == true)
                              Padding(
                                padding: EdgeInsets.only(
                                    left: screenWidth * .06,
                                    top: screenHeight * .01),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Time Complexity",
                                      style: TextStyle(
                                          color: Constants.sortsecondryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: screenWidth * .06),
                                      child: Text(
                                        "Space Complexity",
                                        style: TextStyle(
                                            color: Constants.sortsecondryColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if (show == true)
                              Padding(
                                padding: EdgeInsets.only(
                                    left: screenWidth * .06,
                                    top: screenHeight * .01),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Worst Case: ",
                                          style: TextStyle(
                                              color:
                                                  Constants.sortsecondryColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17),
                                        ),
                                        Text(
                                          worstTimeComplexity,
                                          style: TextStyle(
                                              color:
                                                  Constants.sortsecondryColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: screenWidth * .06),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Worst Case: ",
                                            style: TextStyle(
                                                color:
                                                    Constants.sortsecondryColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17),
                                          ),
                                          Text(
                                            worstSpaceComplexity,
                                            style: TextStyle(
                                                color:
                                                    Constants.sortsecondryColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if (show == true)
                              Padding(
                                padding: EdgeInsets.only(
                                    left: screenWidth * .06,
                                    top: screenHeight * .01),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Average Case: ",
                                      style: TextStyle(
                                          color: Constants.sortsecondryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: screenWidth * .06),
                                      child: Text(
                                        avgTimeComplexity,
                                        style: TextStyle(
                                            color: Constants.sortsecondryColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if (show == true)
                              Padding(
                                padding: EdgeInsets.only(
                                    left: screenWidth * .06,
                                    top: screenHeight * .01),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Best Case: ",
                                      style: TextStyle(
                                          color: Constants.sortsecondryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: screenWidth * .06),
                                      child: Text(
                                        goodTimeComplexity,
                                        style: TextStyle(
                                            color: Constants.sortsecondryColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if (show == true && widget.title == 'Bubble Sort')
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: screenWidth * .9,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        border: Border.all(
                                          // color: Colors.blue,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text(
                                          Constants.binaryCCode,
                                          style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    child: Container(
                      height: 600,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              width: constraints.maxWidth,
                              child: Center(
                                child: SortVisualizer<T>(
                                  blockSize: widget.blockSize,
                                  width: constraints.maxWidth,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ));
    });
  }

  Widget buildDrawerItem(String itemName) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(),
      child: ListTile(
        title: Text(
          itemName,
          style: TextStyle(
            fontSize: 20,
            color: Constants.sortsecondryColor,
          ),
        ),
        onTap: () {
          // setState(() {
          //   updateComplexities(widget.title);
          // });
          if (itemName == 'Bubble Sort') {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const SortPage<BubbleSortProvider>(
                        title: 'Bubble Sort',
                      )),
            );
          } else if (itemName == 'Insertion Sort') {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const SortPage<InsertionSortProvider>(
                        title: 'Insertion Sort',
                      )),
            );
          } else if (itemName == 'Quick Sort') {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const SortPage<QuickSortProvider>(
                        title: 'Quick Sort',
                      )),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const SortPage<SelectionSortProvider>(
                        title: 'Selection Sort',
                      )),
            );
          }
        },
      ),
    );
  }

  Future<dynamic> AddElmentsSizeOfArray(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Constants.primaryColor,
          title: const Center(child: Text('Add Element ...')),
          content: Container(
            height: 100,
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: TextField(
                    controller: _elementEditingController,
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                      hintText: 'Enter Numbers...',
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(74, 77, 84, 1)),
                      ),
                      onPressed: () {
                        setState(() {});
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel'),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(37, 40, 47, 1.0)),
                      ),
                      onPressed: () {
                        setState(() {
                          Provider.of<T>(context, listen: false)
                              .addElement(_elementEditingController);

                          Navigator.of(context).pop();
                          _elementEditingController.clear();
                        });
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> genrateSizeOfArray(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Constants.primaryColor,
          title: const Center(child: Text('Size Of Array')),
          content: Container(
            height: 100,
            child: Column(
              children: [
                Expanded(
                  child: TextField(
                    controller: _sizeEditingController,
                    decoration: const InputDecoration(
                      hintText: 'Enter Size...',
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(74, 77, 84, 1)),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel'),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(37, 40, 47, 1.0)),
                      ),
                      onPressed: () {
                        setState(() {
                          Provider.of<T>(context, listen: false)
                              .genratedSize(_sizeEditingController);

                          Navigator.of(context).pop();
                        });
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
