import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/home_page.dart';
import '../values/theme/round6_theme.dart';
import 'controllers/game_controller.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<GameController>(create: (_) => GameController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Round 6 Memory',
        debugShowCheckedModeBanner: false,
        theme: Round6Theme.themeData,
        home: const HomePage());
  }
}
