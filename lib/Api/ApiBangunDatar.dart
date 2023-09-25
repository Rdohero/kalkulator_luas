import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:kalkulator_luas/Api/ApiUtama.dart';

class Bangun {
  final int id;
  final String bangun;
  final String gambar;

  Bangun({
    required this.id,
    required this.bangun,
    required this.gambar,
  });

  factory Bangun.fromJson(Map<String, dynamic> json) {
    return Bangun(
      id: json['id'],
      bangun: json['bangun'],
      gambar: json['gambar'],
    );
  }
}

Future<List<Bangun>> fetchBangunList() async {
  final response = await http.get(Uri.parse( CalculateLuasApi.baseUrl + '/home-luas-bangun-datar'));

  if (response.statusCode == 200) {
    final List<dynamic> responseData = jsonDecode(response.body);
    return responseData.map((json) => Bangun.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load siswa');
  }
}