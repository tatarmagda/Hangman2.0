class ListOfWinners {
  ListOfWinners({required this.login, required this.score, required this.time});

  ListOfWinners.fromJson(Map<int, Object?> json)
      : this(
          login: json['model']! as String,
          score: json["score"]! as int,
          time: json['brand']! as int,
        );

  String? login;
  int? score;
  int? time;

  Map<String, Object?> toJson() {
    return {
      'login': login,
      'score': score,
      'time': time,
    };
  }
}
