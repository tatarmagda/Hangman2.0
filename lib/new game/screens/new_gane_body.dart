import 'package:flutter/material.dart';

class NewGameBody extends StatelessWidget {
  const NewGameBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 1 / 3,
          color: Colors.black,
        ),
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 1 / 8,
          color: Colors.pink,
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
