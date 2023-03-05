import 'package:basketball_score_mac_ersion/screens/main_screen.dart';
import 'package:basketball_score_mac_ersion/screens/starting5_b.dart';
import 'package:flutter/material.dart';

class StartingA extends StatefulWidget {
  List<Map<dynamic, dynamic>>? teamA;
  List<Map<dynamic, dynamic>>? teamB;
  StartingA({Key? key, required this.teamA, required this.teamB})
      : super(key: key);

  @override
  State<StartingA> createState() => _StartingAState();
}

class _StartingAState extends State<StartingA> {
  List<int> regular = [0, 1, 2, 3, 4];
  int denseCheckCounter = 0;
  final _isChecked = List.filled(13, false);
  bool denseChecker = true;
  List<int> switchList = [];
  List<String> nameList = [];

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < 13; i++) {
      switchList.add(widget.teamA![i]['number']);
      nameList.add(widget.teamA![i]['name']);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(MainScreen.teamAName,
        style: const TextStyle(
          color: Colors.white
        ),),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 13,
          itemBuilder: (BuildContext context, int index)
          => SwitchListTile(
              dense: true,
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Colors.indigo,
              title: Text(
                switchList[index].toString(),
                style: const TextStyle(
                  fontSize: 20.0,
                ),
              ),
              contentPadding:const EdgeInsets.all(1.0),
              secondary: Text(nameList[index]),
              value: _isChecked[index],
              onChanged: (bool? vale) {
                debugPrint(index.toString());
                try{
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
                });} catch(e){
                  nextScreen();
                }
              }
            ),
          ),
        ),

    );
  }

  void DenseCheck(int count) {
    if (count > 4) {
      denseChecker = false;
    }
    else {denseChecker = true;}
  }

  void nextScreen() {
    Navigator.push(
        context,MaterialPageRoute(
        builder: (context)
        => StartingB(teamA: widget.teamA,teamB: widget.teamB,regularA: regular,)));
  }
}
