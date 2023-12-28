import 'package:flutter/material.dart';

class GlobalProvider with ChangeNotifier {
  int bottonNavigatorIndex = 0;

  void updateBottonNavigatorIndex({required index}) {
    bottonNavigatorIndex = index;
    notifyListeners();
  }
}
