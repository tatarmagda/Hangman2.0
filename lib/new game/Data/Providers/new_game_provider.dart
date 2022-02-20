import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:hangman/new%20game/Data/Models/random_words.dart';
import 'package:http/http.dart' as http;

class NewGameProvider extends ChangeNotifier {
  RandomWords? _randomWords;
  RandomWords? get randomWords => _randomWords;

  _init() {
    _randomWords = RandomWords();
    _fetchData();
  }

  Future _fetchData() async {
    try {
      http.Response response = await http.get(Uri.parse(
          "https://random-word-api.herokuapp.com/word?number=10&swear=1"));
      print(_randomWords);
      _randomWords = RandomWords.fromJson(response.body);
    } catch (error) {
      print(error);
    }
  }

  NewGameProvider() {
    _init();
  }
  final List _alfabet = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];

  List get alfabet => _alfabet;
}
