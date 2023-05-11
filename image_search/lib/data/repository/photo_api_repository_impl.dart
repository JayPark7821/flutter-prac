import 'package:image_search/data/data_source/pixabay_api.dart';
import 'package:image_search/domain/repository/photo_api_repository.dart';

import '../../domain/photo.dart';
import '../data_source/result.dart';

class PhotoApiRepositoryImpl implements PhotoApiRepository {
  final PixabayApi api;

  PhotoApiRepositoryImpl(this.api);

  @override
  Future<Result<List<Photo>>> fetch(String query) async {
    final Result<Iterable> result = await api.fetch(query);
    return result.when(
      success: (result) {
        return Result.success(result.map((e) => Photo.fromJson(e)).toList());
      },
      error: (message) {
        return Result.error(message);
      },
    );
  }
}
