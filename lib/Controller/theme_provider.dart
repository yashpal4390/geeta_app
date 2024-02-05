import 'package:flutter/foundation.dart';

class ThemeProvider extends ChangeNotifier{
  bool isDark = true;

  void changeTheme(bool val) {
    isDark = val;
    notifyListeners();
  }
}