import 'package:ar_app/main_page.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App MVVC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
