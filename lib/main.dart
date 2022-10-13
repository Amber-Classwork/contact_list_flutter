import 'package:contact_list_flutter/pages/home/main_contacts_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const RootApp());
}

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contacts',
      home: MainContactsPage(),
    );
  }
}
