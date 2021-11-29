import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:hangman_project/hangman/keyboard/keyboard.dart';

import 'language.dart';

class Localization{

  static final String localeName = Platform.localeName;

  static List<String> letters = _letters();
  static List<String> _letters() {
    switch(localeName){
      case "en_US": return English.letters;
      case "nb_NO": return Norwegian.letters;
      default: return English.letters;
    }
  }

  static Keyboard keyboard(void Function(String)? onPressed, {GlobalKey? key}) {
    return Keyboard(letters, onPressed, key: key,);
  }

  static String playBtnLabel = _playBtnLabel();
  static String _playBtnLabel() {
    switch(localeName) {
      case "en_US": return English.playBtnLabel;
      case "nb_NO": return Norwegian.playBtnLabel;
      default: return English.playBtnLabel;
    }
  }

  static String resetButtonLabel = _resetButtonLabel();
  static String _resetButtonLabel() {
    switch(localeName) {
      case "en_US": return English.resetButtonLabel;
      case "nb_NO": return Norwegian.resetButtonLabel;
      default: return English.resetButtonLabel;
    }
  }

  static List<String> words = _words();
  static List<String> _words() {
    switch(localeName) {
      case "en_US": return English.words;
      case "nb_NO": return Norwegian.words;
      default: return English.words;
    }
  }

  static InfoMessage info = _info();
  static InfoMessage _info() {
    switch(localeName) {
      case "en_US": return English.info;
      case "nb_NO": return Norwegian.info;
      default: return English.info;
    }
  }

  static String Function(String word) gameOverMessage = _gameOverMessage();
  static String Function(String word) _gameOverMessage() {
    switch(localeName) {
      case "en_US": return English.gameOverMessage;
      case "nb_NO": return Norwegian.gameOverMessage;
      default: return English.gameOverMessage;
    }
  }

  static String victoryMessage = _victoryMessage();
  static String _victoryMessage() {
    switch(localeName) {
      case "en_US": return English.victoryMessage;
      case "nb_NO": return Norwegian.victoryMessage;
      default: return English.victoryMessage;
    }
  }
}