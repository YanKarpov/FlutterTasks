import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';
import '../../../../core/constants/constants.dart';

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getUsers();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;

  UserRemoteDataSourceImpl({required this.client});

  @override
  Future<List<UserModel>> getUsers() async {
    final response = await client.get(Uri.parse('$BASE_URL/users'));
    if (response.statusCode == 200) {
      final List decoded = json.decode(response.body);
      return decoded.map((json) => UserModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
