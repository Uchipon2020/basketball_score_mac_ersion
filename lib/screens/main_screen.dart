import 'package:basketball_score_mac_ersion/screens/team_a_member_screen.dart';
import 'package:basketball_score_mac_ersion/screens/team_b_member_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String teamAName = 'チーム濃';
  String teamBName = 'チーム淡';
  List<Map> teamA = [];
  List<Map> teamB = [];
  final teamANameController = TextEditingController();
  final teamBNameController = TextEditingController();
  DateTime nowTime = DateTime.now();

  void _resetScreen() {
    setState(() {
      teamA = [];
      teamB = [];
      for(int i = 0 ; i <= 14 ; i++){
        int ii = i + 4 ;
        teamA.add({'number': ii ,'name': '' });
        teamB.add({'number': ii ,'name': '' });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    teamANameController.text = teamAName;
    teamBNameController.text = teamBName;
    debugPrint('$teamBName: $teamAName: $teamA :$teamB');

    if (teamA.isEmpty){_resetScreen();}
    return Scaffold(
      appBar: AppBar(title: const Text('メインページ')),
      body: Container(
        color: Colors.grey,
        child: Column(
          children: [
            Text('Play DateTime:$nowTime'),
            TextFormField(
              controller: teamANameController,
              onChanged: (value) {
                setState(() {
                  teamAName = teamANameController.text;
                });
              },
            ),
            const Text('VS'),
            TextFormField(
              controller: teamBNameController,
              onChanged: (value) {
                setState(() {
                  teamBName = teamBNameController.text;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(

                  onPressed: () async {
                    var result = await Navigator.of(context).push<List<dynamic>>(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation)
                        => TeamAMembers(membersA: teamA ,team: teamAName,),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          const Offset begin = Offset(-1.0, 0.0); // 右から左
                          // final Offset begin = Offset(-1.0, 0.0); // 左から右
                          const Offset end = Offset.zero;
                          final Animatable<Offset> tween =
                              Tween(begin: begin, end: end)
                                  .chain(CurveTween(curve: Curves.easeInOut));
                          final Animation<Offset> offsetAnimation =
                              animation.drive(tween);
                          return SlideTransition(
                            position: offsetAnimation,
                            child: child,
                          );
                        },
                      ),
                    );
                    teamA = result as List<Map<String,dynamic>>;
                  },
                  child: const Text('TeamA Member'),
                ),
                ElevatedButton(onPressed: () {}, child: const Text('Start')),
                ElevatedButton(
                    onPressed: () async {
                      var result = await Navigator.push<List<dynamic>>(context,
                        MaterialPageRoute(
                          builder: (context) => TeamBMembers(membersB: teamB,team: teamBName,),

                        ),
                      );
                      teamB = result as List<Map<String,dynamic>>;
                    },
                    child: const Text('TeamB Member')),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _resetScreen,
        tooltip: 'Increment',
        child: const Icon(Icons.refresh),
      ), //
    );
  }
}
