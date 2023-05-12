import 'package:note_app/domain/repository/note_repository.dart';

import '../model/note.dart';

class GetNotesUseCase {
  final NoteRepository noteRepository;

  GetNotesUseCase(this.noteRepository);

  Future<List<Note>> call() async {
    var notes = await noteRepository.getNotes();
    notes.sort((a, b) => -a.timestamp.compareTo(b.timestamp));
    return notes;
  }
}
