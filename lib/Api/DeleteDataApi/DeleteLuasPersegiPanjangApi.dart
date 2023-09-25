import 'package:kalkulator_luas/Api/ApiUtama.dart';
import 'package:http/http.dart' as http;

class DeletePersegiPanjangHistory {
  Future<dynamic> deletePersegiPanjangHistory(String id) async {
    var int1 = int.parse(id);
    final response = await http.delete(Uri.parse( CalculateLuasApi.baseUrl + '/luas-persegipanjang/$int1'));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load siswa');
    }
  }
}