import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kalkulator_luas/Api/ApiUtama.dart';

class JajarGenjang {
  final int id;
  final double alas;
  final double tinggi;
  final double luas;

  JajarGenjang({
    required this.id,
    required this.alas,
    required this.tinggi,
    required this.luas,
});

  factory JajarGenjang.fromJson(Map<String, dynamic> json) {
    return JajarGenjang(
        id: json['id'],
        alas: json['alas'].toDouble(),
        tinggi: json['tinggi'].toDouble(),
        luas: json['luas'].toDouble(),
    );
  }
}

Future<List<JajarGenjang>> getJajarGenjangHistory() async {
  final response = await http.get(Uri.parse( CalculateLuasApi.baseUrl + '/luas-jajar-genjang'));

  if (response.statusCode == 200) {
    final List<dynamic> responseData = jsonDecode(response.body);
    return responseData.map((json) => JajarGenjang.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load siswa');
  }
}