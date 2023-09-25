import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalkulator_luas/Api/CalculateLuasApi.dart';

class LuasLingkaran extends StatefulWidget {
  const LuasLingkaran({Key? key}) : super(key: key);

  @override
  State<LuasLingkaran> createState() => _LuasLingkaranState();
}

class _LuasLingkaranState extends State<LuasLingkaran> {
  LuasLingkarans luasLingka = LuasLingkarans();
  final LuasLingkarans controller = LuasLingkarans();
  RxString hasilText = "".obs;

  Widget myTextField(TextEditingController controller, String myLabel) {
    return Container(
      margin: EdgeInsets.only(top: 5, right: 10, left: 10),
      child: TextField(
        style: TextStyle(color: Color(0xFF4BA3A3)),
        autofocus: false,
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF4BA3A3)),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF4BA3A3)),
          ),
          hintText: myLabel,
          hintStyle: TextStyle(color: Color(0xFF4BA3A3)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
            style: TextStyle(
                color: Color(0xFF9DFDC7), fontFamily: 'IBM_Plex_Mono'),
          ),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 150,
                  width: 330,
                  margin: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.blue,
                    border: Border.all(
                      color: Color(0xFF61D2B4),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 143,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topLeft: Radius.circular(10)),
                          color: Color(0xFF2D657E),
                        ),
                        child: Center(
                            child: Image(
                          width: 100,
                          height: 100,
                          image: AssetImage("assets/Images/lingkaranrumus.png"),
                        )),
                      ),
                      Container(
                        width: 185,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          color: Color(0xFF367591),
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "r = jari - jari",
                                    style: TextStyle(
                                        color: Color(0xFF9DFDC7), fontSize: 13),
                                  ),
                                  Text(
                                    "d = diameter",
                                    style: TextStyle(
                                        color: Color(0xFF9DFDC7), fontSize: 13),
                                  ),
                                  Text(
                                    "luas = π * r * r / π * d",
                                    style: TextStyle(
                                        color: Color(0xFF9DFDC7), fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Image(
                                          image: AssetImage(
                                              "assets/Images/share.png")),
                                    ),
                                    Image(
                                        image: AssetImage(
                                            "assets/Images/copy.png")),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                myTextField(controller.jariController, "Jari - Jari"),
                myTextField(controller.diameterController, "Diameter"),
                SizedBox(height: 20),
                Container(
                  height: 60,
                  width: 350,
                  margin: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xFF2D657E),
                  ),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          String jariText = controller.jariController.text;
                          String diameterText = controller.diameterController.text;

                          if (jariText.isEmpty && diameterText.isEmpty) {
                            setState(() {
                              hasilText.value = "Masukkan nilai Jari-jari atau Diameter terlebih dahulu.";
                            });
                          } else if (!jariText.isEmpty && !diameterText.isEmpty) {
                            setState(() {
                              hasilText.value = "Hanya boleh mengisi salah satu (Jari-jari atau Diameter).";
                            });
                          } else {
                            double jari = double.tryParse(jariText) ?? 0.0;
                            double diameter = double.tryParse(diameterText) ?? 0.0;

                            if (jari <= 0.0 && diameter <= 0.0) {
                              setState(() {
                                hasilText.value = "Nilai Jari-jari atau Diameter harus berupa angka lebih dari 0.";
                              });
                            } else {
                              await luasLingka.addData(jari, diameter);
                              setState(() {
                                if(jari > 0) {
                                  hasilText.value = "Hasil Luas Lingkaran dari jari - jari, " + luasLingka.jariObx.value + " cm" + " adalah " + (double.tryParse(luasLingka.hasilLuasLing.value) ?? 0.0).toStringAsFixed(2) + " cm²";
                                } else if(diameter > 0) {
                                  hasilText.value = "Hasil Luas Lingkaran dari diameter, " + luasLingka.diameterObx.value + " cm" + " adalah " + (double.tryParse(luasLingka.hasilLuasLing.value) ?? 0.0).toStringAsFixed(2) + " cm²";
                                }
                                controller.jariController.clear();
                                controller.diameterController.clear();
                              });
                            }
                          }
                          FocusScope.of(context).unfocus();
                        },
                        child: Text("Hitung"),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Color(0xFF152744), backgroundColor: Color(0xFF4BA3A3), textStyle: TextStyle(fontSize: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          minimumSize: Size(65, 60),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Obx(() => Container(
                                child: Text(
                                  hasilText.value,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}