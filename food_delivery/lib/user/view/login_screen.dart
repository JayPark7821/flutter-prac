import 'package:flutter/material.dart';
import 'package:food_delivery/common/const/colors.dart';
import 'package:food_delivery/common/layout/default_layout.dart';

import '../../common/component/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  onChanged: (String value) {},
                  hintText: "이메일을 입력해주세요",
                ),
                const SizedBox(height: 8.0),
                CustomTextFormField(
                  onChanged: (String value) {},
                  hintText: "비밀번호 입력해주세요",
                  obscureText: true,
                ),
                const SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: () {},
                  style:
                      ElevatedButton.styleFrom(backgroundColor: PRIMARY_COLOR),
                  child: Text("로그인"),
                ),
                const SizedBox(height: 8.0),
                TextButton(
                    onPressed: () {},
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
