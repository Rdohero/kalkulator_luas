import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kalkulator_luas/Api/ApiUtama.dart';

class Api {
  static var tok1 = "";

  static Future<http.Response> loginUser(String email, String password) async {
    final response = await http.post(
      Uri.parse(CalculateLuasApi.baseUrl + '/login'),
      body: {'Email': email, 'password': password},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      tok1 = jsonResponse["Token"];
    } else {
      throw Exception('Failed to calculate luas Segitiga');
    }

    return response;
  }

  static Future<http.Response> registerUser(String email, String password) async {
    final response = await http.post(
      Uri.parse(CalculateLuasApi.baseUrl + '/signup'),
      body: {'Email': email,
              'password': password},
    );
    return response;
  }
}