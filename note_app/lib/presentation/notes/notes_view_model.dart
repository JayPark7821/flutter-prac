import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:note_app/domain/model/note.dart';
import 'package:note_app/domain/repository/note_repository.dart';
import 'package:note_app/presentation/notes/notes_event.dart';

class NoteViewModel with ChangeNotifier {
  final NoteRepository repository;

  List<Note> _notes = [];

  UnmodifiableListView<Note> get notes => UnmodifiableListView(_notes);
  Note? _recentlyDeletedNote;

  NoteViewModel(this.repository);

  void onEvent(NotesEvent event) {
    event.when(
      loadNotes: () {},
      deleteNote: (note) {},
      restoreNote: () {},
    );
  }

  Future<void> _loadNotes() async {
    _notes = await repository.getNotes();
    notifyListeners();
  }

  Future<void> _deleteNote(Note note) async {
    await repository.deleteNote(note);
    _recentlyDeletedNote = note;
    await _loadNotes();
  }

  Future<void> _restoreNote() async {
    if (_recentlyDeletedNote != null) {
      await repository.insertNote(_recentlyDeletedNote!);
      _recentlyDeletedNote = null;
      _loadNotes();
    }
  }
}
