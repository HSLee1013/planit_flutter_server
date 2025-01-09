import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../main.dart';

class SessionUser {
  int? id;
  String? username;
  String? accessToken;
  bool? isLogin;

  SessionUser({this.id, this.username, this.accessToken, this.isLogin});
}

class SessionGVM extends Notifier<SessionUser> {
  final mContext = navigatorKey.currentContext!;

  // UserRepository userRepository = const UserRepository();

  @override
  SessionUser build() {
    return SessionUser(
        id: null, username: null, accessToken: null, isLogin: false);
  }

  Future<void> login() async {
    Navigator.popAndPushNamed(mContext, "/mainpage");
  }

  Future<void> join(String username, String email, String password) async {
    // final body = {
    //   "username": username,
    //   "email": email,
    //   "password": password,
    // };
    //
    // Map<String, dynamic> responseBody = await userRepository.save(body);
    // if (!responseBody["success"]) {
    //   ScaffoldMessenger.of(mContext!).showSnackBar(
    //     SnackBar(content: Text("회원가입 실패 : ${responseBody["errorMessage"]}")),
    //   );
    //   return;
    // }
    //
    // Navigator.pushNamed(mContext, "/login");
  }

  Future<void> logout() async {}

  Future<void> autoLogin() async {
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.popAndPushNamed(mContext, "/login");
      },
    );
  }
}

final sessionProvider = NotifierProvider<SessionGVM, SessionUser>(() {
  return SessionGVM();
});
