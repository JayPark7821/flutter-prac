import 'dart:math';

import 'package:image_search/domain/repository/photo_api_repository.dart';

import '../../data/data_source/result.dart';
import '../photo.dart';

class GetPhotosUseCase {
  final PhotoApiRepository repository;

  GetPhotosUseCase(this.repository);

  Future<Result<List<Photo>>> call(String query) async {
    return (await repository.fetch(query)).when(
      success: (photos) {
        return Result.success(photos.sublist(0, min(3, photos.length)));
      },
      error: (message) {
        return Result.error(message);
      },
    );
  }
}
