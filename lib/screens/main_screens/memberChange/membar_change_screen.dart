import 'package:flutter/material.dart';

class MemberChangeScreen extends StatefulWidget {
  const MemberChangeScreen({Key? key}) : super(key: key);

  @override
  State<MemberChangeScreen> createState() => _MemberChangeScreenState();
}

class _MemberChangeScreenState extends State<MemberChangeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Goal'),
      ),
      body: Container(),
    );

  }
}
