

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hangman_project/hangman/localization/localization.dart';

class Menu extends StatelessWidget{


  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Hangman'),
      centerTitle: true,
    ),
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(7),
              child: Text(
                Localization.info.header,
                textScaleFactor: 1.5,
                textAlign: TextAlign.center,
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints.tight(Size.fromHeight(MediaQuery.of(context).size.height * 0.55)),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(7),
                  child: Text(
                    Localization.info.description.join('\n\n'),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15
                    ),
                  ),
                ),
              )
            ),
            ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/hangman'),
                child: Text(Localization.playBtnLabel)
            )
          ],
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        ),
      ),
    ),
  );

}