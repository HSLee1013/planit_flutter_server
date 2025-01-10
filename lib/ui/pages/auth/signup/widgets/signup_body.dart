import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planit/data/gvm/session_gvm.dart';

class SignupBody extends ConsumerWidget {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

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
              SizedBox(height: 20),
              Text(
                '회원가입',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _username,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        labelText: "아이디",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      gvm.checkDuplicateId(_username.text.trim());
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(90, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text("중복확인"),
                  ),
                ],
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _email,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: "이메일",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _password,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: "비밀번호 (영문 + 숫자, 8~15자)",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _confirmPassword,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: "비밀번호 확인",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final username = _username.text.trim();
                  final email = _email.text.trim();
                  final password = _password.text.trim();
                  final confirmPassword = _confirmPassword.text.trim();

                  gvm.ckoutUser(username, email, password, confirmPassword);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text("회원가입"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
