import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hangman/Widgets/Tekst_Widget.dart';
import 'package:hangman/new%20game/Data/Providers/new_game_provider.dart';
import 'package:provider/provider.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class NewGameBody extends StatelessWidget {
  const NewGameBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List _alfabet = Provider.of<NewGameProvider>(context).alfabet;
    List listOfWords =
        Provider.of<NewGameProvider>(context).randomWords!.randomWords!;
    int? _currentWord = Provider.of<NewGameProvider>(context).currentWord;

    List _textList = listOfWords[_currentWord!].toLowerCase().split("");
    int _mistakes = Provider.of<NewGameProvider>(context).mistakes!;

    List _passedWords = Provider.of<NewGameProvider>(context).passedWords!;

    return listOfWords.first == ""
        ? CircularProgressIndicator()
        : Column(
            children: [
              Text(
                _passedWords.toString(),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 1 / 3,
                child: Stack(
                  children: [
                    SvgPicture.asset("assets/svg/hangman.svg"),
                    if (_mistakes > 0) SvgPicture.asset("assets/svg/rA.svg"),
                    if (_mistakes > 1) SvgPicture.asset("assets/svg/lL.svg"),
                    if (_mistakes > 2) SvgPicture.asset("assets/svg/c.svg"),
                    if (_mistakes > 3) SvgPicture.asset("assets/svg/rL.svg"),
                    if (_mistakes > 4) SvgPicture.asset("assets/svg/lA.svg"),
                    if (_mistakes > 5) SvgPicture.asset("assets/svg/head.svg"),
                  ],
                ),
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
                              text: _passedWords.contains(e.toLowerCase())
                                  ? e
                                  : "",
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
                height: MediaQuery.of(context).size.height * 1 / 6,
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
                                  // step 1
                                  onPressed:
                                      _passedWords.contains(e.toLowerCase())
                                          ? null
                                          : () {
                                              _checkButton(
                                                  letter: e.toLowerCase(),
                                                  textList: _textList,
                                                  context: context);
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

  _checkButton({String? letter, List? textList, context}) {
    if (textList!.contains(letter)) {
      Provider.of<NewGameProvider>(context, listen: false)
          .addPassLetter(letter!);
      print("yay! $letter");
    } else {
      Provider.of<NewGameProvider>(context, listen: false).mistakes =
          Provider.of<NewGameProvider>(context, listen: false).mistakes! + 1;
      if (Provider.of<NewGameProvider>(context, listen: false).mistakes! >= 6) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          borderSide: const BorderSide(color: Colors.red, width: 2),
          // width: 280,
          buttonsBorderRadius: const BorderRadius.all(Radius.circular(2)),
          headerAnimationLoop: true,
          animType: AnimType.BOTTOMSLIDE,
          title: 'GAME OVER',
          desc: 'Start New Game',
          dismissOnBackKeyPress: false,
          btnCancelOnPress: () {},
          btnOkOnPress: () {},
        ).show();
      }
    }
  }
}
