import 'package:basketball_score_mac_ersion/screens/main_screens/goal/goal_team_select.dart';
import 'package:flutter/material.dart';

class GoalScreen extends StatefulWidget {
  List<int>? regularA;
  List<int>? regularB;
  GoalScreen({Key? key,required this.regularA,required this.regularB}) : super(key: key);

  @override
  State<GoalScreen> createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Goal!!'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      elevation: 3.0,
                      backgroundColor: Colors.indigo,
                      fixedSize: const Size(180, 80.0),
                      side: const BorderSide(
                        width: 3.0,
                      )),
                  child: const Text(
                    '2Pint',
                    style: TextStyle(fontSize: 30.0, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      elevation: 3.0,
                      backgroundColor: Colors.indigo,
                      fixedSize: const Size(180, 80.0),
                      side: const BorderSide(
                        width: 3.0,
                      )),
                  child: const Text(
                    '3Point',
                    style: TextStyle(fontSize: 30.0, color: Colors.white),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: ListView(
                  children:<Widget>[
                    Text(
                      widget.regularA![0].toString(),
                    ),

                    Text(
                      widget.regularA![1].toString(),
                    ),
                    Text(
                      widget.regularA![2].toString(),
                    ),
                    Text(
                      widget.regularA![3].toString()
                    ),
                    Text(
                      widget.regularA![4].toString()
                    ),
                  ],),
                )
              ],
            ),


            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {},
                  style: ElevatedButton.styleFrom(
                      elevation: 3.0,
                      backgroundColor: Colors.greenAccent,
                      fixedSize: const Size(180, 80.0),
                      side: const BorderSide(
                        width: 3.0,
                      )),
                  child: const Text(
                    '2',
                    style: TextStyle(fontSize: 30.0),
                  ),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      elevation: 3.0,
                      backgroundColor: Colors.greenAccent,
                      fixedSize: const Size(180, 80.0),
                      side: const BorderSide(
                        width: 3.0,
                      )),
                  child: const Text('3', style: TextStyle(fontSize: 30.0)),
                ),
              ],
            ),

        ]),
      ),
    );
  }
}
