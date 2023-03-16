
import 'package:basketball_score_mac_ersion/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TeamAMembers extends StatefulWidget {
  List<Map>? membersA;
  String team;
  TeamAMembers({Key? key, required this.membersA, required this.team})
      : super(key: key);
  @override
  State<TeamAMembers> createState() => _TeamAMembersState();
}

class _TeamAMembersState extends State<TeamAMembers> {
  final numberController = TextEditingController();
  final nameController = TextEditingController();

  void updateScreen(){
      setState(() {
      nameController.text = "";
      numberController.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          MainScreen.teamAName,
          style: const TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.indigo,
      ),
      body: ListView.builder(
        itemCount: widget.membersA!.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              debugPrint('onTap');
              inputDialog(context, index).then((value) => updateScreen(), );
            },
            child: Card(
              color: Colors.cyan,
              child: Row(
                children: [
                  Container(
                    width: 50.0,
                    height: 50.0,
                    alignment: Alignment.center,
                    child: Text(
                      widget.membersA![index]['number'].toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20.0),
                    ),
                  ),
                  const SizedBox(width: 40.0),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.membersA![index]['name'].toString(),
                        style: const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        backgroundColor: Colors.indigo,
        tooltip: 'Increment',
        child: const Icon(
          Icons.save,
          color: Colors.white,
        ),
      ),
    );
  }

  Future<void> inputDialog(BuildContext context, int _index) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: const Text('番号・名前変更'),
              content:  SizedBox(
                height: 120,
                child: Column(
                  children: [
                    TextFormField(
                      controller: numberController,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      focusNode: FocusNode(),
                      maxLength: 3,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: widget.membersA![_index]['number'].toString(),
                      ),
                    ),
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: widget.membersA![_index]['name'].toString(),
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    nameController.text = "";
                    numberController.text = "";
                    Navigator.pop(context);
                  },
                  child: const Text('キャンセル'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if(numberController.text != ""){
                    setState(() {
                      widget.membersA![_index]['number']= int.parse(numberController.text);
                    });}
                    if(nameController.text != ""){
                      setState(() {
                        widget.membersA![_index]['name'] = nameController.text;
                      });
                    }
                    Navigator.pop(context);
                  },
                  child: const Text('決定'),
                ),
              ]);
        });
  }
}
