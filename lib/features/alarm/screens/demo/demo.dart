import 'package:flutter/material.dart';

class DemoScreen extends StatelessWidget {
  const DemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("D E M O S C R E E N")),
      backgroundColor: Colors.deepPurple,
      body: Center(child: Text("DEMO Screen")),
    );
  }
}
