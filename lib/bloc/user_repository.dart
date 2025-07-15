import 'dart:convert';

import 'package:animation/model/user_model.dart';
import 'package:dio/dio.dart';

class UserRepository {
  final Dio _dio = Dio();

  Future<List<PatientModel>> fetchUsers() async {
    // final response = await _dio.get(
    //   "https://jsonplaceholder.typicode.com/users",
    // );
    final response = await _dio.get(
      "http://127.0.0.1:8000/api/v1/patients/",
    );

    return (response.data as List).map((json) => PatientModel.fromJson(json)).toList();
  }

  Future<bool> createUser(PatientModel user) async {
    print("user -${jsonEncode(user)}");
    final response = await _dio.post(
      'https://reqres.in/api/users',
      data: user.toJson(),
    );
    return true;
  }
}
