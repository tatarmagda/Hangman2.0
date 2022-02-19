import 'dart:ui';

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
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                ("assets/img/hangman2.0.jpg"),
              ),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(Colors.grey, BlendMode.softLight),
            ),
          ),
          child: Container(
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("New Game"),
                      style: ElevatedButton.styleFrom(
                        elevation: 20, // Elevation
                        shadowColor: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 100.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("Wall of fame"),
                        style: ElevatedButton.styleFrom(
                          elevation: 20, // Elevation
                          shadowColor: Colors.black,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Log out"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red[600], elevation: 20, // Elevation
                        shadowColor: Colors.red,
                      ),
                    ),
                  ]),
            ),
          ),
        ));
  }
}
