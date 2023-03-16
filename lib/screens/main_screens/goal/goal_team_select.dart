import 'package:basketball_score_mac_ersion/screens/main_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GoalTeamSelect extends StatelessWidget {
  List<int>? active5;
  GoalTeamSelect({Key? key, required active5}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: [
        SimpleDialogOption(
          child: Text(active5![0].toString()),
          onPressed: () {
            Navigator.pop(context, 1);
          },
        ),
        SimpleDialogOption(
          child: Text(active5![1].toString()),
          onPressed: () {
            Navigator.pop(context, 1);
          },
        ),
        SimpleDialogOption(
          child: Text(active5![2].toString()),
          onPressed: () {
            Navigator.pop(context, 1);
          },
        ),
        SimpleDialogOption(
          child: Text(active5![3].toString()),
          onPressed: () {
            Navigator.pop(context, 1);
          },
        ),SimpleDialogOption(
          child: Text(active5![4].toString()),
          onPressed: () {
            Navigator.pop(context, 1);
          },
        ),
      ],
    );
  }
}
