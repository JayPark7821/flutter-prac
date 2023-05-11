import 'package:flutter/material.dart';
import 'package:note_app/domain/repository/note_repository.dart';
import 'package:note_app/presentation/add_edit_note/add_edit_note_event.dart';

import '../../domain/model/note.dart';

class AddEditNoteViewModel with ChangeNotifier {
  final NoteRepository noteRepository;

  int _color = Colors.orange.value;

  int get color => _color;

  AddEditNoteViewModel(this.noteRepository);

  void onEvent(AddEditNoteEvent event) {
    event.when(
      changeColor: _changeColor,
      saveNote: _saveNote,
    );
  }

  Future<void> _changeColor(int color) async {
    _color = color;
    notifyListeners();
  }

  Future<void> _saveNote(int? id, String title, String content) async {
    if (id == null) {
      await noteRepository.insertNote(Note(
        title: title,
        content: content,
        timestamp: DateTime.now().millisecondsSinceEpoch,
        color: _color,
      ));
    } else {
      await noteRepository.updateNote(Note(
        id: id,
        title: title,
        content: content,
        timestamp: DateTime.now().millisecondsSinceEpoch,
        color: _color,
      ));
    }
  }
}
