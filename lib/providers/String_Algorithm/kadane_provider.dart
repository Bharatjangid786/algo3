// import 'package:algorithms_visualizer/models/search_model.dart';
// import '/providers/search/search_provider.dart';

import '../../models/search_model.dart';
import '../search_provider.dart';

class kadaneProvider extends SearchProvider {
  @override
  void search({int value = 34}) {
    super.search(value: value);
    kadaneAlgo(numbers);
  }

  Future kadaneAlgo(List<SearchModel> list) async {
    int max_so_far = -1000;
    int max_ending_here = 0;
    // _kadaneStart = 0;
    UpdateStart(0);
    for (int i = 0; i < list.length; i++) {
      max_ending_here = max_ending_here + list[i].value;
      if (max_so_far < max_ending_here) {
        UpdateEnd(i);
        currentSum(GiveStartIndex(), GiveEndIndex());
        max_so_far = max_ending_here;
      }
      if (max_ending_here < 0) {
        UpdateStart(i + 1);
        // kadane_start = i + 1;
        UpdateEnd(i + 1);
        // kadane_end = i + 1;
        max_ending_here = 0;
      }
    }
    return max_so_far;
  }
}
