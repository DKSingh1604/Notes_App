import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:isar_crud/models/note.dart';
import 'package:path_provider/path_provider.dart';

class NoteDatabase extends ChangeNotifier {
  static late Isar isar;

  //INITIALIZE THE DATABASE
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [NoteSchema],
      directory: dir.path,
    );
  }

  //list of notes
  final List<Note> currentNotes = [];

  //CREATE - A NOTE AND SAVE TO THE DB
  Future<void> addNote(String textFromUser) async {
    //create a new note
    final newNote = Note()..text = textFromUser;

    //save to db
    await isar.writeTxn(() => isar.notes.put(newNote));

    //re-read notes from db
  }

  //READ - NOTES FROM DB
  Future<void> fetchNotes() async {
    List<Note> fetchedNotes = await isar.notes.where().findAll();
    currentNotes.clear();
    currentNotes.addAll(fetchedNotes);
    notifyListeners();
  }

  //UPDATE - A NOTE IN DB
  Future<void> updateNote(int id, String newText) async {
    final existingNote = await isar.notes.get(id);
    if (existingNote != null) {
      existingNote.text = newText;
      await isar.writeTxn(() => isar.notes.put(existingNote));
      await fetchNotes();
    }
  }

  //DELETE - A NOTE FROM THE DB
  Future<void> deleteNote(int id) async {
    await isar.writeTxn(() => isar.notes.delete(id));
    await fetchNotes();
  }
}
