import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kalkulator_luas/Api/ApiUtama.dart';

class Lingkaran {
  final int id;
  final double jari;
  final double diameter;
  final double luas;

  Lingkaran({
    required this.id,
    required this.jari,
    required this.diameter,
    required this.luas,
});

  factory Lingkaran.fromJson(Map<String, dynamic> json) {
    return Lingkaran(
        id: json['id'],
        jari: json['jari'].toDouble(),
        diameter: json['diameter'].toDouble(),
        luas: json['luas'].toDouble(),
    );
  }
}

Future<List<Lingkaran>> getLingkaranHistory() async {
  final response = await http.get(Uri.parse( CalculateLuasApi.baseUrl + '/luas-lingkaran'));

  if (response.statusCode == 200) {
    final List<dynamic> responseData = jsonDecode(response.body);
    return responseData.map((json) => Lingkaran.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load siswa');
  }
}