import 'dart:async';

import 'package:flutter/material.dart';
import 'package:note_app/domain/repository/note_repository.dart';
import 'package:note_app/presentation/add_edit_note/add_edit_note_event.dart';
import 'package:note_app/presentation/add_edit_note/add_edit_note_ui_event.dart';
import 'package:note_app/ui/colors.dart';

import '../../domain/model/note.dart';

class AddEditNoteViewModel with ChangeNotifier {
  final NoteRepository noteRepository;

  int _color = roseBud.value;

  int get color => _color;

  final _eventController = StreamController<AddEditNoteUiEvent>.broadcast();

  Stream<AddEditNoteUiEvent> get eventStream => _eventController.stream;

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
    if (title.isEmpty || content.isEmpty) {
      _eventController.add(
          const AddEditNoteUiEvent.showSnackBar('title or content is empty'));
      return;
    }
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
    _eventController.add(const AddEditNoteUiEvent.saveNote());
  }
}
