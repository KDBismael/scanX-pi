import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scanx/core/presentation/provider/global_provider.dart';
import 'package:scanx/features/analyse_image/presentation/screens/analyse_historic_screen.dart';
import 'package:scanx/features/auth/presentation/screens/profile_screen.dart';
import 'package:scanx/src/screens/main/home_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nagigatorIndex = context.watch<GlobalProvider>().bottonNavigatorIndex;

    final bodies = <Widget>[
      const HomeScreen(key: Key("Home")),
      const AnalyseHistoricScreen(key: Key("Historic")),
      const ProfileScreen(
        key: Key("Profile"),
      )
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        currentIndex: nagigatorIndex,
        onTap: (index) => context
            .read<GlobalProvider>()
            .updateBottonNavigatorIndex(index: index),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              activeIcon: Icon(Icons.home),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.history),
              activeIcon: Icon(Icons.history),
              label: "Historique"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: "Profile"),
        ],
      ),
      body: bodies[nagigatorIndex],
    );
  }
}
