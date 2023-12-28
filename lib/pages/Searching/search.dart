// import 'package:algo3/widgets/search/linear_search/linear_search_speed.dart';
// ignore_for_file: invalid_use_of_protected_member

import 'package:algo3/providers/search_provider.dart';
import 'package:algo3/widgets/search/search_indicator.dart';
import 'package:algo3/widgets/search/search_visualizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
// import 'package:algo3/constraints/constraint.dart';
// import 'package:algo3/widgets/search/linear_search/linear_search_visualizer.dart';

import '../../constraints/constrant.dart';
import '../../providers/search/linear_search_provider.dart';
// import '../../widgets/search/linear_search/linear_search.dart';
// import '../../widgets/search/linear_search/linear_search_indicator.dart';
// import '../../widgets/search/linear_search/linear_search_message.dart';
// import '../../widgets/search/search_speed.dart';
import 'package:flutter/material.dart';

import '../../widgets/search/search.dart';
import '../../widgets/search/search_message.dart';
import '../../widgets/search/search_speed.dart';

class SearchingPage<T extends SearchProvider> extends StatefulWidget {
  SearchingPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  _SearchingPageState<T> createState() => _SearchingPageState<T>();
}

class _SearchingPageState<T extends SearchProvider>
    extends State<SearchingPage<T>> {
  final TextEditingController _elementEditingController =
      TextEditingController();
  final TextEditingController _sizeEditingController = TextEditingController();
  void _goBack(BuildContext context) {
    Provider.of<T>(context, listen: false).reset();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey key = GlobalKey(debugLabel: widget.title);
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Constants.primaryColor,
            title: Text(
              widget.title,
              style: const TextStyle(color: Colors.black),
            ),
            bottom: const TabBar(
              indicatorColor: Colors.black,
              tabs: [
                Tab(
                    child: Text(
                  'Visulizaton',
                  style: TextStyle(color: Colors.black),
                )),
                Tab(
                    child: Text(
                  'code',
                  style: TextStyle(color: Colors.black),
                ))
              ],
            ),
            leading: IconButton(
              onPressed: () {
                _goBack(context);
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
          body: TabBarView(
            children: [
              // Center(
              //   child: Search<T>(),
              // ),
              SingleChildScrollView(
                child: Stack(
                  // clipBehavior: ,
                  key: key,
                  children: <Widget>[
                    Container(
                      height: 700,
                      // color: Colors.amber,
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 32.0),
                            child: Text(
                              widget.title,
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          ),
                          const SizedBox(height: 24),
                          //Below can not be constant
                          Expanded(
                            child: SearchVisualizer<T>(),
                          ),
                          SearchMessage<T>(),
                          SizedBox(height: 24),
                          SearchSpeed<T>(),
                          Search<T>(),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 5),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Size",
                                            style: TextStyle(
                                                color:
                                                    Constants.sortsecondryColor,
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
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 5),
                                      child: Row(
                                        children: [
                                          Text(
                                            "custom",
                                            style: TextStyle(
                                                color:
                                                    Constants.sortsecondryColor,
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
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 5),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Reset",
                                            style: TextStyle(
                                                color:
                                                    Constants.sortsecondryColor,
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
                              ],
                            ),
                          ),

                          SizedBox(height: 24),
                        ],
                      ),
                    ),
                    SearchIndicator<T>(
                      parentKey: key,
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(221, 31, 30, 30),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 300,
                        child: CopyableTextContainer(
                          title: widget.title,
                          // text: ,
                        ),
                      ),
                    ),
                    const Text("Explantion",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Constants.primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 200,
                        width: double.infinity,
                        child: Center(
                          child: Text(Constants.linaerSearch,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 14)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
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
                          setState(() {
                            Provider.of<T>(context, listen: false)
                                .addElement(_elementEditingController);
                          });

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
                          setState(() {
                            Provider.of<T>(context, listen: false)
                                .genratedSize(_sizeEditingController);
                          });

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

class CopyableTextContainer extends StatefulWidget {
  final String title;

  CopyableTextContainer({required this.title});

  @override
  State<CopyableTextContainer> createState() => _CopyableTextContainerState();
}

class _CopyableTextContainerState extends State<CopyableTextContainer> {
  void _copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Code Copied')),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.title == 'Binary Search') {
      return DefaultTabController(
        length: 4,
        child: Column(
          children: [
            const TabBar(
              isScrollable: true,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.white,
              indicatorColor: Colors.black,
              tabs: [
                Tab(
                  child: Text(
                    'C',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  text: 'C++',
                ),
                Tab(
                  text: 'Java',
                ),
                Tab(
                  text: 'Python',
                ),
              ],
            ),
            Container(
              height: 250,
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: TabBarView(
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          Constants.binaryCCode,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                          icon: const Icon(Icons.copy, color: Colors.white),
                          onPressed: () {
                            _copyToClipboard(context, Constants.binaryCCode);
                          },
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          Constants.binaryCppCode,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                          icon: const Icon(Icons.copy, color: Colors.white),
                          onPressed: () {
                            _copyToClipboard(context, Constants.binaryCppCode);
                          },
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          Constants.binaryJavaCode,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                          icon: const Icon(Icons.copy, color: Colors.white),
                          onPressed: () {
                            _copyToClipboard(context, Constants.binaryJavaCode);
                          },
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          Constants.binaryPythonCode,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                          icon: const Icon(Icons.copy, color: Colors.white),
                          onPressed: () {
                            _copyToClipboard(
                                context, Constants.binaryPythonCode);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      return DefaultTabController(
        length: 4,
        child: Column(
          children: [
            const TabBar(
              isScrollable: true,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.white,
              indicatorColor: Colors.black,
              tabs: [
                Tab(
                  child: Text(
                    'C',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  text: 'C++',
                ),
                Tab(
                  text: 'Java',
                ),
                Tab(
                  text: 'Python',
                ),
              ],
            ),
            Container(
              height: 250,
              width: 330,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: TabBarView(
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          Constants.linearCCode,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                          icon: const Icon(Icons.copy, color: Colors.white),
                          onPressed: () {
                            _copyToClipboard(context, Constants.linearCCode);
                          },
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          Constants.linearCppCode,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                          icon: const Icon(Icons.copy, color: Colors.white),
                          onPressed: () {
                            _copyToClipboard(context, Constants.linearCppCode);
                          },
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          Constants.linearJavaCode,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                          icon: const Icon(Icons.copy, color: Colors.white),
                          onPressed: () {
                            _copyToClipboard(context, Constants.linearJavaCode);
                          },
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          Constants.linearPythonCode,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                          icon: const Icon(Icons.copy, color: Colors.white),
                          onPressed: () {
                            _copyToClipboard(
                                context, Constants.linearPythonCode);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
