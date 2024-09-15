import 'package:hive_flutter/adapters.dart';

class NoteDatabase {
  List notes = [];

  final _box = Hive.box('notes');

  void createInitialData() {
    _box.get('notes') == null ? notes = [] : notes = _box.get('notes');
    // notes = [];
  }

  void addNote(String title, String description) {
    createInitialData();
    notes.add([title, description]);
    var revercedNotes = notes.reversed.toList();
    _box.put('notes', revercedNotes);
  }

  void updateNote(String title, String description, int index) {
    createInitialData();
    notes[index] = [title, description];
    _box.put('notes', notes);
  }

  void deleteNote(int index) {
    createInitialData();
    notes.removeAt(index);
    _box.put('notes', notes);
  }
}
