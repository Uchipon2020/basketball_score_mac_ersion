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
  bool quarterCheck1 = true;
  bool quarterCheck2 = false;
  bool quarterCheck3 = false;
  bool quarterCheck4 = false;
  List<Map> activeGameLog = [
    {
      'quarterNo': 0,
      'TeamAPoint': 0,
      'TeamBPoint': 0,
      'TeamAFoul': 0,
      'TeamBFoul': 0,
      'FoulNo': 0,
    }
  ];
  List<String> activeGameLogToString = [];
  @override
  Widget build(BuildContext context) {
    //アクティブログを文字列に変換して格納

    return Scaffold(
      appBar: AppBar(
        title: const Text('ゲーム記録中！！'),
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
                        widget.teamA![widget.regularA![0]]['number'].toString(),
                        style: const TextStyle(fontSize: 25.0),
                      ),
                      Text(
                        widget.teamA![widget.regularA![1]]['number'].toString(),
                        style: const TextStyle(fontSize: 25.0),
                      ),
                      Text(
                        widget.teamA![widget.regularA![2]]['number'].toString(),
                        style: const TextStyle(fontSize: 25.0),
                      ),
                      Text(
                        widget.teamA![widget.regularA![3]]['number'].toString(),
                        style: const TextStyle(fontSize: 25.0),
                      ),
                      Text(
                        widget.teamA![widget.regularA![4]]['number'].toString(),
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
                                },
                              ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                quarterCheck2 ? Colors.orange : Colors.grey,
                          ),
                          child: const Text('2Q')),
                      ElevatedButton(
                          onPressed: () => setState(
                                () => {
                                  quarterCheck1 = false,
                                  quarterCheck2 = false,
                                  quarterCheck3 = !quarterCheck3,
                                  quarterCheck4 = false,
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
                        widget.teamB![widget.regularB![0]]['number'].toString(),
                        style: const TextStyle(fontSize: 25.0),
                      ),
                      Text(
                        widget.teamB![widget.regularB![1]]['number'].toString(),
                        style: const TextStyle(fontSize: 25.0),
                      ),
                      Text(
                        widget.teamB![widget.regularB![2]]['number'].toString(),
                        style: const TextStyle(fontSize: 25.0),
                      ),
                      Text(
                        widget.teamB![widget.regularB![3]]['number'].toString(),
                        style: const TextStyle(fontSize: 25.0),
                      ),
                      Text(
                        widget.teamB![widget.regularB![4]]['number'].toString(),
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
                      return Dismissible(
                        key: UniqueKey(),
                        child: Card(
                          child: ListTile(
                            title: Text(activeGameLogToString[index].toString()),
                          ),
                        ),
                      );
                    }),
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
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                activeGameLogToString.add('TimeOutが押されたよ！！');
                              });
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
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                elevation: 3.0,
                                backgroundColor: Colors.deepOrange,
                                fixedSize: const Size(20, 60.0),
                                side: const BorderSide(
                                  color: Colors.black,
                                  width: 3.0,
                                )),
                            child: const Text(
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
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                elevation: 3.0,
                                backgroundColor: Colors.deepOrange,
                                fixedSize: const Size(20, 60.0),
                                side: const BorderSide(
                                  color: Colors.black,
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
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                elevation: 3.0,
                                backgroundColor: Colors.deepOrange,
                                fixedSize: const Size(20, 60.0),
                                side: const BorderSide(
                                  color: Colors.black,
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
}
