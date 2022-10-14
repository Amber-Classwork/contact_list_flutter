import 'package:contact_list_flutter/utils/colors.dart';
import 'package:flutter/material.dart';
import '../../utils/dimensions.dart';

class MainContactsPage extends StatelessWidget {
  const MainContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            collapsedHeight: 50,
            toolbarHeight: 50,
            pinned: true,
            elevation: 0,
            floating: true,
            backgroundColor: AppColors.mainBlue,
            expandedHeight: 300,
            title: const Text(
              'Contacts',
              style: TextStyle(fontSize: 25),
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Icon(
                  Icons.add_box_rounded,
                  size: 27,
                ),
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
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(right: 40.0),
                      child: Text(
                        '10 Contacts',
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
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    dense: true,
                    minVerticalPadding: 20,
                    visualDensity: const VisualDensity(vertical: 3),
                    contentPadding: const EdgeInsets.all(0),
                    leading: const CircleAvatar(
                        radius: 60, backgroundColor: AppColors.mainGreen),
                    title: const Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        'Johana Travolat',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('johana24@gmail.com'),
                        SizedBox(
                          height: 5,
                        ),
                        Text('+1 876 632-3233'),
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(
                              Icons.call_outlined,
                              color: AppColors.mainBlue,
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
                              color: AppColors.mainBlue,
                              size: 27,
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
