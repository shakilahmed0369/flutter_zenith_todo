import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:zenith_todo/pages/home.dart';
import 'package:zenith_todo/pages/take_note.dart';

void main() async {
  // init hive
  await Hive.initFlutter();
  // open a box
  var noteBox = await Hive.openBox('notes');

  // run app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zenith Todo',
      routes: {
        '/': (context) => const Home(),
        'takeNote': (context) => TakeNote(),
      },
    );
  }
}
