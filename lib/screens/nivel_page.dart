import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/card_nivel_widget.dart';

class NivelPage extends StatelessWidget {
  final Modo modo;
  const NivelPage({super.key, required this.modo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Nível do Jogo')),
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
        ));
  }
}
