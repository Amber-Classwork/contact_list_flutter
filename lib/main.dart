import 'package:contact_list_flutter/pages/contact_details.dart';
import 'package:contact_list_flutter/pages/home/main_contacts_page.dart';
import 'package:contact_list_flutter/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/welcome_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const RootApp());
}

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'Lato',
      ),
      debugShowCheckedModeBanner: false,
      title: 'Contacts',
      home: ContactDetails(),
    );
  }
}
