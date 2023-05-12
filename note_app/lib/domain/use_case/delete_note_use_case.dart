import 'package:note_app/domain/repository/note_repository.dart';

import '../model/note.dart';

class DeleteNoteUseCase {
  final NoteRepository noteRepository;

  DeleteNoteUseCase(this.noteRepository);

  Future<void> call(Note note) async {
    await noteRepository.deleteNote(note);
  }
}
