import 'package:basketball_score_mac_ersion/screens/main_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TimeOutScreen extends StatelessWidget {
  TimeOutScreen({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('チームは？'),
      children: [
        SimpleDialogOption(
          child: Text(MainScreen.teamAName),
          onPressed: () {
            Navigator.pop(context,0);
          },
        ),
        SimpleDialogOption(
          child: Text(MainScreen.teamBName),
          onPressed: () {
            Navigator.pop(context,1);
          },
        )
      ],
    );
  }
}
