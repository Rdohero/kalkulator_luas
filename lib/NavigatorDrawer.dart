import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalkulator_luas/History.dart';
import 'package:kalkulator_luas/Home.dart';
import 'package:kalkulator_luas/LogOutScreen.dart';

class NavigatorDrawers extends StatelessWidget {
  const NavigatorDrawers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
    backgroundColor: Color(0xFF152744),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildHeader(context),
          buildHome(context),
        ],
      ),
    ),
  );
  Widget buildHeader(BuildContext context) => Container(
    padding: EdgeInsets.only(
      top: MediaQuery.of(context).padding.top,
    ),
  );
  Widget buildHome(BuildContext context) => Column(
    children: [
      ListTile(
        leading: const Icon(Icons.home_outlined,
          color: Colors.white,),
        title: const Text("Home"),
        textColor: Colors.white,
        onTap: () {
          Get.off(() => Home());
        },
      ),
      ListTile(
        leading: const Icon(Icons.update,
          color: Colors.white,),
        title: const Text("History"),
        textColor: Colors.white,
        onTap: () {
          Get.off(() => History());
        },
      ),
      ListTile(
        leading: const Icon(Icons.logout,
          color: Colors.white,),
        title: const Text("Log Out"),
        textColor: Colors.white,
        onTap: () {
          Get.off(() => LogOuteScreen());
        },
      )
    ],
  );
}