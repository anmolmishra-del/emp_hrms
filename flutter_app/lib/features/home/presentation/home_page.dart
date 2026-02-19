// import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_app/core/widget/custome_search_bar.dart';
import 'package:flutter_app/features/home/widgets/action_card.dart';
import 'package:flutter_app/features/home/widgets/anniversary.dart';
import 'package:flutter_app/features/home/widgets/birth_days.dart';

import 'package:flutter_app/features/home/widgets/check_in_out.dart';
import 'package:flutter_app/features/home/widgets/circular.dart';

class HomePage extends StatelessWidget {
  static const Color bgColor = Color(0xFFF3EEFC); // light lavender
  static const Color primaryPurple = Color(0xFF8F7AE6);
  static const Color lightPurple = Color(0xFFEDE9FF);

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 200,

        leading: Padding(
          padding: const EdgeInsets.only(left: 1),
          child: Row(
            children: [
              Transform.scale(
                scale: 0.6, // 👈 reduce size
                child: Image.asset(
                  'assets/images/opsen.png',
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                'OpzentoHR',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),

        actions: [
          IconButton(
            onPressed: () {
              // navigate to notifications page
            },
            icon: const Icon(
              Icons.notifications_none_outlined,
              color: Colors.black87,
            ),
          ),

          // 👤 Profile Avatar
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                // navigate to profile page
              },
              child: const CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage(
                  'assets/images/praveen.png', // profile image
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF4F2FB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 6, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSearchBar(),
              const SizedBox(height: 2),
              CheckInOutCard(),
              const SizedBox(height: 16),
              AttendanceActions(),
              const SizedBox(height: 16),
              CircularCardSection(),
              const SizedBox(height: 16),
              BirthdaySection(),
              const SizedBox(height: 16),
              AnniversarySection(),

              // _circularCard(),
              // const SizedBox(height: 20),
              // _whiteSection(title: 'Circulars', child: _circularCard()),
              // const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
