import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kalkulator_luas/Api/ApiUtama.dart';

class Persegi {
  final int id;
  final double sisi;
  final double luas;

  Persegi({
    required this.id,
    required this.sisi,
    required this.luas,
});

  factory Persegi.fromJson(Map<String, dynamic> json) {
    return Persegi(
        id: json['id'],
        sisi: json['sisi'].toDouble(),
        luas: json['luas'].toDouble(),
    );
  }
}

Future<List<Persegi>> getPersegiHistory() async {
  final response = await http.get(Uri.parse( CalculateLuasApi.baseUrl + '/luas-persegi'));

  if (response.statusCode == 200) {
    final List<dynamic> responseData = jsonDecode(response.body);
    return responseData.map((json) => Persegi.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load siswa');
  }
}