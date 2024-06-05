import 'package:flutter/material.dart';

import '../constants.dart';
import '../values/theme/round6_theme.dart';
import '../widgets/button.dart';
import '../widgets/card_recordes.dart';
import '../widgets/logo_widget.dart';
import 'nivel_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const LogoWidget(),
                Button(
                    title: 'Modo Normal',
                    colorButton: Colors.white,
                    actionButton: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const NivelPage(modo: Modo.normal),
                        ),
                      );
                    }),
                Button(
                    title: 'Modo Round 6',
                    colorButton: Round6Theme.colorPrimary,
                    actionButton: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const NivelPage(modo: Modo.round6),
                          ),
                        )),
                const SizedBox(height: 60),
                const CardRecordes(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
