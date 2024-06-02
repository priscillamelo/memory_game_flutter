import 'package:flutter/material.dart';
import '../values/theme/round6_theme.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Image.asset(
            'images/logo_host.png',
            width: 80,
            height: 125,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: RichText(
            text: TextSpan(
              text: 'Round 6 ',
              style: DefaultTextStyle.of(context).style.copyWith(fontSize: 30),
              children: const [
                TextSpan(
                  text: 'Memory',
                  style: TextStyle(color: Round6Theme.colorPrimary),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
