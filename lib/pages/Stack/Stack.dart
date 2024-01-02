import 'package:algo3/constraints/constrant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:algo3/constraints/constrant.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:clipboard/clipboard.dart';

class StackPage extends StatefulWidget {
  @override
  State<StackPage> createState() => _StackPageState();
}

class _StackPageState extends State<StackPage> {
  late List<int> integerList = [];
  int size = 3;

  final TextEditingController _sizeEditingController = TextEditingController();
  final TextEditingController _elementEditingController =
      TextEditingController();

  void addElement() {
    if (size > integerList.length) {
      setState(() {
        int nextElement = int.parse(_elementEditingController.text);
        integerList.add(nextElement);
        _elementEditingController.clear();
      });
    }
  }

  bool pushisCopied = false;
  bool popisCopied = false;
  bool topiscopied = false;
  bool Fulliscopied = false;
  void removeElement() {
    if (integerList.isNotEmpty) {
      setState(() {
        integerList.removeLast();
      });
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Your Stack is Empty ..'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Close'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
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
                  pushisCopied = false;
                  popisCopied = false;
                  Fulliscopied = false;
                  topiscopied = false;
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ),
        title: Padding(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * .23),
          child: Text(
            "Stack",
            style: TextStyle(color: Constants.sortsecondryColor, fontSize: 25),
          ),
        ),
      ),
      body: SlidingUpPanel(
        panelSnapping: false,
        minHeight: MediaQuery.of(context).size.height - 730,
        maxHeight: double.maxFinite,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        body: Column(
          children: [
            const SizedBox(height: 100),
            Center(
              child: Hero(
                tag:
                    'stack_list', // Specify a unique tag for the Hero animation
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: 150,
                  height: size * 60,
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(color: Colors.black, width: 2.0),
                      right: BorderSide(color: Colors.black, width: 2.0),
                      bottom: BorderSide(color: Colors.black, width: 2.0),
                    ),
                  ),
                  child: ListView.builder(
                    reverse: true,
                    itemCount: integerList.length,
                    itemBuilder: (context, index) {
                      final int value = integerList[index];
                      return Hero(
                        tag: 'item_$index', // Use a unique tag for each item
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 500),
                          opacity: 1.0,
                          child: ListTile(
                            title: Container(
                              color: Constants.primaryColor,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    '$value',
                                    style: const TextStyle(fontSize: 16),
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
              ),
            ),
          ],
        ),
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
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buildIconButton("Push", Icons.layers, () {
                                if (size > integerList.length) {
                                  AddElmentsSizeOfArray(context);
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title:
                                            const Text('Your Stack is Full ..'),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('Close'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              }),
                              buildIconButton("Pop", Icons.remove, () {
                                removeElement();
                              }),
                              buildIconButton("Size", Icons.bar_chart, () {
                                genrateSizeOfArray(context);
                              }),
                              buildIconButton("Top", Icons.vertical_align_top,
                                  () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Row(
                                        children: [
                                          const Text("Top Element: "),
                                          Text(
                                            integerList.isNotEmpty
                                                ? '${integerList.last}'
                                                : '',
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              }),
                              // SortButton<T>(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * .01,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: screenWidth * .06, top: screenHeight * .02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Explanation",
                                style: TextStyle(
                                    color: Constants.sortsecondryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: screenWidth * .06, top: screenHeight * .02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                Constants.StackDesc,
                                style: TextStyle(
                                    color: Constants.sortsecondryColor,
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: screenWidth * .06,
                                    top: screenHeight * .01),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Operations",
                                      style: TextStyle(
                                          color: Constants.sortsecondryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: screenWidth * .06,
                                    top: screenHeight * .01),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "1.Push",
                                      style: TextStyle(
                                          color: Constants.sortsecondryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: screenWidth * 0.06,
                                    top: screenHeight * 0.01),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          width: screenWidth * 0.88,
                                          height: screenHeight * 0.07,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  left: screenWidth * 0.04,
                                                  top: screenHeight * 0.01,
                                                ),
                                                child: const Text(
                                                  "myStack.push(value)",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          top: 0,
                                          right: 0,
                                          child: IconButton(
                                              icon: Icon(
                                                pushisCopied
                                                    ? Icons.check
                                                    : Icons.content_copy,
                                                color: Colors.white,
                                              ),
                                              onPressed: () {
                                                // Copy the text to the clipboard
                                                FlutterClipboard.copy(
                                                        "myStack.push(value)")
                                                    .then((value) {
                                                  // Show a toast message indicating successful copy

                                                  // Update the state to change the icon
                                                  setState(() {
                                                    pushisCopied = true;
                                                    popisCopied = false;
                                                  });
                                                });
                                              }),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: screenWidth * .06,
                                    top: screenHeight * .01),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "2.Pop",
                                      style: TextStyle(
                                          color: Constants.sortsecondryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    )
                                  ],
                                ),
                              ),
                              Stack(
                                children: [
                                  Container(
                                    width: screenWidth * 0.88,
                                    height: screenHeight * 0.07,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: screenWidth * 0.04,
                                            top: screenHeight * 0.01,
                                          ),
                                          child: const Text(
                                            "myStack.pop()",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: IconButton(
                                        icon: Icon(
                                          popisCopied
                                              ? Icons.check
                                              : Icons.content_copy,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          // Copy the text to the clipboard
                                          FlutterClipboard.copy("myStack.pop()")
                                              .then((value) {
                                            // Show a toast message indicating successful copy

                                            // Update the state to change the icon
                                            setState(() {
                                              popisCopied = true;
                                              pushisCopied = false;
                                              topiscopied = false;
                                              Fulliscopied = false;
                                            });
                                          });
                                        }),
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: screenWidth * .06,
                                    top: screenHeight * .01),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "3.Top",
                                      style: TextStyle(
                                          color: Constants.sortsecondryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    )
                                  ],
                                ),
                              ),
                              Stack(
                                children: [
                                  Container(
                                    width: screenWidth * 0.88,
                                    height: screenHeight * 0.07,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: screenWidth * 0.04,
                                            top: screenHeight * 0.01,
                                          ),
                                          child: const Text(
                                            "int x =myStack.Top()",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: IconButton(
                                        icon: Icon(
                                          topiscopied
                                              ? Icons.check
                                              : Icons.content_copy,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          // Copy the text to the clipboard
                                          FlutterClipboard.copy(
                                                  "int x =myStack.Top()")
                                              .then((value) {
                                            // Show a toast message indicating successful copy

                                            // Update the state to change the icon
                                            setState(() {
                                              topiscopied = true;
                                              Fulliscopied = false;
                                              popisCopied = false;
                                              pushisCopied = false;
                                            });
                                          });
                                        }),
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: screenWidth * .06,
                                    top: screenHeight * .01),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "4.isFull",
                                      style: TextStyle(
                                          color: Constants.sortsecondryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    )
                                  ],
                                ),
                              ),
                              Stack(
                                children: [
                                  Container(
                                    width: screenWidth * 0.88,
                                    height: screenHeight * 0.07,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: screenWidth * 0.04,
                                            top: screenHeight * 0.01,
                                          ),
                                          child: const Text(
                                            "Bool x =myStack.isFull()",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: IconButton(
                                        icon: Icon(
                                          Fulliscopied
                                              ? Icons.check
                                              : Icons.content_copy,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          // Copy the text to the clipboard
                                          FlutterClipboard.copy(
                                                  "myStack.push(value)")
                                              .then((value) {
                                            // Show a toast message indicating successful copy

                                            // Update the state to change the icon
                                            setState(() {
                                              topiscopied = false;
                                              Fulliscopied = true;
                                              popisCopied = false;
                                              pushisCopied = false;
                                            });
                                          });
                                        }),
                                  )
                                ],
                              ),
                              // Padding(
                              //   padding: EdgeInsets.only(
                              //       left: screenWidth * .06,
                              //       top: screenHeight * .01),
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.start,
                              //     children: [
                              //       Text(
                              //         "4.isFull",
                              //         style: TextStyle(
                              //             color: Constants.sortsecondryColor,
                              //             fontWeight: FontWeight.bold,
                              //             fontSize: 18),
                              //       )
                              //     ],
                              //   ),
                              // ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildIconButton(String label, IconData icon, Function() onPressed) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Row(
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: Constants.sortsecondryColor,
                    fontSize: 15,
                  ),
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
                icon: Icon(icon),
                color: Colors.white,
                onPressed: onPressed,
              ),
            ),
          ),
        ],
      ),
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
                        if (integerList.length >
                            int.parse(_sizeEditingController.text)) {
                          while (integerList.length !=
                              int.parse(_sizeEditingController.text)) {
                            removeElement();
                          }
                        }
                        setState(() {
                          size = int.parse(_sizeEditingController.text);
                          Navigator.of(context).pop();
                          _sizeEditingController.clear();
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
                    decoration: const InputDecoration(
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
                        if (size > integerList.length) {
                          addElement();
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Your Stack is Full ..'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Close'),
                                  ),
                                ],
                              );
                            },
                          );
                        }

                        Navigator.of(context).pop();
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
