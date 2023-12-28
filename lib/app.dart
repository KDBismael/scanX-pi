import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scanx/core/presentation/provider/global_provider.dart';
import 'package:scanx/core/presentation/screens/main_screen.dart';
import 'package:scanx/features/analyse_image/presentation/provider/analyse_image_provider.dart';
import 'package:scanx/injections.dart';
// import 'package:scanx/src/screens/auth/login_screen.dart';
// import 'package:scanx/src/screens/main/home_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ScanX",
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => GlobalProvider()),
          ChangeNotifierProvider(
            create: (_) => getIt<AnalyseImageProvider>(),
          ),
        ],
        child: const MainScreen(key: Key("mainScren")),
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
