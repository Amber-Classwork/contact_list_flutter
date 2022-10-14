import 'dart:convert';

import 'package:contact_list_flutter/models/user.dart';
import 'package:contact_list_flutter/services/network_handler_service.dart';
import 'package:contact_list_flutter/services/secure_store_service.dart';
import 'package:flutter/material.dart';

import 'home/main_contacts_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _username = "";
  String _password = "";
  String _error = "";

  Future<bool> submitLogin() async {
    try{
      String userData = await NetworkHandler.post(
          "/users/login", {"username": _username, "password": _password});
      Map responseData = jsonDecode(userData);
      Map data = responseData["data"];
      print(responseData["data"]["token"]);
      SecureStore.storeToken("jwt-auth", data["token"]);
      Map<String, dynamic> mapUser = data["user"];
      SecureStore.createUser(mapUser);
      return true;
    }catch(error){
      setState(() {
        _error = error.toString();
        print(_error);
        AlertDialog(title:Text("Error"), content: Text("$_error"));
      });
      return false;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 300,
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  setState(() {
                    _username = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Username",
                ),
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
                decoration: InputDecoration(hintText: "Password"),
              ),
              OutlinedButton(onPressed: () async {
                if(await submitLogin()) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (
                          BuildContext context) => const MainContactsPage()));
                }
              }, child: Text('Sign In'))
            ],
          ),
        ),
      ),
    );

    // Column(
    //   children: [
    //     Icon(Icons.call),
    //     Text('Welcome to the new Contacts App'),
    //     Text('Designed to keep your contacts safe and secure'),
    //     TextButton(
    //       onPressed: () {},
    //       child: Text('Login'),
    //     ),
    //     TextButton(
    //       onPressed: () {},
    //       child: Text('Register'),
    //     )
    //   ],
    // );
  }
}
