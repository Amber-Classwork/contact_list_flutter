import 'dart:convert';

import 'package:contact_list_flutter/utils/colors.dart';
import 'package:flutter/material.dart';

import '../services/network_handler_service.dart';

class ContactDetails extends StatefulWidget {
  ContactDetails({super.key});

  @override
  State<ContactDetails> createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {
  String _first_name  ="";
  String _last_name  ="";
  String _email  ="";
  String _contact_num  ="";

  Future<bool> createContact () async{
    String userData = await NetworkHandler.post(
        "/contacts", {"first_name": _first_name, "last_name": _last_name, "email":_email, "contact_num": _contact_num});
    Map responseData = jsonDecode(userData);
    Map data = responseData["data"];
    print(responseData);

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.mainBlue,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(30),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                height: 30,
                width: double.maxFinite,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
                background: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white,
                )
              ],
            )),
            expandedHeight: 200,
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 400,
              padding: EdgeInsets.symmetric(horizontal: 35, vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextField(
                    onChanged: (value){
                      setState(() {
                        _first_name = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "First Name",
                    ),
                  ),TextField(
                    onChanged: (value){
                      setState(() {
                        _last_name = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "Last Name",
                    ),
                  ),
                  TextField(
                    onChanged: (value){
                      setState(() {
                        _email = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "Email",
                    ),
                  ),
                  TextField(
                    onChanged: (value){
                      setState(() {
                        _contact_num = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "Phone",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: TextButton(
                      onPressed: () async{
                        if(await createContact()){
                          Navigator.of(context).pop();
                        }

                      },
                      child: Text('Save',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.mainBlue,
                        shape: StadiumBorder(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
