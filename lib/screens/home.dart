import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hangman/Widgets/Tekst_Widget.dart';
import 'package:hangman/new%20game/Data/Providers/new_game_provider.dart';
import 'package:hangman/new%20game/screens/new_game_screens.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NewGameProvider(),
        ),
      ],
      child: Scaffold(
          appBar: AppBar(
              centerTitle: true,
              title: MyText(
                size: 30,
                text: "Hang Man",
              )),
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
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewGame(),
                            ),
                          );
                        },
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
          )),
    );
  }
}
