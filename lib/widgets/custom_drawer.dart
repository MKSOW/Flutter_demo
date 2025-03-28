// import 'package:flutter/material.dart';
// import '../controllers/home_controller.dart';

// class CustomDrawer extends StatelessWidget {
//   final HomeController controller = HomeController();

//   CustomDrawer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: <Widget>[
//           const DrawerHeader(
//             decoration: BoxDecoration(color: Colors.blue),
//             child: Text(
//               'Mon Menu',
//               style: TextStyle(color: Colors.white, fontSize: 24),
//             ),
//           ),
//           ...controller.getPageData().map((page) {
//             return ListTile(
//               title: Text(page['title']),
//               onTap: () {
//                 controller.navigateToPage(context, controller.getPageData().indexOf(page));
//               },
//             );
//           }).toList(),
//         ],
//       ),
//     );
//   }
// }
