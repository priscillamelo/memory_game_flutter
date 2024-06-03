import 'package:flutter/material.dart';
import 'package:memory_game_flutter/values/theme/round6_theme.dart';

import '../constants.dart';
import '../widgets/card_nivel_widget.dart';

class NivelPage extends StatelessWidget {
  final Modo modo;
  const NivelPage({super.key, required this.modo});

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
        iconTheme: IconThemeData(color: getColorTheme),
        centerTitle: false,
        title: Text(
          'Nível do Jogo',
          style: TextStyle(color: getColorTheme),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 48),
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 24,
          crossAxisSpacing: 24,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            CardNivelWidget(modo: modo, nivel: 6),
            CardNivelWidget(modo: modo, nivel: 8),
            CardNivelWidget(modo: modo, nivel: 10),
            CardNivelWidget(modo: modo, nivel: 12),
            CardNivelWidget(modo: modo, nivel: 16),
            CardNivelWidget(modo: modo, nivel: 18),
            CardNivelWidget(modo: modo, nivel: 20),
            CardNivelWidget(modo: modo, nivel: 24),
            CardNivelWidget(modo: modo, nivel: 28),
          ],
        ),
      ),
    );
  }
}
