// import 'package:flutter/material.dart';
// import 'package:flutter_app/basic/attendence.dart';
// import 'package:flutter_app/basic/chat.dart';
// import 'package:flutter_app/basic/home.dart';
// import 'package:flutter_app/basic/landing.dart';
// import 'package:flutter_app/basic/payroll.dart';
// import 'package:flutter_app/basic/profile_page.dart';

// class MainPage extends StatefulWidget {
//   const MainPage({super.key});

//   @override
//   State<MainPage> createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   int _currentIndex = 0;
//   bool _showLanding = true;

//   final List<Widget> _pages = const [
//     HomePage(),
//     AttendanceScreen(),
//     PayrollScreen(),
//     ChatScreen(),
//     ProfileScreen(),
//   ];

//   @override
//   void initState() {
//     super.initState();

//     Future.delayed(const Duration(seconds: 3), () {
//       setState(() {
//         _showLanding = false;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_showLanding) {
//       return const LandingScreen();
//     }

//     return Scaffold(
//       body: _pages[_currentIndex],

//       // 🔥 GOOGLE PLAY STORE STYLE BOTTOM NAV
//       bottomNavigationBar: NavigationBar(
//         backgroundColor: const Color.fromARGB(255, 242, 249, 250),
//         elevation: 0,
//         selectedIndex: _currentIndex,
//         // indicatorColor: Color.fromARGB(255, 156, 204, 223),
//         height: 62,

//         labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,

//         onDestinationSelected: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },

//         destinations: const [
//           NavigationDestination(
//             icon: Icon(Icons.home_outlined),
//             selectedIcon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           NavigationDestination(
//             icon: Icon(Icons.calendar_today_outlined),

//             // selectedIcon: Icon(Icons.calendar_today),
//             label: 'Attendance',
//           ),
//           NavigationDestination(
//             icon: Icon(Icons.payment_outlined),
//             selectedIcon: Icon(Icons.payment),
//             label: 'My Pay',
//           ),
//           NavigationDestination(
//             icon: Icon(Icons.chat_bubble_outline),
//             selectedIcon: Icon(Icons.chat_bubble),
//             label: 'Chat',
//           ),
//           NavigationDestination(
//             icon: Icon(Icons.person_outline),
//             selectedIcon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }
// }
