import 'package:flutter/material.dart';

import '../utils/keys.dart';
import 'screen_two.dart';


class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        key: Keys.buttonKey,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ScreenTwo()));
        },
        child: const Text('Go to Second Widget'),
      ),
    );
  }
}
