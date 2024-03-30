import 'package:flutter/material.dart';

class New extends StatelessWidget {
  const New({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("New Page"),
        ),
        body: Container(
          height: 100,
          width: 100,
          color: Colors.blue,
        ));
  }
}
