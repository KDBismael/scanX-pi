import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class GlobalProvider with ChangeNotifier {
  int bottonNavigatorIndex = 0;
  FlutterSecureStorage secuStorage = const FlutterSecureStorage();

  void updateBottonNavigatorIndex({required index}) {
    bottonNavigatorIndex = index;
    notifyListeners();
  }
}
