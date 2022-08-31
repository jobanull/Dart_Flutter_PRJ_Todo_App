import 'package:flutter/material.dart';

import 'screen/add_todo.dart';
import 'screen/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      routes: {
        'homepage': (context) => HomePage(),
        'add_todo': (context) => AddTodo(),
      },
      initialRoute: 'homepage',
    );
  }
}
