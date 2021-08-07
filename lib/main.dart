import 'package:flutter/material.dart';
import 'package:instagram_ui_task/navigation_page/home_page.dart';
import 'package:instagram_ui_task/pages/collect_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CollectPage(),
      routes: {
        HomePage.id: (context) =>HomePage(),
      },
    );
  }
}
