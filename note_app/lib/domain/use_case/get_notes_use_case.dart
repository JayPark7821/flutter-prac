import 'package:note_app/domain/repository/note_repository.dart';

import '../model/note.dart';

class GetNotesUseCase {
  final NoteRepository noteRepository;

  GetNotesUseCase(this.noteRepository);

  Future<List<Note>> call() async {
    return await noteRepository.getNotes();
  }
}
