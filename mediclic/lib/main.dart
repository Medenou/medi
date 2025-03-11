import 'package:flutter/material.dart';

// ../mediclinique/lib/main.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyAppHome());
  }
}

class MyAppHome extends StatefulWidget {
  const MyAppHome({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppHomeState();
  }
}

class _MyAppHomeState extends State<MyAppHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
