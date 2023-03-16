import 'package:flutter/material.dart';

class FoulScreen extends StatefulWidget {
  const FoulScreen({Key? key}) : super(key: key);

  @override
  State<FoulScreen> createState() => _FoulScreenState();
}

class _FoulScreenState extends State<FoulScreen> {
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
