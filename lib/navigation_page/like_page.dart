import 'package:flutter/material.dart';

class LikePage extends StatefulWidget {

  @override
  _LikePageState createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Likes"),
      ),
    );
  }
}
