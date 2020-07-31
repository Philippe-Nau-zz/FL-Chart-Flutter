import 'package:charts/controller/config.dart';
import 'package:charts/views/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fl charts',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.deepPurple[800],
      ),
      darkTheme: ThemeData.dark(),
      themeMode: currentTheme.currentMode(),
      home: HomePage(),
    );
  }
}
