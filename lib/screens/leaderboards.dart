import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hangman/model/model.dart';

class LeaderBords extends StatelessWidget {
  const LeaderBords({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      // streambuilder lub future builder ale future tylko raz
      child: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection("LeaderBoards").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List _listOfLiderBoards =
                snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;

              return LiderBoards.fromJson(data);
            }).toList();

            return ListView.builder(
              shrinkWrap: true,
              itemCount: _listOfLiderBoards.length,
              itemBuilder: (context, index) {
                LiderBoards _leaderboard = _listOfLiderBoards[index];

                return listItem(
                  _leaderboard,
                  context,
                );
              },
            );
          }
        },
      ),
    ));
  }

  Widget listItem(LiderBoards leaderBords, context) {
    return Dismissible(
      key: UniqueKey(),
      child: ListTile(
        title: Text(leaderBords.login!),
        subtitle: Text(leaderBords.score.toString()),
      ),
    );
  }
}
