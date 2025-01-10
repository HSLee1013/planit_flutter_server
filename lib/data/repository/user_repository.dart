import 'package:dio/dio.dart';

import '../../_core/utils/api_dio.dart';

// 사용자 데이터 저장
class UserRepository {
  const UserRepository();

  Future<Map<String, dynamic>> save(Map<String, dynamic> data) async {
    Response response = await dio.post("/signup", data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> checkUsername(Map<String, dynamic> data) async {
    Response response = await dio.post('/check-id', data: data);
    Map<String, dynamic> body = response.data;
    return body;
  }
}
