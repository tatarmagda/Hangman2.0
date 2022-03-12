import 'dart:async';
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

  addPassLetter(String letter) {
    _passedWords!.add(letter);
    notifyListeners();
  }

  bool? _loading;

  bool? get loading => _loading;

  set loading(bool? newLoading) {
    _loading = newLoading;
    notifyListeners();
  }

  bool? _moveToNextLevel;

  bool? get moveToNextLevel => _moveToNextLevel;

  set moveToNextLevel(bool? newLevel) {
    _moveToNextLevel = newLevel;
    notifyListeners();
  }

  // set passedWords(List<String>? newList) {
  //   _passedWords = newList;
  //   notifyListeners();
  // }

  init() {
    _randomWords = RandomWords(randomWords: [""]);
    _currentWord = 0;
    _mistakes = 0;
    _passedWords = [];
    _loading = true;
    _moveToNextLevel = false;
    _fetchData();
  }

  Future _fetchData() async {
    try {
      http.Response response = await http.get(Uri.parse(
          "https://random-word-api.herokuapp.com/word?number=2&swear=1"));

      _randomWords = RandomWords.fromJson(response.body);
      _loading = false;
      startTimer();
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  NewGameProvider() {
    // _init();
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

  int _time = 0;
  int get time => _time;
  set time(int newTime) {
    _time = newTime;
    notifyListeners();
  }

  Timer? _timer;
  Timer? get timer => _timer;
  set timer(Timer? newTimer) {
    _timer = newTimer;
    notifyListeners();
  }

  startTimer() {
    time = 0;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _time = timer.tick;
      notifyListeners();
    });
  }

  endTimer() {
    timer!.cancel();
    timer = null;
  }
}
