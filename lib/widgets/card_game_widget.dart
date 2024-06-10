import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:memory_game_flutter/values/theme/round6_theme.dart';

import '../constants.dart';
import '../models/game_options.dart';

class CardGameWidget extends StatefulWidget {
  final Modo modo;
  final GameOptions gameOpcao;
  const CardGameWidget(
      {super.key, required this.modo, required this.gameOpcao});

  @override
  State<CardGameWidget> createState() => _CardGameWidgetState();
}

class _CardGameWidgetState extends State<CardGameWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  flipCard() {
    if (!animationController.isAnimating) {
      animationController.forward();
      Timer(const Duration(seconds: 2), () => animationController.reverse());
    }
  }

  AssetImage getImageCard(double angulo) {
    if (angulo > (0.5 * pi)) {
      return AssetImage('images/${widget.gameOpcao.option.toString()}.png');
    } else {
      return widget.modo == Modo.normal
          ? const AssetImage('images/card_normal.png')
          : const AssetImage('images/card_round.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, _) {
          final angulo = animationController.value * pi;
          final transform = Matrix4.identity()
            ..setEntry(3, 2, 0.0005) // 0.001
            ..rotateY(angulo);
          return GestureDetector(
            onTap: () => flipCard(),
            child: Transform(
              transform: transform,
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: widget.modo == Modo.normal
                        ? Colors.white
                        : Round6Theme.colorPrimary,
                    width: 2,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: getImageCard(angulo)),
                ),
              ),
            ),
          );
        });
  }
}
