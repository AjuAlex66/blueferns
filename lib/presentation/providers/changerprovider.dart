import 'package:flutter/material.dart';

class ChangerProvider extends ChangeNotifier {
  justChange() => notifyListeners();

  String _sortValue = '';
  String get sortValue => _sortValue;

  setSortValue(String value) => _sortValue = value;

  changeSort(String? value) {
    _sortValue = value!;
    notifyListeners();
  }
}
