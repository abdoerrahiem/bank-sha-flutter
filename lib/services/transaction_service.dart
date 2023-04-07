import 'dart:convert';

import 'package:bank_sha/models/topup_form_model.dart';
import 'package:bank_sha/services/auth_service.dart';
import 'package:bank_sha/utils/constant.dart';
import 'package:http/http.dart' as http;

class TransactionService {
  Future<String> topUp(TopupFormModel data) async {
    try {
      final token = await AuthService().getToken();

      final res = await http
          .post(Uri.parse('$baseUrl/top_ups'), body: data.toJson(), headers: {
        'Authorization': token!,
      });

      if (res.statusCode == 200) {
        return jsonDecode(res.body)['redirect_url'];
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
