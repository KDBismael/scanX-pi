import 'package:flutter/material.dart';
import 'package:scanx/app.dart';
import 'package:scanx/injections.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectDependency();
  runApp(const MyApp());
}
