import 'package:flutter/material.dart';
import 'package:zenith_todo/data/database.dart';
import 'package:zenith_todo/util/theme_colors.dart';

class NoteView extends StatefulWidget {
  const NoteView({super.key});

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  NoteDatabase database = NoteDatabase();

  final _noteTitleController = TextEditingController();

  final _noteDescriptionController = TextEditingController();

  @override
  void initState() {
    database.createInitialData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final int id = arguments['id'];

    _noteTitleController.text = database.notes[id][0];
    _noteDescriptionController.text = database.notes[id][1];

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: ThemeColors.primaryColor,
        centerTitle: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Zenith Todo',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Playwrite',
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_noteTitleController.text.isNotEmpty &&
              _noteDescriptionController.text.isNotEmpty) {
            database.updateNote(
                _noteTitleController.text, _noteDescriptionController.text, id);
          }

          Navigator.pop(context);
        },
        shape: const CircleBorder(),
        backgroundColor: ThemeColors.darkRedColor,
        child: const Icon(Icons.save, color: ThemeColors.primaryColor),
      ),
      body: Container(
        color: ThemeColors.primaryColor,
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          children: [
            TextField(
              controller: _noteTitleController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Title",
                hintStyle: TextStyle(
                  color: Colors.white10,
                ),
              ),
            ),
            TextField(
              controller: _noteDescriptionController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: const TextStyle(color: Colors.white, fontSize: 15),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Note",
                hintStyle: TextStyle(color: Colors.white10, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
