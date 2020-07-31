import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeSelected with ChangeNotifier {
  bool _isDark = false;

  ThemeMode currentMode() {
    return _isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void changeTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}
