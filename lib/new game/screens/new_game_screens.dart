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
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const MyText(
          size: 30,
          text: "Timer",
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
      body: NewGameBody(),
    );
  }
}
