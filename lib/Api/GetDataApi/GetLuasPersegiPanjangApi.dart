import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kalkulator_luas/Api/ApiUtama.dart';

class PersegiPanjang {
  final int id;
  final double panjang;
  final double lebar;
  final double luas;

  PersegiPanjang({
    required this.id,
    required this.panjang,
    required this.lebar,
    required this.luas,
});

  factory PersegiPanjang.fromJson(Map<String, dynamic> json) {
    return PersegiPanjang(
        id: json['id'],
        panjang: json['panjang'].toDouble(),
        lebar: json['lebar'].toDouble(),
        luas: json['luas'].toDouble(),
    );
  }
}

Future<List<PersegiPanjang>> getPersegiPanjangHistory() async {
  final response = await http.get(Uri.parse( CalculateLuasApi.baseUrl + '/luas-persegipanjang'));

  if (response.statusCode == 200) {
    final List<dynamic> responseData = jsonDecode(response.body);
    return responseData.map((json) => PersegiPanjang.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load siswa');
  }
}