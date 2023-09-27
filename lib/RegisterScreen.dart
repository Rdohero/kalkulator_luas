import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalkulator_luas/Widget/TextFieldWidget.dart';
import 'package:kalkulator_luas/Api/LoginRegisterApi.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> register(BuildContext context) async {
    final fullname = fullnameController.text;
    final username = usernameController.text;
    final email = emailController.text;
    final password = passwordController.text;

    final response = await Api.registerUser(fullname, username, email, password);

    if (response.statusCode == 200) {
      Get.back();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration successful')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration failed')),
      );
    }
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
            'Register',
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
                fullnameController,
                'Full Name',
                false,
                TextInputType.text,
              ),
              myTextField(
                usernameController,
                'Username',
                false,
                TextInputType.text,
              ),
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
                onPressed: () => register(context),
                child: Text('Register'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color(0xFF152744), backgroundColor: Color(0xFF4BA3A3), textStyle: TextStyle(fontSize: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  minimumSize: Size(50, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}