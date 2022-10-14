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

  void submitLogin() async {
    String userData = await NetworkHandler.post(
        "/users/login", {"username": _username, "password": _password});
    Map responseData = jsonDecode(userData);
    Map data = responseData["data"];
    SecureStore.storeToken("jwt-auth", data["token"]);
    Map<String, dynamic> mapUser = data["user"];
    User user = User.fromJson(mapUser);
    SecureStore.createUser(user);
    print(user);
    // User user = User.fromJSON(data["user"]);
    // SecureStore.createUser(user);
    
    print(responseData);
    if (responseData["status"] == "success") {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const MainContactsPage()));
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
                    print(_username);
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
                    print(_password);
                  });
                },
                decoration: InputDecoration(hintText: "Password"),
              ),
              OutlinedButton(onPressed: () {
                submitLogin();

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
