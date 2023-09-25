import 'dart:convert';
import 'package:kalkulator_luas/Api/ApiUtama.dart';
import 'package:http/http.dart' as http;

class BelahKetupat {
  final int id;
  final double d1;
  final double d2;
  final double luas;

  BelahKetupat({
    required this.id,
    required this.d1,
    required this.d2,
    required this.luas,
});

  factory BelahKetupat.fromJson(Map<String, dynamic> json) {
    return BelahKetupat(
        id: json['id'],
        d1: json['d1'].toDouble(),
        d2: json['d2'].toDouble(),
        luas: json['luas'].toDouble(),
    );
  }
}

Future<List<BelahKetupat>> getBelahKetupatHistory() async {
  final response = await http.get(Uri.parse( CalculateLuasApi.baseUrl + '/luas-belah-ketupat'));

  if (response.statusCode == 200) {
    final List<dynamic> responseData = jsonDecode(response.body);
    return responseData.map((json) => BelahKetupat.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load siswa');
  }
}