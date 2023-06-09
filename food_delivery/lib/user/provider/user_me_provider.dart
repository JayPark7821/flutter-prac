import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:food_delivery/common/const/data.dart';
import 'package:food_delivery/common/secure_storage/secure_storage.dart';
import 'package:food_delivery/user/repository/auth_repository.dart';
import 'package:food_delivery/user/repository/user_me_repository.dart';

import '../model/user_model.dart';

final userMeProvider =
    StateNotifierProvider<UserMeStateNotifier, UserModelBase?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  final userMeRepository = ref.watch(userMeRepositoryProvider);
  final storage = ref.watch(secureStorageProvider);
  return UserMeStateNotifier(
      authRepository: authRepository,
      repository: userMeRepository,
      storage: storage);
});

class UserMeStateNotifier extends StateNotifier<UserModelBase?> {
  final AuthRepository authRepository;
  final UserMeRepository repository;
  final FlutterSecureStorage storage;

  UserMeStateNotifier({
    required this.authRepository,
    required this.repository,
    required this.storage,
  }) : super(UserModelLoading()) {
    getMe();
  }

  Future<void> getMe() async {
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);
    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);

    if (refreshToken == null || accessToken == null) {
      state = null;
      return;
    }
    final response = await repository.getMe();
    state = response;
  }

  Future<UserModelBase> login({
    required String username,
    required String password,
  }) async {
    try {
      state = UserModelLoading();
      final response =
          await authRepository.login(username: username, password: password);

      await storage.write(key: REFRESH_TOKEN_KEY, value: response.refreshToken);
      await storage.write(key: ACCESS_TOKEN_KEY, value: response.accessToken);

      final userResponse = await repository.getMe();
      state = userResponse;
      return userResponse;
    } catch (e) {
      state = UserModelError(message: "로그인 실패");
      return Future.value(state);
    }
  }

  Future<void> logout() async {
    state = null;
    await Future.wait(
      [
        storage.delete(key: REFRESH_TOKEN_KEY),
        storage.delete(key: ACCESS_TOKEN_KEY)
      ],
    );
  }
}
