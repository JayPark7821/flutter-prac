
import 'package:clean_arc_with_riverpod/common/config/router_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/root/root_tab_view_model.dart';

final rootTabViewModel = Provider<RootTabViewModel>((ref)=> RootTabViewModel());
final secureStorageProvider = Provider<FlutterSecureStorage>((ref) => FlutterSecureStorage());

final routerConfig = Provider<RouterConfig>((ref)=> RouterConfig(storage: ref.watch(secureStorageProvider)));

final routerProvider = Provider<GoRouter>((ref) {
  final provider = ref.read(routerConfig);

  return GoRouter(
    routes: provider.routes,
    initialLocation: '/splash',
    refreshListenable: provider,
    redirect: provider.redirectLogic,
  );
});
