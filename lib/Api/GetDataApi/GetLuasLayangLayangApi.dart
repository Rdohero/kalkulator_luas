import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kalkulator_luas/Api/ApiUtama.dart';

class LayangLayang {
  final int id;
  final double d1;
  final double d2;
  final double luas;

  LayangLayang({
    required this.id,
    required this.d1,
    required this.d2,
    required this.luas,
});

  factory LayangLayang.fromJson(Map<String, dynamic> json) {
    return LayangLayang(
        id: json['id'],
        d1: json['d1'].toDouble(),
        d2: json['d2'].toDouble(),
        luas: json['luas'].toDouble(),
    );
  }
}

Future<List<LayangLayang>> getLayangLayangHistory() async {
  final response = await http.get(Uri.parse( CalculateLuasApi.baseUrl + '/luas-layang-layang'));

  if (response.statusCode == 200) {
    final List<dynamic> responseData = jsonDecode(response.body);
    return responseData.map((json) => LayangLayang.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load siswa');
  }
}