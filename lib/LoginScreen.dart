import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalkulator_luas/Widget/TextFieldWidget.dart';
import 'package:kalkulator_luas/Home.dart';
import 'package:kalkulator_luas/Api/LoginRegisterApi.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kalkulator_luas/RegisterScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login(BuildContext context) async {
    final email = emailController.text;
    final password = passwordController.text;

    final response = await Api.loginUser(email, password);

    if (response.statusCode == 200) {
      final token = Api.tok1;
      final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString("Token", token);
      Get.off(Home());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed')),
      );
    }
  }

  Future<void> navigateToRegister(BuildContext context) async {
    Get.to(() => RegisterScreen());
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
            'Login',
            style: TextStyle(
                color: Color(0xFF9DFDC7), fontFamily: 'IBM_Plex_Mono'),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              myTextField(
                emailController,
                'Email',
                false,
                TextInputType.emailAddress,
              ),
              myTextField(
                passwordController,
                'Password',
                true,
                TextInputType.text,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => login(context),
                child: Text('Login'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color(0xFF152744), backgroundColor: Color(0xFF4BA3A3), textStyle: TextStyle(fontSize: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  minimumSize: Size(50, 50),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text("Don't Have Account?", style: TextStyle(color: Colors.white),),
              ),
              TextButton(
                onPressed: () => navigateToRegister(context), // Navigate to RegisterScreen
                child: Text("Create Account", style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
