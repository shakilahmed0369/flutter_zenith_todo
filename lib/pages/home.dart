import 'package:flutter/material.dart';
import 'package:zenith_todo/data/database.dart';
import 'package:zenith_todo/util/note.dart';
import 'package:zenith_todo/util/theme_colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final NoteDatabase database = NoteDatabase();

  @override
  void initState() {
    super.initState();
    refresh();
    setState(() {});
  }

  Future refresh() async {
    database.createInitialData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.primaryColor,
        title: const Center(
          child: Text(
            'Zenith Todo',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Playwrite',
              fontSize: 16,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, 'takeNote');
          refresh();
        },
        backgroundColor: ThemeColors.darkRedColor,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: ThemeColors.primaryColor,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        color: ThemeColors.primaryColor,
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: database.notes.length,
                itemBuilder: (context, index) {
                  return Note(
                    title: database.notes[index][0],
                    description: database.notes[index][1],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
