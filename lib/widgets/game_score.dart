import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../controllers/game_controller.dart';
import '../values/theme/round6_theme.dart';

class GameScore extends StatelessWidget {
  final Modo modo;
  const GameScore({super.key, required this.modo});

  get getColorTheme {
    if (modo == Modo.normal) {
      return Colors.white;
    }
    return Round6Theme.colorPrimary;
  }

  @override
  Widget build(BuildContext context) {
    final controllerProvider = Provider.of<GameController>(context);
    return Row(
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
            Observer(
              builder: (_) => Text(
                controllerProvider.tentativa.toString(),
                style: TextStyle(fontSize: 25, color: getColorTheme),
              ),
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
    );
  }
}
