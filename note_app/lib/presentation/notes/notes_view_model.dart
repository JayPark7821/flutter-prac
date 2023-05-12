import 'package:flutter/material.dart';
import 'package:note_app/domain/model/note.dart';
import 'package:note_app/domain/use_case/use_cases.dart';
import 'package:note_app/domain/util/order_type.dart';
import 'package:note_app/presentation/notes/notes_event.dart';
import 'package:note_app/presentation/notes/notes_state.dart';

import '../../domain/util/note_order.dart';

class NoteViewModel with ChangeNotifier {
  final UseCases useCases;

  NotesState _state = NotesState(
    noteOrder: const NoteOrder.date(OrderType.descending()),
  );

  NotesState get state => _state;
  Note? _recentlyDeletedNote;

  NoteViewModel(this.useCases) {
    _loadNotes();
  }

  void onEvent(NotesEvent event) {
    event.when(
      loadNotes: _loadNotes,
      deleteNote: _deleteNote,
      restoreNote: _restoreNote,
    );
  }

  Future<void> _loadNotes() async {
    _state =
        state.copyWith(notes: await useCases.getNotesUseCase(state.noteOrder));
    notifyListeners();
  }

  Future<void> _deleteNote(Note note) async {
    await useCases.deleteNoteUseCase(note);
    _recentlyDeletedNote = note;
    await _loadNotes();
  }

  Future<void> _restoreNote() async {
    if (_recentlyDeletedNote != null) {
      await useCases.addNoteUseCase(_recentlyDeletedNote!);
      _recentlyDeletedNote = null;
      _loadNotes();
    }
  }
}
