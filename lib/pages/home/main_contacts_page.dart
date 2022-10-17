import 'dart:convert';
import 'package:contact_list_flutter/models/contact.dart';
import 'package:contact_list_flutter/pages/contact_details.dart';
import 'package:contact_list_flutter/services/network_handler_service.dart';
import 'package:contact_list_flutter/services/secure_store_service.dart';
import 'package:contact_list_flutter/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';
import '../../models/user.dart';
import '../../utils/dimensions.dart';

class MainContactsPage extends StatefulWidget {
  const MainContactsPage({super.key});

  @override
  State<MainContactsPage> createState() => _MainContactsPageState();
}

class _MainContactsPageState extends State<MainContactsPage> {
  late Future<List<Contact>> futureContacts;
  int dataLength = 0;
  User user = new User(username: "", role: "", id: "");
  _sendMail() async {
    // Android and iOS
    Uri uri = Uri.parse(
        'mailto:test@example.org?subject=Greetings&body=Hello%20World');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }

  void getUserData() async {
    user = await SecureStore.getUser();
    print(user.username);
  }

  Future<List<Contact>> getAllContacts() async {
    var response = await NetworkHandler.get(endpoint: "/contacts");
    Map responseData = jsonDecode(response);
    List contacts = responseData["data"]["contacts"];
    List<Contact> newContactList = contacts.map((contact) {
      return Contact.fromJson(contact);
    }).toList();
    return newContactList;
  }

  @override
  void initState() {
    super.initState();
    getUserData();
    futureContacts = getAllContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: futureContacts,
        builder: (context, snapshot) {
          dataLength =
              (snapshot.data != null) ? dataLength = snapshot.data!.length : 0;
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    collapsedHeight: 50,
                    toolbarHeight: 50,
                    pinned: true,
                    elevation: 0,
                    floating: true,
                    backgroundColor: AppColors.mainBlue,
                    expandedHeight: 300,
                    title: Text(
                      '${user.username}',
                      style: TextStyle(fontSize: 25),
                    ),
                    actions: [
                      Padding(
                        padding: EdgeInsets.only(right: 15.0),
                        child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ContactDetails())).then((value) {
                                setState(() {
                                  futureContacts = getAllContacts();
                                });
                              });
                            },
                            icon: Icon(
                              Icons.add_box_rounded,
                              size: 27,
                            )),
                      )
                    ],
                    flexibleSpace: FlexibleSpaceBar(
                      background: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 250,
                            child: TextField(
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.search),
                                hintText: 'Search',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(60),
                      child: Container(
                        height: 60,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 40.0),
                              child: Text(
                                '$dataLength Contacts',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 40.0,
                        ),
                        child: ListView.builder(
                          padding: const EdgeInsets.only(top: 0, bottom: 20),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Dismissible(
                              direction: DismissDirection.endToStart,
                              key: UniqueKey(),
                              confirmDismiss:
                                  (DismissDirection direction) async {
                                return await showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Confirm'),
                                      content: Text(
                                          "Are you sure you wish to delete this contact"),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(true),
                                          child: Text('Delete'),
                                        ),
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(false),
                                          child: Text('Cancel'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              background: Container(
                                alignment: AlignmentDirectional.centerEnd,
                                color: AppColors.mainRed,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              child: ListTile(
                                dense: true,
                                minVerticalPadding: 20,
                                visualDensity: const VisualDensity(vertical: 3),
                                contentPadding: const EdgeInsets.all(0),
                                leading: CircleAvatar(
                                    radius: 60,
                                    backgroundColor: (index % 2 == 0)
                                        ? AppColors.mainGreen
                                        : AppColors.mainBlue),
                                title: Padding(
                                  padding: EdgeInsets.only(bottom: 5.0),
                                  child: Text(
                                    snapshot.data![index].first_name +
                                        " " +
                                        snapshot.data![index].last_name,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(snapshot.data![index].email),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                        "${snapshot.data![index].contact_num}"),
                                  ],
                                ),
                                trailing: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: const [
                                          Icon(
                                            Icons.call_outlined,
                                            color: Colors.black54,
                                            size: 27,
                                          ),
                                          SizedBox(
                                              width: 25,
                                              height: 25,
                                              child: VerticalDivider(
                                                color: Colors.black54,
                                              )),
                                          Icon(
                                            Icons.email_outlined,
                                            color: Colors.black54,
                                            size: 27,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )),
                  ),
                ],
              );
            } else {
              return Text("${snapshot.error}");
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
