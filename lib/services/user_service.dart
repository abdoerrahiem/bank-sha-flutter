import 'dart:convert';

import 'package:bank_sha/models/user_edit_model.dart';
import 'package:bank_sha/services/auth_service.dart';
import 'package:bank_sha/utils/constant.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<void> updateUser(UserEditModel data) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.put(
        Uri.parse('$baseUrl/users'),
        body: data.toJson(),
        headers: {
          'Authorization': token!,
        },
      );

      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
