import 'package:flutter/material.dart';

import '../constants.dart';
import '../values/theme/round6_theme.dart';

class CardNivelWidget extends StatelessWidget {
  final Modo modo;
  final int nivel;
  const CardNivelWidget({super.key, required this.modo, required this.nivel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(18)),
      onTap: () => {},
      child: Container(
        width: 90,
        height: 90,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(
                color: modo == Modo.normal
                    ? Colors.white
                    : Round6Theme.colorPrimary),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: modo == Modo.normal
                ? Colors.transparent
                : Round6Theme.colorPrimary.withOpacity(.6)),
        child: Center(
            child: Text(
          nivel.toString(),
          style: const TextStyle(fontSize: 30),
        )),
      ),
    );
  }
}
