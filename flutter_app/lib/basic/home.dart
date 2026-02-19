// import 'dart:math' as math;

// import 'package:flutter/material.dart';
// import 'package:flutter_app/basic/attendence.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   static const Color bgColor = Color(0xFFF3EEFC); // light lavender
//   static const Color primaryPurple = Color(0xFF8F7AE6);
//   static const Color lightPurple = Color(0xFFEDE9FF);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leadingWidth: 100,
//         leading: Padding(
//           padding: const EdgeInsets.only(left: 8),
//           child: Transform.scale(
//             scale: 0.7, // 👈 reduce size
//             child: Image.asset(
//               'assets/images/fitprotech.png',
//               fit: BoxFit.contain,
//             ),
//           ),
//         ),

//         actions: [
//           IconButton(
//             onPressed: () {
//               // navigate to notifications page
//             },
//             icon: const Icon(
//               Icons.notifications_none_outlined,
//               color: Colors.black87,
//             ),
//           ),

//           // 👤 Profile Avatar
//           Padding(
//             padding: const EdgeInsets.only(right: 16),
//             child: GestureDetector(
//               onTap: () {
//                 // navigate to profile page
//               },
//               child: const CircleAvatar(
//                 radius: 18,
//                 backgroundImage: AssetImage(
//                   'assets/images/praveen.png', // profile image
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//       backgroundColor: const Color(0xFFF4F2FB),
//       // bottomNavigationBar: _bottomNav(),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.fromLTRB(16, 6, 16, 16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
             
//               const SizedBox(height: 16),
//               _whiteSection(
//                 title: 'Upcoming Birthdays',
//                 trailing: Icons.calendar_month,
//                 child: Column(
//                   children: [
//                     _birthdayTile('Kristin Watson', 'Today'),
//                     _birthdayTile('Floyd Miles', 'Tomorrow'),
//                     _birthdayTile('Kristin Watson', 'Today'),
//                     _birthdayTile('Floyd Miles', 'Tomorrow'),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: HomePage.bgColor,
//       body: SafeArea(
//         child: Column(
//           children: [
//             _profileHeader(),
//             Expanded(
//               child: SingleChildScrollView(
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   children: const [
//                     _ProfileTile(title: 'Basic Info'),
//                     _ProfileTile(title: 'Home Country Address'),
//                     _ProfileTile(title: 'Address'),
//                     _ProfileTile(title: 'Job Details'),
//                     _ProfileTile(title: 'Qualifications'),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _profileHeader() {
//     return Container(
//       margin: const EdgeInsets.all(16), // ⬅️ inset like screenshot
//       padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           colors: [Color(0xFF9D8CF3), Color(0xFF7E6AE6)],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         borderRadius: BorderRadius.all(
//           Radius.circular(26), // ⬅️ full rounded pill shape
//         ),
//       ),
//       child: Row(
//         children: const [
//           CircleAvatar(
//             radius: 26,
//             backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=3'),
//           ),
//           SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Good Morning',
//                   style: TextStyle(color: Colors.white70, fontSize: 12),
//                 ),
//                 SizedBox(height: 2),
//                 Text(
//                   'Alex Paul',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Stack(
//             children: [
//               Icon(Icons.notifications_none, color: Colors.white, size: 26),
//               Positioned(
//                 right: 0,
//                 top: 0,
//                 child: CircleAvatar(
//                   radius: 7,
//                   backgroundColor: Colors.red,
//                   child: Text(
//                     '2',
//                     style: TextStyle(fontSize: 9, color: Colors.white),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _ProfileTile extends StatelessWidget {
//   final String title;

//   const _ProfileTile({required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 12),
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Row(
//         children: [
//           Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
//           const Spacer(),
//           const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
//         ],
//       ),
//     );
//   }
// }
//   Widget _whiteSection({
//     required String title,
//     IconData? trailing,
//     required Widget child,
//   }) {
//     return Container(
//       padding: const EdgeInsets.all(14),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(18),
//       ),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Text(
//                 title,
//                 style: const TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               const Spacer(),
//               if (trailing != null)
//                 Icon(trailing, size: 18, color: Colors.grey),
//             ],
//           ),
//           const SizedBox(height: 12),
//           child,
//         ],
//       ),
//     );
//   }

 

//   Widget _birthdayTile(String name, String day) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 14),
//       child: Row(
//         children: [
//           const CircleAvatar(
//             radius: 18,
//             backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=8'),
//           ),
//           const SizedBox(width: 10),
//           Expanded(child: Text(name)),
//           Text(day, style: const TextStyle(color: Colors.grey, fontSize: 12)),
//         ],
//       ),
//     );
//   }
// }