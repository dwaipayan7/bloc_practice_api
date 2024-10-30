import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen",
        style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
        elevation: 4,
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
