import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kalkulator_luas/Api/ApiUtama.dart';

class Segitiga {
  final int id;
  final double alas;
  final double tinggi;
  final double luas;

  Segitiga({
    required this.id,
    required this.alas,
    required this.tinggi,
    required this.luas,
});

  factory Segitiga.fromJson(Map<String, dynamic> json) {
    return Segitiga(
        id: json['id'],
        alas: json['alas'].toDouble(),
        tinggi: json['tinggi'].toDouble(),
        luas: json['luas'].toDouble(),
    );
  }
}

Future<List<Segitiga>> getSegitigaHistory() async {
  final response = await http.get(Uri.parse( CalculateLuasApi.baseUrl + '/luas-segitiga'));

  if (response.statusCode == 200) {
    final List<dynamic> responseData = jsonDecode(response.body);
    return responseData.map((json) => Segitiga.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load siswa');
  }
}