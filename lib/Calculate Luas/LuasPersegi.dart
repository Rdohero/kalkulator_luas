import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalkulator_luas/Api/CalculateLuasApi.dart';
class LuasPersegi extends StatefulWidget {
  const LuasPersegi({Key? key}) : super(key: key);

  @override
  State<LuasPersegi> createState() => _LuasPersegiState();
}

class _LuasPersegiState extends State<LuasPersegi> {
  LuasPersegis luasPerse = LuasPersegis();
  final LuasPersegis controller = LuasPersegis();
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
                          image: AssetImage("assets/Images/persegirumus.png"),
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
                                    "s = sisi",
                                    style: TextStyle(
                                        color: Color(0xFF9DFDC7), fontSize: 13),
                                  ),
                                  Text(
                                    "luas = sisi * sisi",
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
                myTextField(controller.sisiController, "Sisi"),
                SizedBox(height: 20),
                Container(
                  height: 50,
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
                          String sisiText = controller.sisiController.text;

                          if (sisiText.isEmpty) {
                            setState(() {
                              hasilText.value =
                                  "Masukkan nilai Sisi terlebih dahulu.";
                            });
                          } else {
                            double sisi = double.tryParse(sisiText) ?? 0.0;

                            if (sisi == 0.0) {
                              setState(() {
                                hasilText.value =
                                    "Nilai Sisi harus berupa angka lebih dari 0.";
                              });
                            } else {
                              await luasPerse.addData(sisi);
                              setState(() {
                                hasilText.value =
                                    "Hasil luas persegi dari Sisi, " +
                                        luasPerse.sisiObx.value +
                                        " cm" +
                                        " adalah " +
                                        (double.tryParse(luasPerse.hasilLuasPerse.value) ?? 0.0).toStringAsFixed(2) +
                                        " cm²";
                                controller.sisiController.clear();
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
                          minimumSize: Size(65, 50),
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