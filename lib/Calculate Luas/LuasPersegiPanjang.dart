import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalkulator_luas/Api/CalculateLuasApi.dart';

class LuasPersegiPanjang extends StatefulWidget {
  const LuasPersegiPanjang({Key? key}) : super(key: key);

  @override
  State<LuasPersegiPanjang> createState() => _LuasPersegiPanjangState();
}

class _LuasPersegiPanjangState extends State<LuasPersegiPanjang> {
  LuasPersegiPanjangs luasPersegipan = LuasPersegiPanjangs();
  final LuasPersegiPanjangs controller = LuasPersegiPanjangs();
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
                          image: AssetImage("assets/Images/persegipanjangrumus.png"),
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
                                    "p = panjang",
                                    style: TextStyle(
                                        color: Color(0xFF9DFDC7), fontSize: 13),
                                  ),
                                  Text(
                                    "l = lebar",
                                    style: TextStyle(
                                        color: Color(0xFF9DFDC7), fontSize: 13),
                                  ),
                                  Text(
                                    "luas = panjang * lebar",
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
                myTextField(controller.panjangController, "Panjang"),
                myTextField(controller.lebarController, "Lebar"),
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
                          String panjangText = controller.panjangController.text;
                          String lebarText = controller.lebarController.text;

                          if (panjangText.isEmpty || lebarText.isEmpty) {
                            setState(() {
                              hasilText.value =
                                  "Masukkan nilai panjang dan lebar terlebih dahulu.";
                            });
                          } else {
                            double panjang = double.tryParse(panjangText) ?? 0.0;
                            double lebar = double.tryParse(lebarText) ?? 0.0;

                            if (panjang == 0.0 || lebar == 0.0) {
                              setState(() {
                                hasilText.value =
                                    "Nilai panjang dan lebar harus berupa angka lebih dari 0.";
                              });
                            } else {
                              await luasPersegipan.addData(panjang, lebar);
                              setState(() {
                                hasilText.value =
                                    "Hasil luas Persegi Panjang dari panjang, " +
                                        luasPersegipan.panjangObx.value +
                                        " cm" +
                                        " dan lebar, " +
                                        luasPersegipan.lebarObx.value +
                                        " cm" +
                                        " adalah " +
                                        (double.tryParse(luasPersegipan.hasilLuasPersegiPan.value) ?? 0.0).toStringAsFixed(2) +
                                        " cm²";
                                controller.panjangController.clear();
                                controller.lebarController.clear();
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