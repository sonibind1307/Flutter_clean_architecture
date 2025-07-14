import 'dart:convert';

import 'package:animation/model/user_model.dart';
import 'package:dio/dio.dart';

class UserRepository {
  final Dio _dio = Dio();

  Future<List<User>> fetchUsers() async {
    final response = await _dio.get(
      "https://jsonplaceholder.typicode.com/users",
    );
    return (response.data as List).map((json) => User.fromJson(json)).toList();
  }

  Future<bool> createUser(User user) async {
    print("user -${jsonEncode(user)}");
    final response = await _dio.post(
      'https://reqres.in/api/users',
      data: user.toJson(),
    );
    return true;
  }
}
