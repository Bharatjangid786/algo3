import 'package:flutter/material.dart';

class Constants {
  static var primaryColor = const Color(0xFFFFD1E1FF);
  static var sorteedColor = Color.fromARGB(255, 64, 99, 163);
  static var sortsecondryColor = Color.fromRGBO(37, 40, 47, 1.0);
  // static var blackColor = Colors.black54;
  // static var titleOne = "Learn more about plants";
  // static var descriptionOne = "Read how to care for plants in our rich plants guide.";
  // static var titleTwo = "Find a plant lover friend";
  // static var descriptionTwo = "Are you a plant lover? Connect with other plant lovers.";
  // static var titleThree = "Plant a tree, green the Earth";
  // static var descriptionThree = "Find almost all types of plants that you like here.";

  static String linearCppCode = '''
 int linearSearch(int arr[], int size, int target) {
      for (int i = 0; i < size; i++) {
          if (arr[i] == target) {
            return i; 
           }
       }
  return -1; 
}
''';

  static String binaryCppCode = '''
int binarySearch(int arr[], int size, int target) {
    int left = 0, right = size - 1;
    while (left <= right) {
        int mid = left + (right - left) / 2;
        if (arr[mid] == target)
            return mid;
        if (arr[mid] < target)
            left = mid + 1;
        else
            right = mid - 1;
    }
    return -1;
}

                              ''';

  static String binaryJavaCode = '''
public static int binarySearch(int arr[], int target) {
    int left = 0, right = arr.length - 1;
    while (left <= right) {
        int mid = left + (right - left) / 2;
        if (arr[mid] == target)
            return mid;
        if (arr[mid] < target)
            left = mid + 1;
        else
            right = mid - 1;
    }
    return -1;
}

                
                ''';

  // ignore: non_constant_identifier_names
  static String linearJavaCode = '''
 public static int linearSearch(int[] arr, int target) {
      for (int i = 0; i < arr.length; i++) {
        if (arr[i] == target) {
          return i;  
          }
      }  
   return -1;
}           
                
                ''';
  static String linearPythonCode = ''' 
  def linear_search(arr, target):
      for i in range(len(arr)):
        if arr[i] == target:
          return i  
    return -1    
                  ''';
  static String binaryPythonCode = ''' 
 def binarySearch(arr, target):
    left, right = 0, len(arr) - 1
    while left <= right:
        mid = left + (right - left) // 2
        if arr[mid] == target:
            return mid
        if arr[mid] < target:
            left = mid + 1
        else:
            right = mid - 1
    return -1

                  ''';

  static String linearCCode = '''
  int search(int arr[], int N, int x)
  {
    for (int i = 0; i < N; i++)
      if (arr[i] == x)
        return i;
     return -1;
  }  ''';
  static String binaryCCode = '''
    int binarySearch(int arr[], int size, int target) {
       int left = 0, right = size - 1;
        while (left <= right) {
           int mid = left + (right - left) / 2;
           if (arr[mid] == target)
              return mid;
           if (arr[mid] < target)
               left = mid + 1;
           else
             right = mid - 1;
         }
      return -1;
     }
  ''';
  static String binarySearch = '''
Binary Search is an efficient search algorithm
 for finding a target element within a sorted 
 array. It works by repeatedly dividing the 
 search range in half, making it a logarithmic
  time complexity O(log n). Space complexity is
   constant O(1) as it uses a fixed amount of 
   memory. It is much faster than linear search
    for large datasets.
''';

  static String linaerSearch = '''
Linear search is a basic search algorithm used 
to find specific element in a list or array. 
It works by examining each element one by one 
in a sequential manner. The algorithm starts 
at the beginning and checks each element to 
see if it matches the target.If a match is 
found, the algorithm returns the position;
otherwise, it continues until all elements have 
been checked or returns a special value if the
element is not in the list. It has a time 
complexity of O(n)  for n elements.
''';

  static String bubbleSort = '''
Bubble Sort is like organizing a deck of 
cards by repeatedly comparing and swapping
adjacent cards until the entire deck is in 
order. It's straightforward but can be slow
for a large number of cards.
 ''';

  static String QuickSort = '''
Quick Sort sorts a list by selecting a "pivot" 
element and partitioning the other elements 
into two sub-arrays, those less than the pivot 
and those greater. The process is repeated 
recursively.
''';

  static String SelectionSort = '''
Selection Sort organizes a list by repeatedly 
finding the smallest element and placing it at
the beginning. This process is repeated for
the remaining unsorted elements until the 
entire list is sorted.
''';

  static String InsertionSort = '''
Insertion Sort arranges a list by iteratively 
taking each element and placing it in its correct
position within the sorted section. It's like 
sorting playing cards in your hand.
''';

  static String bubbleSortworstTimeComplexity = "O(n^2)";
  static String bubbleSortgoodTimeComplexity = "O(n)";
  static String bubbleSortavgTimeComplexity = "O(n^2)";
  static String bubbleSortworstSpaceComplexity = "O(1)";

  static String QuickSortworstTimeComplexity = "O(n^2)";
  static String QuickSortgoodTimeComplexity = "O(n log n)";
  static String QuickSortavgTimeComplexity = "O(n log n)";
  static String QuickSortworstSpaceComplexity = "O(log n)";

  static String SelectionSortworstTimeComplexity = "O(n^2)";
  static String SelectionSortgoodTimeComplexity = "O(n^2)";
  static String SelectionSortavgTimeComplexity = "O(n^2)";
  static String SelectionSortworstSpaceComplexity = "O(1)";

  static String InsertionSortworstTimeComplexity = "O(n^2)";
  static String InsertionSortgoodTimeComplexity = "O(n)";
  static String InsertionSortavgTimeComplexity = "O(n^2)";
  static String InsertionSortworstSpaceComplexity = "O(1)";
}
