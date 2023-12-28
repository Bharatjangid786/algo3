import 'package:algo3/providers/search/linear_search_provider.dart';
import 'package:algo3/providers/search_provider.dart';
// import 'package:algorithms_visualizer/providers/search/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Search<T extends SearchProvider> extends StatefulWidget {
  const Search({
    Key? key,
  }) : super(key: key);

  @override
  _SearchState<T> createState() => _SearchState<T>();
}

class _SearchState<T extends SearchProvider> extends State<Search<T>> {
  final searchController = TextEditingController();

  void _search() {
    try {
      final val = int.parse(searchController.text);
      Provider.of<T>(context, listen: false).search(value: val);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 120,
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              labelText: 'Search Value',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
            keyboardType: TextInputType.number,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Selector<LinearSearchProvider, bool>(
          selector: (_, provider) => provider.isSearching,
          builder: (_, isSearching, child) {
            return Container(
              width: 160,
              height: 50,
              child: ElevatedButton(
                onPressed: isSearching ? null : _search,
                style: ElevatedButton.styleFrom(
                  primary: Colors.black, // Use your theme color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: child,
              ),
            );
          },
          child: const Text(
            'Search',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        )
      ],
    ));
  }
}
