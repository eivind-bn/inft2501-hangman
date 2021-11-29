
import 'package:flutter/material.dart';
import 'package:hangman_project/hangman/scenes/hangman.dart';

import 'hangman/scenes/menu.dart';

void main() => runApp(MyClass());

class MyClass extends StatelessWidget {

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Hangman',
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => Menu(),
      '/hangman': (context) => Hangman()
    },
  );
}
