import 'package:flutter_test/flutter_test.dart';
import 'package:image_search/data/data_source/result.dart';
import 'package:image_search/domain/photo.dart';
import 'package:image_search/domain/repository/photo_api_repository.dart';
import 'package:image_search/domain/use_case/get_photos_use_case.dart';
import 'package:image_search/presentation/home/home_view_model.dart';

void main() {
  test("Stream이 잘 동작해야 한다.", () async {
    final viewModel = HomeViewModel(GetPhotosUseCase(FakePhotoApiRepository()));

    await viewModel.fetch('apple');

    final List<Photo> result = fakeJson.map((e) => Photo.fromJson(e)).toList();
    expect(viewModel.state.photos, result);
  });
}

class FakePhotoApiRepository extends PhotoApiRepository {
  @override
  Future<Result<List<Photo>>> fetch(String query) async {
    Future.delayed(const Duration(microseconds: 500));
    return Result.success(fakeJson.map((e) => Photo.fromJson(e)).toList());
  }
}

List<Map<String, dynamic>> fakeJson = [
  {
    "id": 634572,
    "pageURL":
        "https://pixabay.com/photos/apples-fruits-red-ripe-vitamins-634572/",
    "type": "photo",
    "tags": "apples, fruits, red",
    "previewURL":
        "https://cdn.pixabay.com/photo/2015/02/13/00/43/apples-634572_150.jpg",
    "previewWidth": 100,
    "previewHeight": 150,
    "webformatURL":
        "https://pixabay.com/get/g2ca60b62f1e329ce6c7974d9b818749336ba39ccfc198ec93f21bdb102c8413fd8505a09e32a28bc41ca3d3719ce023b_640.jpg",
    "webformatWidth": 427,
    "webformatHeight": 640,
    "largeImageURL":
        "https://pixabay.com/get/gd9e81c5bf5192b8fe4a855fc3047cedc8410a5666447386cf02f18387799d9d1c10f1b666cdc2ef62f38b09b9c79cd6b67a03b3fcf5eaff3432be4126e6ef829_1280.jpg",
    "imageWidth": 3345,
    "imageHeight": 5017,
    "imageSize": 811238,
    "views": 495446,
    "downloads": 294038,
    "collections": 1284,
    "likes": 2372,
    "comments": 195,
    "user_id": 752536,
    "user": "Desertrose7",
    "userImageURL":
        "https://cdn.pixabay.com/user/2016/03/14/13-25-18-933_250x250.jpg"
  },
  {
    "id": 1868496,
    "pageURL":
        "https://pixabay.com/photos/apple-computer-desk-workspace-1868496/",
    "type": "photo",
    "tags": "apple, computer, desk",
    "previewURL":
        "https://cdn.pixabay.com/photo/2016/11/29/08/41/apple-1868496_150.jpg",
    "previewWidth": 150,
    "previewHeight": 99,
    "webformatURL":
        "https://pixabay.com/get/g856d52ad2ebf0f767f5250b85d7c3a4bf01f1b4a3f629461de09c725a5b6310ee603cbd2fef6f10a8379d947cc660096f3e9caffd7fc7833b1500292bf1812ce_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 426,
    "largeImageURL":
        "https://pixabay.com/get/gf195ff10d7c82e780d5a4433a5e2d13d0720071f3be6ff2c96b91eb53021e5230f8d24789db9b3eaef515138350e48dd742ca1dd9399605403771f22bc2a1360_1280.jpg",
    "imageWidth": 5184,
    "imageHeight": 3456,
    "imageSize": 2735519,
    "views": 716362,
    "downloads": 524431,
    "collections": 1397,
    "likes": 1049,
    "comments": 280,
    "user_id": 2286921,
    "user": "Pexels",
    "userImageURL":
        "https://cdn.pixabay.com/user/2016/03/26/22-06-36-459_250x250.jpg"
  },
  {
    "id": 1873078,
    "pageURL": "https://pixabay.com/photos/apples-orchard-apple-trees-1873078/",
    "type": "photo",
    "tags": "apples, orchard, apple trees",
    "previewURL":
        "https://cdn.pixabay.com/photo/2016/11/30/15/23/apples-1873078_150.jpg",
    "previewWidth": 150,
    "previewHeight": 95,
    "webformatURL":
        "https://pixabay.com/get/g9a7fd8dae763cfcb90c84406dbced93e5daf2d4774ac3ecc10e28cdabacc8267950375b40e24b2cac24a7ba57f97719f128bff1f73a09ea39e743027cb0f37ab_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 408,
    "largeImageURL":
        "https://pixabay.com/get/gb553eb31a8bf41e2f0ef97ee30c4f4fa2a5a2cf261a769b248a61a6cf81fd90fba5f2787bc0809c122555917f7e7c7c7604af6fcc2945e16e05a4d655e9e1de3_1280.jpg",
    "imageWidth": 3212,
    "imageHeight": 2051,
    "imageSize": 2581012,
    "views": 458827,
    "downloads": 270996,
    "collections": 1146,
    "likes": 1157,
    "comments": 178,
    "user_id": 3890388,
    "user": "lumix2004",
    "userImageURL": ""
  },
  {
    "id": 1122537,
    "pageURL":
        "https://pixabay.com/photos/apple-water-droplets-fruit-moist-1122537/",
    "type": "photo",
    "tags": "apple, water droplets, fruit",
    "previewURL":
        "https://cdn.pixabay.com/photo/2016/01/05/13/58/apple-1122537_150.jpg",
    "previewWidth": 150,
    "previewHeight": 95,
    "webformatURL":
        "https://pixabay.com/get/gd35a54b2b94ec96b0c9e464395a47aaecc88b219c7aea3102eccd2c8d7266293c9e587be50ca2dee9a87a6f31e8ba7911415a3171db3a412d1004610d94a8c4e_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 409,
    "largeImageURL":
        "https://pixabay.com/get/g7924f5aebddb168593da2d60da3e73d31907aa4dd7bc6d1c658dd6a188b748e62c9314450d5571fe1bc380789d73238e98812094b0a1f7b965e64d4ae7413019_1280.jpg",
    "imageWidth": 4752,
    "imageHeight": 3044,
    "imageSize": 5213632,
    "views": 338416,
    "downloads": 197776,
    "collections": 1049,
    "likes": 1158,
    "comments": 189,
    "user_id": 1445608,
    "user": "mploscar",
    "userImageURL":
        "https://cdn.pixabay.com/user/2016/01/05/14-08-20-943_250x250.jpg"
  },
  {
    "id": 256261,
    "pageURL":
        "https://pixabay.com/photos/apple-books-still-life-fruit-food-256261/",
    "type": "photo",
    "tags": "apple, books, still life",
    "previewURL":
        "https://cdn.pixabay.com/photo/2014/02/01/17/28/apple-256261_150.jpg",
    "previewWidth": 150,
    "previewHeight": 99,
    "webformatURL":
        "https://pixabay.com/get/ga1c34986ea5334c27d5670ff53d3df91e7461fec974220c4359e970218b1978873c8bd9e13f3d6ddb4642dc9c91647c2_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 423,
    "largeImageURL":
        "https://pixabay.com/get/g787b232f7fcbc475349e87605aa54657c1a69814fa49006800d9ab5620bbd526dc6851f5c3cbdb3c38f9a6a02e0e97c69d92bc28afdb328115d263b6e6921721_1280.jpg",
    "imageWidth": 4928,
    "imageHeight": 3264,
    "imageSize": 2987083,
    "views": 526930,
    "downloads": 276645,
    "collections": 949,
    "likes": 976,
    "comments": 246,
    "user_id": 143740,
    "user": "jarmoluk",
    "userImageURL":
        "https://cdn.pixabay.com/user/2019/09/18/07-14-26-24_250x250.jpg"
  }
];
