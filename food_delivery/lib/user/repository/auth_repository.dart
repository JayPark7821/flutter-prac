import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/common/dio/dio.dart';
import 'package:food_delivery/common/model/login_response.dart';
import 'package:food_delivery/common/model/token_response.dart';
import 'package:food_delivery/common/utils/data_utils.dart';

import '../../common/const/data.dart';

final authRepositoryProvider = Provider((ref) {
  final dio = ref.watch(dioProvider);
  return AuthRepository(baseUrl: 'http://$ip/auth', dio: dio);
});

class AuthRepository {
  final String baseUrl;
  final Dio dio;

  AuthRepository({
    required this.baseUrl,
    required this.dio,
  });

  Future<LoginResponse> login({
    required String username,
    required String password,
  }) async {
    final serialized = DataUtils.pathToUrl('$username:$password');
    final response = await dio.post(
      '$baseUrl/login',
      options: Options(
        headers: {'authorization': 'Basic $serialized'},
      ),
    );

    return LoginResponse.fromJson(response.data);
  }

  Future<TokenResponse> token() async {
    final response = await dio.post('$baseUrl/token',
        options: Options(
          headers: {'refreshToken': 'true'},
        ));
    return TokenResponse.fromJson(response.data);
  }
}
