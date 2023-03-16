import 'package:basketball_score_mac_ersion/screens/main_screens/game_screen.dart';
import 'package:basketball_score_mac_ersion/screens/main_screen.dart';
import 'package:flutter/material.dart';

class StartingB extends StatefulWidget {
  List<Map<String, dynamic>>? teamA;
  List<Map<String, dynamic>>? teamB;
  List<int>? regularA;
  StartingB(
      {Key? key,
      required this.teamA,
      required this.teamB,
      required this.regularA})
      : super(key: key);

  @override
  State<StartingB> createState() => _StartingBState();
}

class _StartingBState extends State<StartingB> {
  List<int> regular = [0, 1, 2, 3, 4];
  int denseCheckCounter = 0;
  final _isChecked = List.filled(13, false);
  bool denseChecker = true;
  List<int> switchList = [];
  List<String> nameList = [];

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < 13; i++) {
      switchList.add(widget.teamB![i]['number']);
      nameList.add(widget.teamB![i]['name']);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          MainScreen.teamBName,
          style: const TextStyle(),
        ),
        backgroundColor: Colors.limeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 13,
          itemBuilder: (BuildContext context, int index) => SwitchListTile(
              dense: true,
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Colors.limeAccent,
              title: Text(
                switchList[index].toString(),
                style: const TextStyle(
                  fontSize: 20.0,
                ),
              ),
              contentPadding: const EdgeInsets.all(1.0),
              secondary: Text(nameList[index]),
              value: _isChecked[index],
              onChanged: (bool? vale) {
                debugPrint(index.toString());
                try {
                  setState(() {
                    _isChecked[index] == false
                        ? {
                            regular[denseCheckCounter] = index,
                            denseCheckCounter++,
                            DenseCheck(denseCheckCounter),
                            _isChecked[index] = true,
                          }
                        : {
                            denseCheckCounter--,
                            DenseCheck(denseCheckCounter),
                            _isChecked[index] = false,
                          };
                  });
                } catch (e) {
                  nextScreen();
                }
              }),
        ),
      ),
    );
  }

  void DenseCheck(int count) {
    if (count > 3) {
      denseChecker = false;
    } else {
      denseChecker = true;
    }
  }

  void nextScreen() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => GameScreen(
                teamA: widget.teamA,
                teamB: widget.teamB,
                regularA: widget.regularA,
                regularB: regular)));
  }
}
