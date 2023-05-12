import 'package:note_app/domain/repository/note_repository.dart';

import '../model/note.dart';

class AddNoteUseCase {
  final NoteRepository noteRepository;

  AddNoteUseCase(this.noteRepository);

  Future<void> call(Note note) async {
    await noteRepository.insertNote(note);
  }
}
