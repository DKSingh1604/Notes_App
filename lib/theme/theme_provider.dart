import 'package:flutter/material.dart';
import 'package:isar_crud/theme/theme.dart';

class ThemeProvider with ChangeNotifier {
  //initially, light mode
  ThemeData _themeData = lightMode;

  //getter method to get the theme from other parts of the code
  ThemeData get themeData => _themeData;

  //getter method to know if we are in dark mode or not
  bool get isDarkMode => _themeData == darkMode;

  //setter method to set the theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  //as a toggle switch to change the theme
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
