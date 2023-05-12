import 'package:note_app/domain/model/note.dart';
import 'package:note_app/domain/repository/note_repository.dart';

class UpdateNoteUseCase {
  final NoteRepository noteRepository;

  UpdateNoteUseCase(this.noteRepository);

  Future<void> call(Note note) async {
    await noteRepository.updateNote(note);
  }
}
