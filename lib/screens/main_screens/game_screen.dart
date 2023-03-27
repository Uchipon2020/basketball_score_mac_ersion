
import 'package:basketball_score_mac_ersion/screens/main_screen.dart';
import 'package:basketball_score_mac_ersion/screens/main_screens/foul/foul_screen.dart';
import 'package:basketball_score_mac_ersion/screens/main_screens/goal/goal_screen.dart';
import 'package:basketball_score_mac_ersion/screens/main_screens/memberChange/membar_change_screen.dart';
import 'package:basketball_score_mac_ersion/screens/main_screens/time_out_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class GameScreen extends StatefulWidget {
  List<Map>? teamA;
  List<Map>? teamB;
  List<int>? regularA;
  List<int>? regularB;
  GameScreen(
      {Key? key,
      required this.teamA,
      required this.teamB,
      required this.regularA,
      required this.regularB})
      : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<String> activeGameLogToString = [];
  List<int> activeA5 = [];
  List<int> activeB5 = [];
  String? teamName;
  bool quarterCheck1 = true;
  bool quarterCheck2 = false;
  bool quarterCheck3 = false;
  bool quarterCheck4 = false;

  Map<String, int> activeGameLog = {
    'quarterNo': 1,
    'TeamAPoint': 0,
    'TeamBPoint': 0,
    'TeamAFoul': 0,
    'TeamBFoul': 0,
  };
  List<int> timeOutA = [0,0,0,0];
  List<int> timeOutB = [0,0,0,0];


  Map<String, dynamic> memberFoul =
    {
      'number': 0,
      'foulType': "",
      'foulCount': 0,
      'freeThrowPoint': 0,
    };

  @override
  Widget build(BuildContext context) {
    activeFlesh();
    //アクティブログを文字列に変換して格納
    return Scaffold(
      appBar: AppBar(
        title: const Text('ゲーム記録中！！'),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        //全体
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //１／３の上部グループ
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.orange,
                  width: 4.0,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //チームAの括り
                  Column(
                    children: [
                      Text(
                        //widget.teamA![widget.regularA![0]]['number'].toString(),
                        activeA5[0].toString(),
                        style: const TextStyle(fontSize: 25.0),
                      ),
                      Text(
                        //widget.teamA![widget.regularA![1]]['number'].toString(),
                        activeA5[1].toString(),
                        style: const TextStyle(fontSize: 25.0),
                      ),
                      Text(
                        //widget.teamA![widget.regularA![2]]['number'].toString(),
                        activeA5[2].toString(),
                        style: const TextStyle(fontSize: 25.0),
                      ),
                      Text(
                        //widget.teamA![widget.regularA![3]]['number'].toString(),
                        activeA5[3].toString(),
                        style: const TextStyle(fontSize: 25.0),
                      ),
                      Text(
                        //widget.teamA![widget.regularA![4]]['number'].toString(),
                        activeA5[4].toString(),
                        style: const TextStyle(fontSize: 25.0),
                      ),
                    ],
                  ),
                  //クォーターボタンの括り
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () => setState(
                          () => {
                            quarterCheck1 = !quarterCheck1,
                            quarterCheck2 = false,
                            quarterCheck3 = false,
                            quarterCheck4 = false,
                            activeGameLog.update('quarterNo',(vale) => 1),
                          },
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              quarterCheck1 ? Colors.orange : Colors.grey,
                        ),
                        child: const Text('1Q'),
                      ),
                      ElevatedButton(
                          onPressed: () => setState(
                                () => {
                                  quarterCheck1 = false,
                                  quarterCheck2 = !quarterCheck2,
                                  quarterCheck3 = false,
                                  quarterCheck4 = false,
                                  activeGameLog.update('quarterNo',(vale) => 2),
                                  debugPrint(activeGameLog['quarterNo'].toString()),
                                },
                              ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                quarterCheck2 ? Colors.orange : Colors.grey,
                          ),
                          child: const Text('2Q')),
                      ElevatedButton(
                          onPressed: () => setState(() => {
                                  quarterCheck1 = false,
                                  quarterCheck2 = false,
                                  quarterCheck3 = !quarterCheck3,
                                  quarterCheck4 = false,
                                  activeGameLog.update('quarterNo',(vale) => 3),
                            debugPrint(activeGameLog['quarterNo'].toString()),
                                },
                              ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                quarterCheck3 ? Colors.orange : Colors.grey,
                          ),
                          child: const Text('3Q')),
                      ElevatedButton(
                          onPressed: () => setState(
                                () => {
                                  quarterCheck1 = false,
                                  quarterCheck2 = false,
                                  quarterCheck3 = false,
                                  quarterCheck4 = !quarterCheck4,
                                  activeGameLog.update('quarterNo',(vale) => 4),
                                  debugPrint(activeGameLog['quarterNo'].toString()),
                                },
                              ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                quarterCheck4 ? Colors.orange : Colors.grey,
                          ),
                          child: const Text('4Q')),
                    ],
                  ),
                  //チームBの括り
                  Column(
                    children: [
                      Text(
                        //widget.teamB![widget.regularB![0]]['number'].toString(),
                        activeB5[0].toString(),
                        style: const TextStyle(fontSize: 25.0),
                      ),
                      Text(
                        //widget.teamB![widget.regularB![1]]['number'].toString(),
                        activeB5[1].toString(),
                        style: const TextStyle(fontSize: 25.0),
                      ),
                      Text(
                        //widget.teamB![widget.regularB![2]]['number'].toString(),
                        activeB5[2].toString(),
                        style: const TextStyle(fontSize: 25.0),
                      ),
                      Text(
                        //widget.teamB![widget.regularB![3]]['number'].toString(),
                        activeB5[3].toString(),
                        style: const TextStyle(fontSize: 25.0),
                      ),
                      Text(
                        //widget.teamB![widget.regularB![4]]['number'].toString(),
                        activeB5[4].toString(),
                        style: const TextStyle(fontSize: 25.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //２／３の上部グループ
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: ListView.builder(
                    itemCount: activeGameLogToString.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                          child: ListTile(
                            title: Text(activeGameLogToString[activeGameLogToString.length-index-1].toString()),
                            //title: Text(activeGameLogToString[index].toString()),
                          ),
                      );},
                ),
              ),
            ),
            //３／３の上部グループ
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.orange,
                  width: 3.0,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        //TimeOutの処理
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: ElevatedButton(
                            onPressed: () async {
                              final int? selectedInt = await showDialog<int>(
                                  context: context,
                                  builder: (_) =>  TimeOutScreen());
                              int? QNo = activeGameLog['quarterNo'];
                              selectedInt == 0
                                  ? {
                                teamName = MainScreen.teamAName,
                              setState(() {
                                timeOutA[QNo!] = timeOutA[QNo] + 1;
                              activeGameLogToString.add(
                              '第 $QNo Q：$teamNameが,${timeOutA[QNo].toString()}'
                              '回目のタイムアウトを取った');
                              }),
                              }
                                  : {
                                teamName = MainScreen.teamBName,
                              setState(() {
                                timeOutB[QNo!] = timeOutB[QNo] + 1;
                              activeGameLogToString.add(
                              '第$QNo Q：$teamNameが,${timeOutB[QNo].toString()}'
                              '回目のタイムアウトを取った');
                              debugPrint('Qno:$QNo,回数:${timeOutB[QNo]}');
                              }),
                              };

                            },
                            style: ElevatedButton.styleFrom(
                                elevation: 3.0,
                                backgroundColor: Colors.deepOrange,
                                fixedSize: const Size(20, 60.0),
                                side: const BorderSide(
                                  color: Colors.black,
                                  width: 3.0,
                                )),
                            child: const Text(
                              'TimeOut',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(

                        //MemberChangeの処理
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: ElevatedButton(
                            onPressed: () => showModalBottomSheet(
                              context: context,
                              builder: (context) => const MemberChangeScreen(),
                            ),
                            style: ElevatedButton.styleFrom(
                                elevation: 3.0,
                                backgroundColor: Colors.blue,
                                fixedSize: const Size(20, 60.0),
                                side: const BorderSide(
                                  color: Colors.black,
                                  width: 3.0,
                                )),
                            child:  const Text(
                              'MemberChange',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: ElevatedButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) => GoalScreen(regularA: activeA5, regularB: activeB5));
                            },
                            style: ElevatedButton.styleFrom(
                                elevation: 3.0,
                                backgroundColor: Colors.yellow,
                                fixedSize: const Size(20, 60.0),
                                side: const BorderSide(
                                  width: 3.0,
                                )),
                            child: const Text(
                              'GOAL',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: ElevatedButton(
                            onPressed: () => showModalBottomSheet(
                              context: context,
                              builder: (context) => FoulScreen(),
                            ),
                            style: ElevatedButton.styleFrom(
                                elevation: 3.0,
                                backgroundColor: Colors.red,
                                fixedSize: const Size(20, 60.0),
                                side: const BorderSide(
                                  width: 3.0,
                                )),
                            child: const Text(
                              'Foul',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  void activeFlesh(){
    activeA5 = [
      widget.teamA![widget.regularA![0]]['number'],
      widget.teamA![widget.regularA![1]]['number'],
      widget.teamA![widget.regularA![2]]['number'],
      widget.teamA![widget.regularA![3]]['number'],
      widget.teamA![widget.regularA![4]]['number'],];
    activeB5 = [
      widget.teamB![widget.regularB![0]]['number'],
      widget.teamB![widget.regularB![1]]['number'],
      widget.teamB![widget.regularB![2]]['number'],
      widget.teamB![widget.regularB![3]]['number'],
      widget.teamB![widget.regularB![4]]['number'],];
  }
}
