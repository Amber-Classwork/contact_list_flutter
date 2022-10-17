import 'package:contact_list_flutter/pages/login_page.dart';
import 'package:contact_list_flutter/pages/register_page.dart';
import 'package:contact_list_flutter/utils/colors.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBlue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 300,
            padding: EdgeInsets.only(left: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.contacts,
                  color: Colors.white,
                  size: 45,
                ),
                Text(
                  'Welcome to\nthe new\nContacts App',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  'Designed to keep your contacts\nsafe and secure.',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
          Container(
            height: 200,
            width: double.maxFinite,
            child: Column(children: [
              SizedBox(
                height: 50,
                width: 250,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      minimumSize: Size.fromHeight(45),
                      shape: StadiumBorder(),
                      side: BorderSide(color: Colors.white)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
                width: 250,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.white, shape: StadiumBorder()),
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
