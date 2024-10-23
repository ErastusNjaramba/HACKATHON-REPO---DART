List<int> quickSort(List<int> list) {
  if (list.length <= 1) {
    return list; // Base case: already sorted
  }

  int pivot = list[list.length ~/ 2]; // Choose pivot
  List<int> less = [];
  List<int> equal = [];
  List<int> greater = [];

  // Partition the list into less, equal, and greater parts
  for (int num in list) {
    if (num < pivot) {
      less.add(num);
    } else if (num == pivot) {
      equal.add(num);
    } else {
      greater.add(num);
    }
  }

  // Recursively sort and concatenate the results
  return quickSort(less) + equal + quickSort(greater);
}
List<int> bubbleSort(List<int> list) {
  int n = list.length;
  bool swapped;

  // Bubble sort algorithm
  do {
    swapped = false;
    for (int i = 0; i < n - 1; i++) {
      if (list[i] > list[i + 1]) {
        // Swap adjacent elements
        int temp = list[i];
        list[i] = list[i + 1];
        list[i + 1] = temp;
        swapped = true;
      }
    }
    n--; // Reduce the range for optimization
  } while (swapped);

  return list; // Return the sorted list
}
void compareSortPerformance(List<int> list) {
  // Quick Sort timing
  Stopwatch quickSortTimer = Stopwatch()..start();
  List<int> quickSorted = quickSort(List.from(list)); // Clone the list to avoid in-place sorting
  quickSortTimer.stop();
  print('Quick Sort time: ${quickSortTimer.elapsedMicroseconds} microseconds');
  print('Quick Sorted List: $quickSorted');

  // Bubble Sort timing
  Stopwatch bubbleSortTimer = Stopwatch()..start();
  List<int> bubbleSorted = bubbleSort(List.from(list)); // Clone the list for comparison
  bubbleSortTimer.stop();
  print('Bubble Sort time: ${bubbleSortTimer.elapsedMicroseconds} microseconds');
  print('Bubble Sorted List: $bubbleSorted');
}

void main() {
  // Example unsorted list
  List<int> unsortedList = [64, 34, 25, 12, 22, 11, 90, 88, 2, 1, 33, 15, 43, 50];

  // Compare performance of both sorting algorithms
  compareSortPerformance(unsortedList);
}
