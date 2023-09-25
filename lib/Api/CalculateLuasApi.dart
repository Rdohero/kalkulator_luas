import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kalkulator_luas/Api/ApiUtama.dart';

class LuasSegitigas {
  TextEditingController alasController = TextEditingController();
  TextEditingController tinggiController = TextEditingController();
  RxString hasilText = "".obs;
  RxString hasilLuasSegiti = ''.obs;
  RxString tinggiObx = ''.obs;
  RxString alasObx = ''.obs;

  Future<void> addData(double alas, double tinggi) async {
    final url = Uri.parse(CalculateLuasApi.baseUrl + '/luas-segitiga');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'alas': alas,
        'tinggi': tinggi,
      }),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      double luasSegitiga = jsonResponse["luas"] is int
          ? (jsonResponse["luas"] as int).toDouble()
          : jsonResponse["luas"].toDouble();
      double tinggiObs = jsonResponse["tinggi"] is int
          ? (jsonResponse["tinggi"] as int).toDouble()
          : jsonResponse["tinggi"].toDouble();
      double alasObs = jsonResponse["alas"] is int
          ? (jsonResponse["alas"] as int).toDouble()
          : jsonResponse["alas"].toDouble();
      hasilLuasSegiti.value = luasSegitiga.toString();
      tinggiObx.value = tinggiObs.toString();
      alasObx.value = alasObs.toString();
      print(hasilLuasSegiti.value);
      print(tinggiObx.value);
      print(alasObx.value);
    } else {
      throw Exception('Failed to calculate luas Segitiga');
    }
  }
}

class LuasPersegis {
  TextEditingController sisiController = TextEditingController();
  RxString hasilText = "".obs;
  RxString hasilLuasPerse = ''.obs;
  RxString sisiObx = ''.obs;

  Future<void> addData(double sisi) async {
    final url = Uri.parse(CalculateLuasApi.baseUrl + '/luas-persegi');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'sisi': sisi,
      }),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      double luasPersegi = jsonResponse["luas"] is int
          ? (jsonResponse["luas"] as int).toDouble()
          : jsonResponse["luas"].toDouble();
      double sisiObs = jsonResponse["sisi"] is int
          ? (jsonResponse["sisi"] as int).toDouble()
          : jsonResponse["sisi"].toDouble();
      hasilLuasPerse.value = luasPersegi.toString();
      sisiObx.value = sisiObs.toString();
      print(hasilLuasPerse.value);
      print(sisiObx.value);
    } else {
      throw Exception('Failed to calculate luas Persegi');
    }
  }
}

class LuasPersegiPanjangs {
  TextEditingController panjangController = TextEditingController();
  TextEditingController lebarController = TextEditingController();
  RxString hasilText = "".obs;
  RxString hasilLuasPersegiPan = ''.obs;
  RxString panjangObx = ''.obs;
  RxString lebarObx = ''.obs;

  Future<void> addData(double panjang, double lebar) async {
    final url = Uri.parse(CalculateLuasApi.baseUrl + '/luas-persegipanjang');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'panjang': panjang,
        'lebar': lebar,
      }),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      double luasPersegiPanj = jsonResponse["luas"] is int
          ? (jsonResponse["luas"] as int).toDouble()
          : jsonResponse["luas"].toDouble();
      double panjangObs = jsonResponse["panjang"] is int
          ? (jsonResponse["panjang"] as int).toDouble()
          : jsonResponse["panjang"].toDouble();
      double lebarObs = jsonResponse["lebar"] is int
          ? (jsonResponse["lebar"] as int).toDouble()
          : jsonResponse["lebar"].toDouble();
      hasilLuasPersegiPan.value = luasPersegiPanj.toString();
      panjangObx.value = panjangObs.toString();
      lebarObx.value = lebarObs.toString();
      print(hasilLuasPersegiPan.value);
      print(panjangObx.value);
      print(lebarObx.value);
    } else {
      throw Exception('Failed to calculate luas Persegi Panjang');
    }
  }
}

class LuasJajarGenjangs {
  TextEditingController alasController = TextEditingController();
  TextEditingController tinggiController = TextEditingController();
  RxString hasilText = "".obs;
  RxString hasilLuasJajar = ''.obs;
  RxString tinggiObx = ''.obs;
  RxString alasObx = ''.obs;

  Future<void> addData(double alas, double tinggi) async {
    final url = Uri.parse(CalculateLuasApi.baseUrl + '/luas-jajar-genjang');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'alas': alas,
        'tinggi': tinggi,
      }),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      double luasJajarg = jsonResponse["luas"] is int
          ? (jsonResponse["luas"] as int).toDouble()
          : jsonResponse["luas"].toDouble();
      double tinggiObs = jsonResponse["tinggi"] is int
          ? (jsonResponse["tinggi"] as int).toDouble()
          : jsonResponse["tinggi"].toDouble();
      double alasObs = jsonResponse["alas"] is int
          ? (jsonResponse["alas"] as int).toDouble()
          : jsonResponse["alas"].toDouble();
      hasilLuasJajar.value = luasJajarg.toString();
      tinggiObx.value = tinggiObs.toString();
      alasObx.value = alasObs.toString();
      print(hasilLuasJajar.value);
      print(tinggiObx.value);
      print(alasObx.value);
    } else {
      throw Exception('Failed to calculate luas Jajar Genjang');
    }
  }
}

class LuasTrapesiums {
  TextEditingController sisiaController = TextEditingController();
  TextEditingController sisibController = TextEditingController();
  TextEditingController tinggiController = TextEditingController();
  RxString hasilText = "".obs;
  RxString hasilLuasTrape = ''.obs;
  RxString sisiaObx = ''.obs;
  RxString sisibObx = ''.obs;
  RxString tinggiObx = ''.obs;

