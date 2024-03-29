import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scanx/core/presentation/provider/global_provider.dart';
import 'package:scanx/core/presentation/screens/main_screen.dart';
import 'package:scanx/features/analyse_image/presentation/provider/analyse_image_provider.dart';
import 'package:scanx/features/auth/presentation/provider/auth_provider.dart';
import 'package:scanx/features/auth/presentation/screens/login_screen.dart';
import 'package:scanx/injections.dart';
import 'package:scanx/main.dart';
// import 'package:scanx/src/screens/auth/login_screen.dart';
// import 'package:scanx/src/screens/main/home_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  Future<String> get jwtOrEmpty async {
    var jwt = await storage.read(key: "token");
    if (jwt == null) return "";
    return jwt;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => getIt<GlobalProvider>()),
        ChangeNotifierProvider(
          create: (_) => getIt<AnalyseImageProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => getIt<AuthProvider>(),
        ),
      ],
      child: MaterialApp(
        title: "ScanX",
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home: FutureBuilder(
          future: jwtOrEmpty,
          builder: (context, snapshot) {
            // return const MainScreen(key: Key("mainScren"));
            if (!snapshot.hasData) return const CircularProgressIndicator();
            if (snapshot.data != "") {
              var str = snapshot.data;
              var jwt = str?.split(".");

              if (jwt?.length != 3) {
                return const LoginScreen(key: Key("mainScren"));
              } else {
                var payload = json.decode(
                    ascii.decode(base64.decode(base64.normalize(jwt![1]))));
                var time = (payload["iat"] * 1000) + (3600 * 1000);
                if (DateTime.fromMillisecondsSinceEpoch(time)
                    .isAfter(DateTime.now())) {
                  return const MainScreen(key: Key("mainScren"));
                } else {
                  return const LoginScreen(key: Key("mainScren"));
                }
              }
            } else {
              return const LoginScreen(key: Key("mainScren"));
            }
          },
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
        child: Center(
          child: Text(
            'Here we go',
            style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
          ),
        ),
      ),
    );
  }
}

ThemeData appTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF0ABAB5),
    onPrimary: Color.fromARGB(255, 13, 240, 232),
    secondary: Color(0xFFF2F5F5),
    onSecondary: Color.fromARGB(255, 242, 245, 245),
    tertiary: Color(0xFFF1D427),
    onTertiary: Color(0xFFF1D427),
    error: Color(0xFFF32424),
    onError: Color(0xFFF32424),
    background: Color(0xFFF1F2F3),
    onBackground: Color(0xFFFFFFFF),
    surface: Color(0xFFF2F5F5),
    onSurface: Color(0xFFF2F5F5),
  ),
  // textTheme: TextTheme(),
);
