import 'dart:math';

import 'package:flutter/material.dart';

import '../values/theme/round6_theme.dart';
import '../constants.dart';
import '../widgets/card_game_widget.dart';

class GamePage extends StatelessWidget {
  final Modo modo;
  final int nivel;
  const GamePage({super.key, required this.modo, required this.nivel});

  get getAxisCount {
    if (nivel <= 10) {
      return 2;
    } else if (nivel > 10 && (nivel % 3 == 0)) {
      return 3;
    } else {
      return 4;
    }
  }

  get getColorTheme {
    if (modo == Modo.normal) {
      return Colors.white;
    }
    return Round6Theme.colorPrimary;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 64,
        automaticallyImplyLeading: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                    modo == Modo.normal
                        ? Icons.touch_app_rounded
                        : Icons.my_location,
                    color: getColorTheme),
                Text(
                  '18',
                  style: TextStyle(fontSize: 25, color: getColorTheme),
                ),
              ],
            ),
            Image.asset(
              'images/logo_host.png',
              width: 60,
              height: 50,
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Sair',
                style: TextStyle(color: getColorTheme, fontSize: 18),
              ),
            )
          ],
        ),
      ),
      body: GridView.count(
        crossAxisCount: getAxisCount,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 56),
        children: List.generate(
          nivel,
          (index) => CardGameWidget(modo: modo, opcao: Random().nextInt(14)),
        ),
      ),
    );
  }
}
