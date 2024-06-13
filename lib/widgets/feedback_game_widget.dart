import 'package:flutter/material.dart';
import 'package:memory_game_flutter/widgets/button.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../controllers/game_controller.dart';

class FeedbackGameWidget extends StatelessWidget {
  final Resultado resultado;
  const FeedbackGameWidget({super.key, required this.resultado});

  String get getResultado {
    return resultado == Resultado.aprovado ? 'aprovado' : 'eliminado';
  }

  @override
  Widget build(BuildContext context) {
    final gameController = context.read<GameController>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      child: Column(
        children: [
          Text(
            getResultado.toUpperCase(),
            style: const TextStyle(fontSize: 30),
          ),
          const SizedBox(
            //width: MediaQuery.of(context).size.width,
            //height: MediaQuery.of(context).size.height / 3,
            height: 16,
          ),
          Image.asset(
            'images/$getResultado.png',
          ),
          resultado == Resultado.aprovado
              ? Button(
                  title: 'Próximo Nível',
                  colorButton: Colors.white,
                  actionButton: () => gameController.nextLevel())
              : Button(
                  title: 'Tentar Novamente',
                  colorButton: Colors.white,
                  actionButton: () => gameController.restartGame()),
        ],
      ),
    );
  }
}
