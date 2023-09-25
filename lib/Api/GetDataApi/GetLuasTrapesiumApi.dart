import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kalkulator_luas/Api/ApiUtama.dart';

class Trapesium {
  final int id;
  final double sisia;
  final double sisib;
  final double tinggi;
  final double luas;

  Trapesium({
    required this.id,
    required this.sisia,
    required this.sisib,
    required this.tinggi,
    required this.luas,
});

  factory Trapesium.fromJson(Map<String, dynamic> json) {
    return Trapesium(
        id: json['id'],
        sisia: json['sisia'].toDouble(),
        sisib: json['sisib'].toDouble(),
        tinggi: json['tinggi'].toDouble(),
        luas: json['luas'].toDouble(),
    );
  }
}

Future<List<Trapesium>> getTrapesiumHistory() async {
  final response = await http.get(Uri.parse( CalculateLuasApi.baseUrl + '/luas-trapesium'));

  if (response.statusCode == 200) {
    final List<dynamic> responseData = jsonDecode(response.body);
    return responseData.map((json) => Trapesium.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load siswa');
  }
}