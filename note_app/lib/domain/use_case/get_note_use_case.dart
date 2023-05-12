import '../model/note.dart';
import '../repository/note_repository.dart';

class GetNoteUseCase {
  final NoteRepository noteRepository;

  GetNoteUseCase(this.noteRepository);

  Future<Note?> call(int id) async {
    return await noteRepository.getNoteById(id);
  }
}
