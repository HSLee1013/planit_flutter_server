import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../data/gvm/session_gvm.dart';

class LoginBody extends ConsumerWidget {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SessionGVM gvm = ref.read(sessionProvider.notifier);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        shrinkWrap: true,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/planit.png',
                      width: 170,
                      height: 170,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Planit',
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              // 아이디 입력
              TextFormField(
                controller: _username,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: "아이디",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 15),
              // 비밀번호 입력
              TextFormField(
                controller: _password,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: "비밀번호",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // 로그인 버튼
              ElevatedButton(
                onPressed: () {
                  // TODO 로그인 메서드 미완성
                  gvm.login();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text("로그인"),
              ),
              SizedBox(height: 20),
              // 하단 링크들
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/findId");
                    },
                    child: Text("아이디 찾기"),
                  ),
                  Text("|"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/findPassword");
                    },
                    child: Text("비밀번호 찾기"),
                  ),
                  Text("|"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/join");
                    },
                    child: Text("회원가입"),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
