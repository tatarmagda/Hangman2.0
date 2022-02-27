import 'package:flutter/material.dart';
import 'package:hangman/Widgets/Tekst_Widget.dart';
import 'package:hangman/new%20game/Data/Providers/new_game_provider.dart';
import 'package:hangman/new%20game/Data/Providers/timer.dart';
import 'package:hangman/new%20game/screens/new_gane_body.dart';
import 'package:provider/provider.dart';

class NewGame extends StatefulWidget {
  const NewGame({Key? key}) : super(key: key);

  @override
  State<NewGame> createState() => _NewGameState();
}

class _NewGameState extends State<NewGame> {
  @override
  void initState() {
    Provider.of<TimerProvider>(context).init();
    // TODO: implement initState
    super.initState();
  }

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
        title: MyText(
          size: 30,
          text: Provider.of<TimerProvider>(context).timer!.tick.toString(),
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
