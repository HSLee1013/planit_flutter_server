import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../main.dart';
import '../repository/user_repository.dart';

class SessionUser {
  int? id;
  String? username;
  String? accessToken;
  bool? isLogin;

  SessionUser({this.id, this.username, this.accessToken, this.isLogin});
}

class SessionGVM extends Notifier<SessionUser> {
  final mContext = navigatorKey.currentContext!;
  UserRepository userRepository = const UserRepository();

  @override
  SessionUser build() {
    return SessionUser(
        id: null, username: null, accessToken: null, isLogin: false);
  }

  Future<void> login() async {
    Navigator.popAndPushNamed(mContext, "/mainpage");
  }

  Future<void> signup(String username, String email, String password) async {
    final body = {
      "username": username,
      "email": email,
      "password": password,
    };

    Map<String, dynamic> responseBody = await userRepository.save(body);
    Logger().d(responseBody);
    if (!responseBody["success"]) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("회원가입 실패 : ${responseBody["errorMessage"]}")),
      );
      return;
    }
    Logger().d(responseBody);
    Navigator.pushNamed(mContext, "/login");
  }

  Future<void> logout() async {
    Navigator.popAndPushNamed(mContext, "/login");
  }

  Future<void> autoLogin() async {
    Future.delayed(
      Duration(seconds: 1),
      () {
        Navigator.popAndPushNamed(mContext, "/login");
      },
    );
  }

  Future<void> checkDuplicateId(String username) async {
    if (username.isEmpty) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("아이디를 입력해주세요.")),
      );
      return;
    }

    try {
      final body = {"username": username};
      Map<String, dynamic> responseBody =
          await userRepository.checkUsername(body);
      if (!responseBody['success']) {
        ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("사용 가능한 아이디입니다.")),
        );
      } else {
        ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("이미 사용 중인 아이디입니다.")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("오류 발생: $e")),
      );
    }
  }

///////////////////////
  Future<void> ckoutUser(String username, String email, String password,
      String confirmPassword) async {
    if (username.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("모든 칸을 채워주세요.")),
      );
      return;
    }

    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("유효한 이메일 형식이 아닙니다.")),
      );
      return;
    }

    if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,15}$')
        .hasMatch(password)) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("비밀번호는 영문 + 숫자 조합, 8~15자여야 합니다.")),
      );
      return;
    }

    // 비밀번호 일치 여부 확인
    if (password != confirmPassword) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("비밀번호가 일치하지 않습니다.")),
      );
      return;
    }

    // 회원가입 처리
    try {
      await signup(username.trim(), email.trim(), password.trim());
    } catch (e) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("회원가입 실패")),
      );
    }
  }
}

final sessionProvider = NotifierProvider<SessionGVM, SessionUser>(() {
  return SessionGVM();
});
