import 'dart:async';
import 'dart:convert';

import 'package:bank_sha/models/login_model.dart';
import 'package:bank_sha/models/register_model.dart';
import 'package:bank_sha/models/user_model.dart';
import 'package:bank_sha/utils/constant.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<String> checkEmail(String email) async {
    try {
      final res = await http.post(Uri.parse('$baseUrl/is-email-exist'), body: {
        'email': email,
      });

      if (res.statusCode == 200) {
        return jsonDecode(res.body)['is_email_exist'] == true
            ? 'Email already exists'
            : 'success';
      } else {
        return jsonDecode(res.body)['errors']['email'][0];
      }
    } catch (e) {
      return 'Error happend, Try again later!';
    }
  }

  Future<UserModel> register(RegisterModel data) async {
    try {
      final res = await http.post(
        Uri.parse('$baseUrl/register'),
        body: data.toJson(),
      );

      if (res.statusCode == 200) {
        UserModel user = UserModel.fromJson(jsonDecode(res.body));
        user = user.copyWith(password: data.password);

        await saveUserCredentials(user);

        return user;
      } else if (res.statusCode == 413) {
        throw 'File size too large!';
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> login(LoginModel data) async {
    try {
      final res = await http.post(
        Uri.parse('$baseUrl/login'),
        body: data.toJson(),
      );

      if (res.statusCode == 200) {
        UserModel user = UserModel.fromJson(jsonDecode(res.body));
        user = user.copyWith(password: data.password);

        await saveUserCredentials(user);

        return user;
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> saveUserCredentials(UserModel user) async {
    try {
      const storage = FlutterSecureStorage();

      await storage.write(key: 'token', value: user.token);
      await storage.write(key: 'email', value: user.email);
      await storage.write(key: 'password', value: user.password);
    } catch (e) {
      rethrow;
    }
  }

  Future<LoginModel> getUserCredentials() async {
    try {
      const storage = FlutterSecureStorage();

      Map<String, String> data = await storage.readAll();

      if (data['email'] == null || data['password'] == null) {
        throw 'Unauthenticated';
      } else {
        final LoginModel loginData =
            LoginModel(email: data['email'], password: data['password']);

        return loginData;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> getToken() async {
    try {
      const storage = FlutterSecureStorage();

      String? token = await storage.read(key: 'token');

      if (token == null) {
        throw 'Token not found!';
      } else {
        return 'Bearer $token';
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> clearStorage() async {
    const storage = FlutterSecureStorage();
    await storage.deleteAll();
  }

  Future<void> logout() async {
    try {
      final token = await getToken();

      final res = await http.post(
        Uri.parse('$baseUrl/logout'),
        headers: {
          'Authorization': token!,
        },
      );

      if (res.statusCode == 200) {
        await clearStorage();
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
