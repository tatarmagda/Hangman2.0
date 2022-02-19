import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Hunger Man",
            style: TextStyle(
                fontFamily: "Shizuru",
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset("assets/img/hangman.jpg"),
            ElevatedButton(
              onPressed: () {},
              child: Text("New Game"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 75.0),
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Wall of fame"),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Log out"),
              style: ElevatedButton.styleFrom(primary: Colors.red[600]),
            ),
          ]),
        ));
  }
}
