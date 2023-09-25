import 'package:flutter/material.dart';
import 'package:kalkulator_luas/Api/ApiBangunDatar.dart';
import 'package:kalkulator_luas/NavigatorDrawer.dart';
import 'package:get/get.dart';
import 'package:kalkulator_luas/Calculate Luas/LuasBelahKetupat.dart';
import 'package:kalkulator_luas/Calculate Luas/LuasJajarGenjang.dart';
import 'package:kalkulator_luas/Calculate Luas/LuasLayangLayang.dart';
import 'package:kalkulator_luas/Calculate Luas/LuasLingkaran.dart';
import 'package:kalkulator_luas/Calculate Luas/LuasPersegi.dart';
import 'package:kalkulator_luas/Calculate Luas/LuasPersegiPanjang.dart';
import 'package:kalkulator_luas/Calculate Luas/LuasSegitiga.dart';
import 'package:kalkulator_luas/Calculate Luas/LuasTrapesium.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Bangun>> futureBangunList;

  @override
  void initState() {
    super.initState();
    futureBangunList = fetchBangunList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF152744),
      appBar: AppBar(
        shape: Border(
            bottom: BorderSide(
          color: Color(0xFF4BA3A3),
          width: 2,
        )),
        elevation: 4,
        backgroundColor: Color(0xFF367591),
        centerTitle: true,
        title: Text(
          'Kalkulator Datar',
          style:
              TextStyle(color: Color(0xFF9DFDC7), fontFamily: 'IBM_Plex_Mono'),
        ),
      ),
      drawer: const NavigatorDrawers(),
      body: MyGridView(futureBangunList),
    );
  }
}


Widget MyGridView(Future<List<Bangun>> futureBangunList) {
  return FutureBuilder<List<Bangun>>(
    future: futureBangunList,
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator( color: Colors.white,));
      } else if (snapshot.hasError) {
        return Center(child: Text('Error fetching data', style: TextStyle(color: Colors.white,fontSize: 30)));
      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
        return Center(child: Text('No data available', style: TextStyle(color: Colors.white,fontSize: 30)));
      } else {
        final bangunList =
            snapshot.data!; // Ambil daftar Bangun dari hasil Future
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: bangunList.length,
          itemBuilder: (context, index) {
            final bangun = bangunList[index];
            return Container(
              margin: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.blue,
                border: Border.all(
                  color: Color(0xFF61D2B4),
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        color: Color(0xFF2D657E),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Luas",
                                  style: TextStyle(
                                      color: Color(0xFF61D2B4), fontSize: 11),
                                ),
                                Text(
                                  "${bangun.bangun}",
                                  style: TextStyle(
                                      color: Color(0xFF9DFDC7), fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 50,
                            child: Image.network(
                              '${bangun.gambar}',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        color: Color(0xFF367591),
                      ),
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            if (bangun.bangun == 'Segitiga') {
                              Get.to(LuasSegitiga());
                            } else if (bangun.bangun == 'Persegi') {
                              Get.to(LuasPersegi());
                            } else if (bangun.bangun == 'Persegi Panjang') {
                              Get.to(LuasPersegiPanjang());
                            } else if (bangun.bangun == 'Jajar Genjang') {
                              Get.to(LuasJajarGenjang());
                            } else if (bangun.bangun == 'Trapesium') {
                              Get.to(LuasTrapesium());
                            } else if (bangun.bangun == 'Layang Layang') {
                              Get.to(LuasLayangLayang());
                            } else if (bangun.bangun == 'Belah Ketupat') {
                              Get.to(LuasBelahKetupat());
                            } else if (bangun.bangun == 'Lingkaran') {
                              Get.to(LuasLingkaran());
                            } else {
                              Get.to(Home());
                            }
                          },
                          child: Container(
                            width: 100,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Color(0xFF367591),
                              border: Border.all(
                                color: Color(0xFF61D2B4),
                                width: 1,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Kalkulasi",
                                style: TextStyle(
                                  color: Color(0xFF9DFDC7),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }
    },
  );
}
