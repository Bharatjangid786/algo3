import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../providers/search_provider.dart';

class searchPage<T extends SearchProvider> extends StatefulWidget {
  const searchPage({
    Key? key,
    required this.title,
  });
  final title;

  @override
  // ignore: library_private_types_in_public_api
  _searchPageState<T> createState() => _searchPageState<T>();
}

class _searchPageState<T extends SearchProvider> extends State<searchPage<T>> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.amber,
            ),
          ),
        ),
      ),
      body: SlidingUpPanel(
        // isDraggable: false,
        // snapPoint: 0.3,

        panelSnapping: false,
        minHeight: MediaQuery.of(context).size.height - 650,
        maxHeight: double.maxFinite,

        panel: SingleChildScrollView(
          // dragStartBehavior: DragStartBehavior,
          child: Column(
            children: [
              Text('Sliding Panel'),
              Container(
                height: 900,
                color: Colors.black,
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Container(
              //   height: 100,
              //   color: Colors.green,
              // ),
              // Container(
              //   height: 300,
              //   color: Colors.red,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
