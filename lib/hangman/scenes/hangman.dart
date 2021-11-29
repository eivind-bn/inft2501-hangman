
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hangman_project/hangman/localization/localization.dart';

import '../keyboard/keyboard.dart';

class Hangman extends StatefulWidget{

  const Hangman({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HangManState();

}
class _HangManState extends State<Hangman>{

  GlobalKey<KeyboardState> keyboardState = GlobalKey();
  late String correctWord;
  late Map<String,bool> isGuessed;
  int errorCount = 0;
  bool inProgress = true;
  bool gameWon = false;
  bool gameLost = false;

  void shuffleWords() {
    correctWord = Localization.words[Random().nextInt(Localization.words.length)];
    isGuessed = Map.fromIterables(correctWord.characters.toList(), List.filled(correctWord.length, false));
  }

  @override
  void initState() {
    shuffleWords();
    super.initState();
  }

  void handleInput(String char) => setState(() {
    if(isGuessed.containsKey(char)){
      isGuessed[char] = true;
      gameWon = isGuessed.values.reduce((x, y) => x && y);
    } else {
      errorCount++;
      gameLost = !(errorCount < 6);
    }
    inProgress = !gameWon && !gameLost;
  });

  void reset() => setState(() {
    keyboardState.currentState?.reset();
    errorCount = 0;
    shuffleWords();
    inProgress = true;
    gameLost = false;
    gameWon = false;
  });

  Widget loadMessage() {
    if(gameWon) return Text(Localization.victoryMessage);
    if(gameLost) return Text(Localization.gameOverMessage(correctWord));
    else return SizedBox();
  }


  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Hangman'),
      centerTitle: true,
    ),
    body: Column(
      children: [
        Image(
          image: AssetImage('assets/hangman$errorCount.png'),
          height: MediaQuery.of(context).size.height * 0.4,
        ),
        loadMessage(),
        Text(
          correctWord.characters.map((e) => isGuessed[e] ?? false ? e : '_').join(" "),
          textScaleFactor: 3,
        ),
        Flexible(
            child: Localization.keyboard(inProgress ? (c) => handleInput(c) : null, key: keyboardState)
        ),
        ElevatedButton(
            onPressed: () => reset(),
            child: Text(Localization.resetButtonLabel)
        )
      ],
    ),
  );

}