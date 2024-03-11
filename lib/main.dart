import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:scanx/app.dart';
import 'package:scanx/injections.dart';

const SERVER_IP = 'http://192.168.1.167:5000';
final storage = FlutterSecureStorage();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectDependency();
  runApp(const MyApp());
}
