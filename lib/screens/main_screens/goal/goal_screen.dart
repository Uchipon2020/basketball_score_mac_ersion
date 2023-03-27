import 'package:basketball_score_mac_ersion/screens/main_screens/goal/goal_team_select.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GoalScreen extends StatefulWidget {
  List<int>? regularA;
  List<int>? regularB;
  GoalScreen({Key? key, required this.regularA, required this.regularB})
      : super(key: key);

  @override
  State<GoalScreen> createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Goal!!'),
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
                    fixedSize: const Size(180, 60.0),
                    side: const BorderSide(
                      width: 3.0,
                    )),
                child: const Text('2 Point',
                    style: TextStyle(fontSize: 30.0, color: Colors.white)),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    elevation: 3.0,
                    backgroundColor: Colors.indigo,
                    fixedSize: const Size(180, 60.0),
                    side: const BorderSide(
                      width: 3.0,
                    )),
                child: const Text('3 Point',
                    style: TextStyle(
                        fontSize: 30.0, color: Colors.white)),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    elevation: 3.0,
                    shape: const CircleBorder(),
                    //padding:const  EdgeInsets.all(60),
                    backgroundColor: Colors.indigo,
                    fixedSize: const Size(50, 50),
                    side: const BorderSide(width: 3.0)),
                child: Text(widget.regularA![0].toString(),
                    style:const TextStyle(
                        color: Colors.white,
                    fontSize: 25.0)),
    ),
              const SizedBox(height: 5.0),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    elevation: 3.0,
                    shape: const CircleBorder(),
                    //padding:const  EdgeInsets.all(60),
                    backgroundColor: Colors.indigo,
                    fixedSize: const Size(50, 50),
                    side: const BorderSide(
                      width: 3.0,
                    )),
                child: Text(
                    widget.regularA![1].toString(),
                    style:const TextStyle(
                        color: Colors.white,
                    fontSize:25.0)),
              ),
              const SizedBox(height: 5.0),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    elevation: 3.0,
                    shape: const CircleBorder(),
                    //padding:const  EdgeInsets.all(60),
                    backgroundColor: Colors.indigo,
                    fixedSize: const Size(50, 50),
                    side: const BorderSide(width: 3.0)),
                child: Text(widget.regularA![2].toString(),
                    style:const TextStyle(
                        color: Colors.white,
                    fontSize: 25.0)),
              ),
              const SizedBox(height: 5.0),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    elevation: 3.0,
                    shape: const CircleBorder(),
                    //padding:const  EdgeInsets.all(60),
                    backgroundColor: Colors.indigo,
                    fixedSize: const Size(50, 50),
                    side: const BorderSide(
                      width: 3.0,
                    )),
                child: Text(widget.regularA![3].toString(),
                    style:const TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 5.0),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    elevation: 3.0,
                    shape: const CircleBorder(),
                    //padding:const  EdgeInsets.all(60),
                    backgroundColor: Colors.indigo,
                    fixedSize: const Size(50, 50),
                    side: const BorderSide(width: 3.0)),
                child: Text(widget.regularA![4].toString(),
                style: const TextStyle(color:Colors.white),),
              ),
              /*Container(
                  alignment: Alignment.centerLeft,
                  child: ListView(
                  children:[
                    Text(widget.regularA![0].toString()),
                    Text(widget.regularA![1].toString()),
                    Text(widget.regularA![2].toString()),
                    Text(widget.regularA![3].toString()),
                    Text(widget.regularA![4].toString()),
                  ],),
                )*/
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
                    fixedSize: const Size(180, 60.0),
                    side: const BorderSide(
                      width: 3.0,
                    )),
                child: const Text(
                  '2 Point',
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    elevation: 3.0,
                    backgroundColor: Colors.greenAccent,
                    fixedSize: const Size(180, 60.0),
                    side: const BorderSide(
                      width: 3.0,
                    )),
                child: const Text('3 Point', style: TextStyle(fontSize: 30.0)),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    elevation: 3.0,
                    shape: const CircleBorder(),
                    //padding:const  EdgeInsets.all(60),
                    backgroundColor: Colors.greenAccent,
                    fixedSize: const Size(50, 50),
                    side: const BorderSide(
                      width: 3.0,
                    )),
                child: Text(widget.regularB![0].toString()),
              ),
              const SizedBox(height: 5.0),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    elevation: 3.0,
                    shape: const CircleBorder(),
                    //padding:const  EdgeInsets.all(60),
                    backgroundColor: Colors.greenAccent,
                    fixedSize: const Size(50, 50),
                    side: const BorderSide(
                      width: 3.0,
                    )),
                child: Text(widget.regularB![1].toString()),
              ),
              const SizedBox(height: 5.0),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    elevation: 3.0,
                    shape: const CircleBorder(),
                    //padding:const  EdgeInsets.all(60),
                    backgroundColor: Colors.greenAccent,
                    fixedSize: const Size(50, 50),
                    side: const BorderSide(
                      width: 3.0,
                    )),
                child: Text(widget.regularB![2].toString()),
              ),
              const SizedBox(height: 5.0),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    elevation: 3.0,
                    shape: const CircleBorder(),
                    //padding:const  EdgeInsets.all(60),
                    backgroundColor: Colors.greenAccent,
                    fixedSize: const Size(50, 50),
                    side: const BorderSide(
                      width: 3.0,
                    )),
                child: Text(widget.regularB![3].toString()),
              ),
              const SizedBox(height: 5.0),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    elevation: 3.0,
                    shape: const CircleBorder(),
                    //padding:const  EdgeInsets.all(60),
                    backgroundColor: Colors.greenAccent,
                    fixedSize: const Size(50, 50),
                    side: const BorderSide(
                      width: 3.0,
                    )),
                child: Text(widget.regularB![4].toString()),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
