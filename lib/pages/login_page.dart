import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 300,
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "Username",
                ),
              ),
              TextField(
                decoration: InputDecoration(hintText: "Password"),
              ),
              OutlinedButton(onPressed: () {}, child: Text('Sign In'))
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
