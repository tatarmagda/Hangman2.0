import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hangman/Widgets/Tekst_Widget.dart';
import 'package:hangman/new%20game/Data/Providers/new_game_provider.dart';
import 'package:hangman/new%20game/screens/new_game_screens.dart';
import 'package:provider/provider.dart';

import '../Login/auth_state.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const MyText(
            size: 30,
            text: "Hang Man",
          ),
          actions: <Widget>[
            FlatButton(
              textColor: Colors.white,
              onPressed: () {
                Provider.of<AuthState>(context, listen: false)
                    .signOutWithEmail();
              },
              child: Text("Log out"),
              shape: CircleBorder(
                  side: BorderSide(color: Color.fromARGB(0, 31, 32, 94))),
            ),
          ],
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
                      onPressed: () {
                        if (Provider.of<NewGameProvider>(context, listen: false)
                                .timer !=
                            null) {
                          Provider.of<NewGameProvider>(context, listen: false)
                              .endTimer();
                        }
                        Provider.of<NewGameProvider>(context, listen: false)
                            .init();
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
        ));
  }
}
