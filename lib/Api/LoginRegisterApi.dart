import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kalkulator_luas/Api/ApiUtama.dart';

class Api {
  static var tok1 = "";
  static var eror2 = "";

  static Future<http.Response> loginUser(String email, String password) async {
    final response = await http.post(
      Uri.parse(CalculateLuasApi.baseUrl + '/login'),
      body: {'Email' : email, 'Password': password},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      tok1 = jsonResponse["Token"];
    } else {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      eror2 = jsonResponse["Error"];
    }

    return response;
  }

  static Future<http.Response> registerUser(String fullname, String username, String email, String password) async {
    final response = await http.post(
      Uri.parse(CalculateLuasApi.baseUrl + '/signup'),
      body: {
        'Fullname': fullname,
        'Username': username,
        'Email': email,
        'Password': password,
      },
    );
    return response;
  }
}