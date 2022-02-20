import 'package:flutter/material.dart';
import 'package:hangman/Widgets/Tekst_Widget.dart';
import 'package:hangman/new%20game/screens/new_gane_body.dart';

class NewGame extends StatelessWidget {
  const NewGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: MyText(
              size: 30,
              text: "1",
            ),
          ),
        ],
      ),
      body: NewGameBody(),
    );
  }
}
