import 'package:contact_list_flutter/widgets/small_text.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../widgets/large_text.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final formKey = GlobalKey<FormState>();
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
                  'Register',
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
            ),
          ),
          Container(
            height: 300,
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Username'),
                    validator: (value) {
                      if (value!.isEmpty ||
                          RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                        return 'Enter correct name';
                      } else {
                        return null;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'Email'),
                          validator: (value) {
                            if (value!.isEmpty ||
                                RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,5} +$')
                                    .hasMatch(value)) {
                              return 'Enter correct email';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'Phone No'),
                          validator: (value) {
                            if (value!.isEmpty ||
                                RegExp(r'^[+]*[(]{0,1}[0-9]{1,3}[)]{0,1}[-\s./0-7]+$')
                                    .hasMatch(value)) {
                              return 'Enter correct phone';
                            } else {
                              return null;
                            }
                          },
                        ),
                      )
                    ],
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Password'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter correct password';
                      } else {
                        return null;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [SmallText(text: 'Forgot Password?')],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 125,
                        child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: AppColors.mainBlue,
                              shape: StadiumBorder()),
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: LargeText(
                              size: 18,
                              text: 'Register',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Text("Already have\nan account? Sign In")
                    ],
                  )
                ],
              ),
            ),
          ),
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

    path.lineTo(0, h * 0.8);
    path.quadraticBezierTo(w * 0.5, h, w, h * 0.8);
    path.lineTo(w, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
