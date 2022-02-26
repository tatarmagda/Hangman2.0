import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:hangman/new%20game/Data/Models/random_words.dart';
import 'package:http/http.dart' as http;

class NewGameProvider extends ChangeNotifier {
  RandomWords? _randomWords;
  RandomWords? get randomWords => _randomWords;
  int? _currentWord;
  int? get currentWord => _currentWord;

  set currentWord(int? newIndex) {
    _currentWord = newIndex;
    notifyListeners();
  }

  int? _mistakes;
  int? get mistakes => _mistakes;
  set mistakes(int? newMistakes) {
    _mistakes = newMistakes;
    notifyListeners();
  }

  List<String>? _passedWords;
  List<String>? get passedWords => _passedWords;
  set passedWords(List<String>? newList) {
    _passedWords = newList;
    notifyListeners();
  }

  _init() {
    _randomWords = RandomWords(randomWords: [""]);
    _fetchData();
    _currentWord = 0;
    _mistakes = 0;
    _passedWords = [];
  }

  Future _fetchData() async {
    try {
      http.Response response = await http.get(Uri.parse(
          "https://random-word-api.herokuapp.com/word?number=10&swear=1"));
      print(_randomWords);
      _randomWords = RandomWords.fromJson(response.body);
      notifyListeners();
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
