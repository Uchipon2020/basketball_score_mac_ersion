
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TeamBMembers extends StatefulWidget {
  List<Map>? membersB;
  String team;
  TeamBMembers({Key? key, required this.membersB, required this.team})
      : super(key: key);
  @override
  State<TeamBMembers> createState() => _TeamBMembersState();
}

class _TeamBMembersState extends State<TeamBMembers> {
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
          widget.team,
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.limeAccent,
      ),
      body: ListView.builder(
        itemCount: widget.membersB!.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              debugPrint('onTap');
              inputDialog(context, index).then((value) => updateScreen(), );
            },
            child: Card(
              child: Row(
                children: [
                  Container(
                    width: 50.0,
                    height: 50.0,
                    alignment: Alignment.center,
                    child: Text(
                      widget.membersB![index]['number'].toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20.0),
                    ),
                  ),
                  const SizedBox(width: 40.0),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.membersB![index]['name'].toString(),
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
        backgroundColor: Colors.limeAccent,
        tooltip: 'Increment',
        child: const Icon(
          Icons.save,
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
                height: 100,
                child: Column(
                  children: [
                    TextFormField(
                      controller: numberController,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      focusNode: FocusNode(),
                      maxLength: 3,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: widget.membersB![_index]['number'].toString(),
                      ),
                    ),
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: widget.membersB![_index]['name'].toString(),
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
                      widget.membersB![_index]['number']= int.parse(numberController.text);
                    });}
                    if(nameController.text != ""){
                      setState(() {
                        widget.membersB![_index]['name'] = nameController.text;
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
