import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hangman/Widgets/Tekst_Widget.dart';
import 'package:hangman/new%20game/Data/Providers/new_game_provider.dart';

import 'package:hangman/new%20game/screens/new_gane_body.dart';
import 'package:provider/provider.dart';

class NewGame extends StatelessWidget {
  const NewGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? _currentWord = Provider.of<NewGameProvider>(context).currentWord;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_sharp),
          onPressed:
              Provider.of<NewGameProvider>(context, listen: true).timer == null
                  ? null
                  : () {
                      if (Provider.of<NewGameProvider>(context, listen: false)
                              .timer !=
                          null) {
                        Provider.of<NewGameProvider>(context, listen: false)
                            .endTimer();
                      }
                      Navigator.pop(context);
                    },
        ),
        centerTitle: true,
        title: MyText(
          size: 30,
          text: Provider.of<NewGameProvider>(context).time.toString() + "s",
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: MyText(
              size: 30,
              text: (_currentWord! + 1).toString(),
            ),
          ),
        ],
      ),
      body: WillPopScope(
          onWillPop: () async {
            if (Provider.of<NewGameProvider>(context, listen: false).timer !=
                null) {
              Provider.of<NewGameProvider>(context, listen: false).endTimer();

              return true;
            } else {
              return false;
            }
          },
          child: NewGameBody()),
    );
  }
}
