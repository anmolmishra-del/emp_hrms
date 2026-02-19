// import 'package:flutter/material.dart';

// class LandingScreen extends StatefulWidget {
//   const LandingScreen({super.key});

//   @override
//   State<LandingScreen> createState() => _LandingScreenState();
// }

// class _LandingScreenState extends State<LandingScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _logoScale;
//   late Animation<double> _fade;
//   late Animation<Offset> _slide;

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2),
//     );

//     _logoScale = Tween<double>(
//       begin: 0.6,
//       end: 1.0,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

//     _fade = Tween<double>(
//       begin: 0,
//       end: 1,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

//     _slide = Tween<Offset>(
//       begin: const Offset(0, 0.5),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(24),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               /// LOGO ANIMATION
//               ScaleTransition(
//                 scale: _logoScale,
//                 child: Image.asset("assets/images/fitprotech.png", height: 280),
//               ),

//               const SizedBox(height: 20),

//               /// TAGLINE
//               FadeTransition(
//                 opacity: _fade,
//                 child: SlideTransition(
//                   position: _slide,
//                   child: const Text(
//                     "Smart HR & Workforce Solutions",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.black54,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 40),

//               /// GET STARTED BUTTON
//               // FadeTransition(
//               //   opacity: _fade,
//               //   child: SizedBox(
//               //     width: double.infinity,
//               //     height: 50,
//               //     child: ElevatedButton(
//               //       onPressed: () {
//               //         // TODO: Navigate to Login/Home
//               //       },
//               //       style: ElevatedButton.styleFrom(
//               //         backgroundColor: const Color(0xFF6C4DF6),
//               //         shape: RoundedRectangleBorder(
//               //           borderRadius: BorderRadius.circular(14),
//               //         ),
//               //       ),
//               //       child: const Text(
//               //         "Get Started",
//               //         style: TextStyle(fontSize: 16),
//               //       ),
//               //     ),
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
