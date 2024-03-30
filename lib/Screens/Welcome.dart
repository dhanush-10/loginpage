import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("DashBoard"),
      ),
      body: Container(
        height: 100,
        width: 100,
        color: Colors.orange,
        child: Text("Welcome "),
      ),
    );
  }
}