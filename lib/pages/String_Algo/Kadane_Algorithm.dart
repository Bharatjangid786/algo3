// import 'package:algo3/widgets/search/linear_search/linear_search_speed.dart';
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

class kadane_Page<T extends SearchProvider> extends StatefulWidget {
  kadane_Page({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  _kadane_PageState<T> createState() => _kadane_PageState<T>();
}

class _kadane_PageState<T extends SearchProvider>
    extends State<kadane_Page<T>> {
  void _goBack(BuildContext context) {
    Provider.of<T>(context, listen: false).reset();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey key = GlobalKey(debugLabel: widget.title);
    return MaterialApp(
      home: Scaffold(
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
        body: SingleChildScrollView(
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
      ),
    );
  }
}
