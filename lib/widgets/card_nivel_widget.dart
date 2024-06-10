import 'package:flutter/material.dart';
import 'package:memory_game_flutter/screens/game_page.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../controllers/game_controller.dart';
import '../models/game_play.dart';
import '../values/theme/round6_theme.dart';

class CardNivelWidget extends StatelessWidget {
  final GamePlay gamePlay;
  const CardNivelWidget({
    super.key,
    required this.gamePlay,
  });

  startGame(BuildContext context) {
    context.read<GameController>().startGame(gamePlay: gamePlay);
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => GamePage(gamePlay: gamePlay),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(18)),
      onTap: () => startGame(context),
      child: Container(
        width: 90,
        height: 90,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(
                color: gamePlay.modo == Modo.normal
                    ? Colors.white
                    : Round6Theme.colorPrimary),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: gamePlay.modo == Modo.normal
                ? Colors.transparent
                : Round6Theme.colorPrimary.withOpacity(.6)),
        child: Center(
            child: Text(
          gamePlay.nivel.toString(),
          style: const TextStyle(fontSize: 30),
        )),
      ),
    );
  }
}
