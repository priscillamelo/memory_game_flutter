import 'package:flutter/material.dart';
import 'package:memory_game_flutter/values/theme/round6_theme.dart';

import '../constants.dart';

class CardGameWidget extends StatefulWidget {
  final Modo modo;
  final int opcao;
  const CardGameWidget({super.key, required this.modo, required this.opcao});

  @override
  State<CardGameWidget> createState() => _CardGameWidgetState();
}

class _CardGameWidgetState extends State<CardGameWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: widget.modo == Modo.normal
              ? Colors.white
              : Round6Theme.colorPrimary,
          width: 2,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: widget.modo == Modo.normal
              ? const AssetImage('images/card_normal.png')
              : const AssetImage('images/card_round.png'),
        ),
      ),
    );
  }
}
