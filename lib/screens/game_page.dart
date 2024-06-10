import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../controllers/game_controller.dart';
import '../game_settings.dart';
import '../models/game_options.dart';
import '../models/game_play.dart';
import '../widgets/card_game_widget.dart';
import '../widgets/feedback_game_widget.dart';
import '../widgets/game_score.dart';

class GamePage extends StatelessWidget {
  final GamePlay gamePlay;
  const GamePage({super.key, required this.gamePlay});

  @override
  Widget build(BuildContext context) {
    final controllerProvider = Provider.of<GameController>(context);
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 64,
          automaticallyImplyLeading: false,
          title: GameScore(
            modo: gamePlay.modo,
          ),
        ),
        body: Observer(builder: (_) {
          if (controllerProvider.winner) {
            return const FeedbackGameWidget(resultado: Resultado.aprovado);
          } else if (controllerProvider.loser) {
            return const FeedbackGameWidget(resultado: Resultado.eliminado);
          } else {
            return GridView.count(
              crossAxisCount: GameSettings.gameBoardAxisCount(gamePlay.nivel),
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 56),
              children: controllerProvider.gameCards
                  .map((GameOptions go) =>
                      CardGameWidget(modo: gamePlay.modo, gameOpcao: go))
                  .toList(),
            );
          }
        }));
  }
}
