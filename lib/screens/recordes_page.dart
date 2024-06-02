import 'package:flutter/material.dart';

import '../constants.dart';
import '../values/theme/round6_theme.dart';

class RecordesPage extends StatelessWidget {
  final Modo modo;
  final List<String> recordes = ['Modo', 'Nível 8', 'Nível 10', 'Nível 12'];
  RecordesPage({super.key, required this.modo});

  get getModo {
    return modo == Modo.normal ? 'Normal' : 'Round 6';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Recordes',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return index == 0
                ? Padding(
                    padding: const EdgeInsets.only(top: 36, bottom: 24),
                    child: Center(
                      child: Text(
                        'Modo $getModo',
                        style: const TextStyle(
                            fontSize: 28, color: Round6Theme.colorPrimary),
                      ),
                    ),
                  )
                : ListTile(
                    title: Text(recordes[index]),
                    trailing: const Text('X jogadas'),
                    tileColor: Colors.grey[900],
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  );
          },
          separatorBuilder: (_, __) => const Divider(
            color: Colors.transparent,
          ),
          itemCount: recordes.length,
        ),
      ),
    );
  }
}