  Future<void> addData(double sisia, double sisib, double tinggi) async {
    final url = Uri.parse(CalculateLuasApi.baseUrl + '/luas-trapesium');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'sisia': sisia,
        'sisib': sisib,
        'tinggi': tinggi,
      }),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      double luasTrapes = jsonResponse["luas"] is int
          ? (jsonResponse["luas"] as int).toDouble()
          : jsonResponse["luas"].toDouble();
      double tinggiObs = jsonResponse["tinggi"] is int
          ? (jsonResponse["tinggi"] as int).toDouble()
          : jsonResponse["tinggi"].toDouble();
      double sisiaObs = jsonResponse["sisia"] is int
          ? (jsonResponse["sisia"] as int).toDouble()
          : jsonResponse["sisia"].toDouble();
      double sisibObs = jsonResponse["sisib"] is int
          ? (jsonResponse["sisib"] as int).toDouble()
          : jsonResponse["sisib"].toDouble();
      hasilLuasTrape.value = luasTrapes.toString();
      tinggiObx.value = tinggiObs.toString();
      sisiaObx.value = sisiaObs.toString();
      sisibObx.value = sisibObs.toString();
      print(hasilLuasTrape.value);
      print(tinggiObx.value);
      print(sisiaObx.value);
      print(sisibObx.value);
    } else {
      throw Exception('Failed to calculate luas Trapesium');
    }
  }
}

class LuasLayangLayangs {
  TextEditingController d1Controller = TextEditingController();
  TextEditingController d2Controller = TextEditingController();
  RxString hasilText = "".obs;
  RxString hasilLuasLayang = ''.obs;
  RxString d1Obx = ''.obs;
  RxString d2Obx = ''.obs;

  Future<void> addData(double d1, double d2) async {
    final url = Uri.parse(CalculateLuasApi.baseUrl + '/luas-layang-layang');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'd1': d1,
        'd2': d2,
      }),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      double luasLayangs = jsonResponse["luas"] is int
          ? (jsonResponse["luas"] as int).toDouble()
          : jsonResponse["luas"].toDouble();
      double d1Obs = jsonResponse["d1"] is int
          ? (jsonResponse["d1"] as int).toDouble()
          : jsonResponse["d1"].toDouble();
      double d2Obs = jsonResponse["d2"] is int
          ? (jsonResponse["d2"] as int).toDouble()
          : jsonResponse["d2"].toDouble();
      hasilLuasLayang.value = luasLayangs.toString();
      d1Obx.value = d1Obs.toString();
      d2Obx.value = d2Obs.toString();
      print(hasilLuasLayang.value);
      print(d1Obx.value);
      print(d2Obx.value);
    } else {
      throw Exception('Failed to calculate luas Layang Layang');
    }
  }
}

class LuasBelahKetupats {
  TextEditingController d1Controller = TextEditingController();
  TextEditingController d2Controller = TextEditingController();
  RxString hasilText = "".obs;
  RxString hasilLuasBelah = ''.obs;
  RxString d1Obx = ''.obs;
  RxString d2Obx = ''.obs;

  Future<void> addData(double d1, double d2) async {
    final url = Uri.parse(CalculateLuasApi.baseUrl + '/luas-belah-ketupat');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'd1': d1,
        'd2': d2,
      }),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      double luasBelahs = jsonResponse["luas"] is int
          ? (jsonResponse["luas"] as int).toDouble()
          : jsonResponse["luas"].toDouble();
      double d1Obs = jsonResponse["d1"] is int
          ? (jsonResponse["d1"] as int).toDouble()
          : jsonResponse["d1"].toDouble();
      double d2Obs = jsonResponse["d2"] is int
          ? (jsonResponse["d2"] as int).toDouble()
          : jsonResponse["d2"].toDouble();
      hasilLuasBelah.value = luasBelahs.toString();
      d1Obx.value = d1Obs.toString();
      d2Obx.value = d2Obs.toString();
      print(hasilLuasBelah.value);
      print(d1Obx.value);
      print(d2Obx.value);
    } else {
      throw Exception('Failed to calculate luas Belah Ketupat');
    }
  }
}

class LuasLingkarans {
  TextEditingController jariController = TextEditingController();
  TextEditingController diameterController = TextEditingController();
  RxString hasilText = "".obs;
  RxString hasilLuasLing = ''.obs;
  RxString jariObx = ''.obs;
  RxString diameterObx = ''.obs;

  Future<void> addData(double jari, double diameter) async {
    final url = Uri.parse(CalculateLuasApi.baseUrl + '/luas-lingkaran');
    Map<String, dynamic> requestData;

    if (jari > 0) {
      requestData = {'jari': jari};
    } else if (diameter > 0) {
      requestData = {'diameter': diameter};
    } else {
      return;
    }

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(requestData),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      double luasLingkaran = jsonResponse["luas"] is int
          ? (jsonResponse["luas"] as int).toDouble()
          : jsonResponse["luas"].toDouble();
      double jariObs = jsonResponse["jari"] is int
          ? (jsonResponse["jari"] as int).toDouble()
          : jsonResponse["jari"].toDouble();
      double diameterObs = jsonResponse["diameter"] is int
          ? (jsonResponse["diameter"] as int).toDouble()
          : jsonResponse["diameter"].toDouble();
      hasilLuasLing.value = luasLingkaran.toString();
      jariObx.value = jariObs.toString();
      diameterObx.value = diameterObs.toString();
      print(hasilLuasLing.value);
      print(jariObx.value);
      print(diameterObx.value);
    } else {
      throw Exception('Failed to calculate luas Lingkaran');
    }
  }
}