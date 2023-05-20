import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/common/const/colors.dart';
import 'package:food_delivery/common/layout/default_layout.dart';
import 'package:food_delivery/user/model/user_model.dart';
import 'package:food_delivery/user/provider/user_me_provider.dart';

import '../../common/component/custom_text_form_field.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static String get routeName => 'login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(userMeProvider);
    return DefaultLayout(
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const _Title(),
                const SizedBox(height: 16.0),
                const _SubTitle(),
                Image.asset(
                  "asset/img/misc/logo.png",
                  width: MediaQuery.of(context).size.width / 3 * 2,
                ),
                const SizedBox(height: 8.0),
                CustomTextFormField(
                  onChanged: (String value) {
                    username = value;
                  },
                  hintText: "이메일을 입력해주세요",
                ),
                const SizedBox(height: 8.0),
                CustomTextFormField(
                  onChanged: (String value) {
                    password = value;
                  },
                  hintText: "비밀번호 입력해주세요",
                  obscureText: true,
                ),
                const SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: state is UserModelLoading
                      ? null
                      : () async {
                          ref
                              .read(userMeProvider.notifier)
                              .login(username: username, password: password);
                          // final rawString = '$username:$password';
                          // final token = base64.encode(utf8.encode(rawString));
                          // final response = await dio.post(
                          //   'http://$ip/auth/login',
                          //   options: Options(
                          //     headers: {'authorization': 'Basic $token'},
                          //   ),
                          // );
                          //
                          // final refreshToken = response.data['refreshToken'];
                          // final accessToken = response.data['accessToken'];
                          // await ref
                          //     .read(secureStorageProvider)
                          //     .write(key: REFRESH_TOKEN_KEY, value: refreshToken);
                          // await ref
                          //     .read(secureStorageProvider)
                          //     .write(key: ACCESS_TOKEN_KEY, value: accessToken);
                          // Navigator.of(context).push(
                          //     MaterialPageRoute(builder: (_) => const RootTab()));
                        },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: PRIMARY_COLOR),
                  child: Text("로그인"),
                ),
                const SizedBox(height: 8.0),
                TextButton(
                    onPressed: () async {},
                    child: Text('회원가입', style: TextStyle(color: Colors.black)))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "환영합니다!",
      style: TextStyle(
        fontSize: 34,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class _SubTitle extends StatelessWidget {
  const _SubTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "이메일과 비밀번호를 입력해서 로그인 해주세요!\n 오늘도 성공적인 주문이되길:)",
      style: TextStyle(
        fontSize: 16,
        color: BODY_TEXT_COLOR,
      ),
    );
  }
}
