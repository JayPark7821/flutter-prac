import 'package:note_app/domain/repository/note_repository.dart';

import '../model/note.dart';

class DeleteNote {
  final NoteRepository noteRepository;

  DeleteNote(this.noteRepository);

  Future<void> call(Note note) async {
    await noteRepository.deleteNote(note);
  }
}
