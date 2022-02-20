import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class NewGameProvider extends ChangeNotifier {
  _init() {
    NewGameProvider() {
      _init();
    }
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
