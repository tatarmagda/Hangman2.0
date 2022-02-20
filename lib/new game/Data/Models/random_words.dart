import 'dart:convert';

class RandomWords {
  List? randomWords;
  RandomWords({
    this.randomWords,
  });
  RandomWords.fromJson(json) {
    randomWords = jsonDecode(json);
  }
}
