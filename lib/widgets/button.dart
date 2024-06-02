import 'package:flutter/material.dart';
import '../values/theme/round6_theme.dart';

class Button extends StatelessWidget {
  final String title;
  final Color colorButton;
  final Function actionButton;

  const Button(
      {super.key,
      required this.title,
      required this.colorButton,
      required this.actionButton});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: OutlinedButton(
        style: Round6Theme.outlineButtonStyle(colorButton: colorButton),
        onPressed: () => actionButton(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                color: colorButton,
              ),
            )
          ],
        ),
      ),
    );
  }
}
