import 'dart:convert';

import 'package:contact_list_flutter/models/user.dart';
import 'package:contact_list_flutter/services/network_handler_service.dart';
import 'package:contact_list_flutter/services/secure_store_service.dart';
import 'package:flutter/material.dart';
import 'home/main_contacts_page.dart';
import '../utils/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String _username = "";
  String _password = "";
  String _error = "";

  Future<bool> submitLogin() async {
    try {
      String userData = await NetworkHandler.post(
          "/users/login", {"username": _username, "password": _password});
      Map responseData = jsonDecode(userData);
      Map data = responseData["data"];
      print(responseData["data"]["token"]);
      SecureStore.storeToken("jwt-auth", data["token"]);
      Map<String, dynamic> mapUser = data["user"];
      SecureStore.createUser(mapUser);
      return true;
    } catch (error) {
      setState(() {
        _error = error.toString();
        print(_error);
        AlertDialog(title: Text("Error"), content: Text("$_error"));
      });
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: CustomClipPath(),
            child: Container(
              color: AppColors.mainBlue,
              height: 300,
              width: double.maxFinite,
              child: Center(
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
            ),
          ),
          Form(
            child: Column(
              children: [
                SizedBox(
                  width: 350,
                  child: Form(
                    child: Column(
                      children: [
                        TextField(
                          onChanged: (value) {
                            setState(() {
                              _username = value;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'Username',
                          ),
                        ),
                        TextField(
                          onChanged: (value) {
                            setState(() {
                              _password = value;
                            });
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 150,
                      child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: AppColors.mainBlue,
                            shape: StadiumBorder()),
                        onPressed: () async {
                          if (await submitLogin()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const MainContactsPage()));
                          }
                        },
                        child: Text(
                          'Login',
                        ),
                      ),
                    ),
                    Text("Don't have an account?\nRegister")
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();

    path.lineTo(0, h * 0.7);
    path.quadraticBezierTo(w * 0.5, h, w, h * 0.7);
    path.lineTo(w, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
