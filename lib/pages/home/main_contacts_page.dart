import 'package:contact_list_flutter/utils/colors.dart';
import 'package:flutter/material.dart';
import '../../utils/dimensions.dart';

// class MainContactsPage extends StatelessWidget {
//   const MainContactsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(slivers: [
//         SliverPersistentHeader(
//           delegate: CustomAppBar(extendedHeight: 200),
//           pinned: true,
//           floating: true,
//         ),
//         SliverToBoxAdapter(
//           child: Expanded(
//             child: ListView.builder(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               itemCount: 30,
//               itemBuilder: (BuildContext context, int index) {
//                 return Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
//                   child: Card(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.symmetric(
//                               vertical: 15, horizontal: 12),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               Text('John Brown'),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Text('johnbrown@gmail.com'),
//                               Text('1 876 436-6233')
//                             ],
//                           ),
//                         ),
//                         Icon(Icons.more_vert)
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         )
//       ]),
//       bottomNavigationBar: BottomNavigationBar(
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.contacts), label: 'Contacts'),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//           BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Logout'),
//         ],
//         type: BottomNavigationBarType.fixed,
//       ),
//     );
//   }
// }

// class CustomAppBar extends SliverPersistentHeaderDelegate {
//   final double extendedHeight;
//   CustomAppBar({required this.extendedHeight});
//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return Stack(
//       fit: StackFit.expand,
//       clipBehavior: Clip.none,
//       children: [
//         Image.network(
//           'https://images.pexels.com/photos/5583535/pexels-photo-5583535.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
//           fit: BoxFit.cover,
//         ),
//         Positioned(
//           top: extendedHeight / 1.2 - shrinkOffset,
//           left: MediaQuery.of(context).size.width / 4,
//           right: MediaQuery.of(context).size.width / 4,
//           child: Opacity(
//             opacity: (1 - shrinkOffset / extendedHeight),
//             child: TextField(
//               decoration: InputDecoration(
//                 border:
//                     OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                 filled: true,
//                 fillColor: Colors.white,
//                 hintText: ' Search',
//                 prefixIcon: Icon(Icons.search),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   double get maxExtent => extendedHeight;

//   @override
//   double get minExtent => kToolbarHeight;

//   @override
//   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
//       true;
// }

class MainContactsPage extends StatelessWidget {
  const MainContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Contacts'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Icon(Icons.add_box),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: AppColors.mainBlue,
              borderRadius: BorderRadius.only(
                bottomLeft: (Radius.circular(80)),
                bottomRight: (Radius.circular(80)),
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Search",
                        prefixIcon: Icon(Icons.search)),
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 30,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppColors.mainBlue,
                        radius: 20,
                      ),
                      title: Text('John Travolta'),
                      subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('johntravolta22@gmail.com'),
                            Text('+ 1 876 56443434')
                          ]),
                      trailing: Icon(Icons.email),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
