import 'package:flutter/material.dart';

import 'package:sqlfliteapp/screens/home_screen.dart';
import 'package:sqlfliteapp/screens/show_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      routes: {"showData":((context) => ShowScreen())},
    );
  }
}

