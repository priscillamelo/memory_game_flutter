import 'package:flutter/material.dart';

import '../constants.dart';
import '../screens/recordes_page.dart';
import '../values/theme/round6_theme.dart';

class CardRecordes extends StatefulWidget {
  const CardRecordes({super.key});

  @override
  State<CardRecordes> createState() => _CardRecordesState();
}

class _CardRecordesState extends State<CardRecordes> {
  showRecordes(Modo modo) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecordesPage(
          modo: modo,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade900,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                'Recordes',
                style: TextStyle(
                  color: Round6Theme.colorPrimary,
                  fontSize: 22,
                ),
              ),
            ),
            ListTile(
              title: const Text('Modo Normal'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => showRecordes(Modo.normal),
            ),
            ListTile(
              title: const Text('Modo Round 6'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => showRecordes(Modo.round6),
            ),
          ],
        ),
      ),
    );
  }
}
