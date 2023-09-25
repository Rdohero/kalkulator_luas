import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalkulator_luas/Api/CalculateLuasApi.dart';

class LuasLayangLayang extends StatefulWidget {
  const LuasLayangLayang({Key? key}) : super(key: key);

  @override
  State<LuasLayangLayang> createState() => _LuasLayangLayangState();
}

class _LuasLayangLayangState extends State<LuasLayangLayang> {
  LuasLayangLayangs luasLayang = LuasLayangLayangs();
  final LuasLayangLayangs controller = LuasLayangLayangs();
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
                          image: AssetImage("assets/Images/layanglayangrumus.png"),
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
                                    "d1 = diagonal 1",
                                    style: TextStyle(
                                        color: Color(0xFF9DFDC7), fontSize: 13),
                                  ),
                                  Text(
                                    "d2 = diagonal 2",
                                    style: TextStyle(
                                        color: Color(0xFF9DFDC7), fontSize: 13),
                                  ),
                                  Text(
                                    "luas = 1/2 * diagonal 1 * diagonal 2",
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
                myTextField(controller.d1Controller, "Diagonal 1"),
                myTextField(controller.d2Controller, "Diagonal 2"),
                SizedBox(height: 20),
                Container(
                  height: 70,
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
                          String d1Text = controller.d1Controller.text;
                          String d2Text = controller.d2Controller.text;

                          if (d1Text.isEmpty || d2Text.isEmpty) {
                            setState(() {
                              hasilText.value =
                                  "Masukkan nilai Diagonal 1 dan Diagonal 2 terlebih dahulu.";
                            });
                          } else {
                            double d1 = double.tryParse(d1Text) ?? 0.0;
                            double d2 = double.tryParse(d2Text) ?? 0.0;

                            if (d1 == 0.0 || d2 == 0.0) {
                              setState(() {
                                hasilText.value =
                                    "Nilai Diagonal 1 dan Diagonal 2 harus berupa angka lebih dari 0.";
                              });
                            } else {
                              await luasLayang.addData(d1, d2);
                              setState(() {
                                hasilText.value =
                                    "Hasil luas Layang Layang dari Diagonal 1, " +
                                        luasLayang.d1Obx.value +
                                        " cm" +
                                        " dan Diagonal 2, " +
                                        luasLayang.d2Obx.value +
                                        " cm" +
                                        " adalah " +
                                        (double.tryParse(luasLayang.hasilLuasLayang.value) ?? 0.0).toStringAsFixed(2) +
                                        " cm²";
                                controller.d1Controller.clear();
                                controller.d2Controller.clear();
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
                          minimumSize: Size(65, 70),
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