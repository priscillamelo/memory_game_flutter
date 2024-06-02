import 'package:flutter/material.dart';

import '../values/theme/round6_theme.dart';
import '../widgets/button.dart';
import '../widgets/logo_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const LogoWidget(),
            Button(
                title: 'Modo Normal',
                colorButton: Colors.white,
                actionButton:
                    () {} /* Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      RecordesPage(modo: Modo.normal),
                ),
              ), */
                ),
            Button(
                title: 'Modo Round 6',
                colorButton: Round6Theme.colorPrimary,
                actionButton:
                    () {} /* Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      RecordesPage(modo: Modo.normal),
                ),
              ), */
                ),
            //const SizedBox(height: 60),
            //const CardRecordes(),
          ],
        ),
      ),
    );
  }
}
