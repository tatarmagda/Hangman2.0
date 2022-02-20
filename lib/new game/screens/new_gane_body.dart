import 'package:flutter/material.dart';
import 'package:hangman/Widgets/Tekst_Widget.dart';
import 'package:hangman/new%20game/Data/Providers/new_game_provider.dart';
import 'package:provider/provider.dart';

class NewGameBody extends StatelessWidget {
  const NewGameBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List _alfabet = Provider.of<NewGameProvider>(context).alfabet;
    String _example = "example";
    List _textList = _example.split("");

    return Column(
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 1 / 3,
          color: Colors.black,
        ),
        Container(
          child: Center(
              child: Wrap(
            spacing: 10,
            children: _textList
                .map(
                  (e) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MyText(
                        size: 30,
                        text: e,
                      ),
                      Container(
                        width: 30,
                        height: 5,
                        color: Colors.black,
                      ),
                    ],
                  ),
                )
                .toList(),
          )),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 1 / 8,
          color: Colors.pink,
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            child: Center(
              child: Wrap(
                runSpacing: 1.0,
                spacing: 5,
                children: _alfabet
                    .map((e) => Container(
                          width: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              print(e);
                            },
                            child: Text(e),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
