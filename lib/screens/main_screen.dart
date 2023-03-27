import 'package:basketball_score_mac_ersion/screens/member_controll/team_a_member_screen.dart';
import 'package:basketball_score_mac_ersion/screens/member_controll/team_b_member_screen.dart';
import 'package:basketball_score_mac_ersion/screens/starting5_a.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  static String teamAName = 'チーム濃';
  static String teamBName = 'チーム淡';
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var teamA = List<Map<String,dynamic>>.empty();
  var teamB = List<Map<String,dynamic>>.empty();
  final teamANameController = TextEditingController();
  final teamBNameController = TextEditingController();
  DateTime nowTime = DateTime.now();

  void _resetScreen() {
    setState(() {
      teamA = [];
      teamB = [];
      for (int i = 0; i <= 14; i++) {
        int ii = i + 4;
        teamA.add({'number': ii, 'name': ''});
        teamB.add({'number': ii, 'name': ''});
      }
      teamANameController.text = MainScreen.teamAName;
      teamBNameController.text = MainScreen.teamBName;
    });
  }

  @override
  Widget build(BuildContext context) {
    //debugPrint('$MainScreen.teamBName: $MainScreen.teamAName: $teamA :$teamB');

    if (teamA.isEmpty) {
      _resetScreen();
    }
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
                  MainScreen.teamAName = teamANameController.text;
                });
              },
            ),
            const Text('VS'),
            TextFormField(
              controller: teamBNameController,
              onChanged: (value) {
                setState(() {
                  MainScreen.teamBName = teamBNameController.text;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    var result =
                        await Navigator.of(context).push<List<dynamic>>(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            TeamAMembers(
                          membersA: teamA,
                          team: MainScreen.teamAName,
                        ),
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
                    teamA = result as List<Map<String, dynamic>>;
                  },
                  child: const Text('TeamA Member'),
                ),

                //-----------MAIN----------
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StartingA(
                            teamA: teamA,
                            teamB: teamB,
                          ),
                        ),
                      );
                    },
                    child: const Text('Start')),

                //--------
                ElevatedButton(
                    onPressed: () async {
                      var result = await Navigator.push<List<dynamic>>(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TeamBMembers(
                            membersB: teamB,
                            team: MainScreen.teamBName,
                          ),
                        ),
                      );
                      teamB = result as List<Map<String, dynamic>>;
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
