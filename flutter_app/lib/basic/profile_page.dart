import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 249, 250),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _TopCurveSection(),
                  const SizedBox(height: 80),
                  const _ProfileDetails(),
                  const SizedBox(height: 24),
                  const _EditProfileButton(),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/* ---------------- TOP CURVED HEADER ---------------- */
class _TopCurveSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 150,
          decoration: const BoxDecoration(
            // gradient: LinearGradient(
            //   colors: [Color(0xFF4FACFE), Color(0xFF00C6FB)],
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            // ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(120),
              bottomRight: Radius.circular(120),
            ),
          ),
        ),

        // Back button
        Positioned(
          top: 40,
          left: 16,
          child: CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.3),
            child: const Icon(Icons.arrow_back, color: Colors.white),
          ),
        ),

        // Profile image
        Positioned(
          bottom: -70,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  const CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/profile.png'),
                    ),
                  ),
                  CircleAvatar(
                    radius: 14,
                    backgroundColor: Colors.blue,
                    child: const Icon(
                      Icons.camera_alt,
                      size: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'Praveen',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 4),
              const Text(
                'FTP/HRD/2024/1130',
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/* ---------------- PROFILE DETAILS ---------------- */
class _ProfileDetails extends StatelessWidget {
  const _ProfileDetails();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08), // soft shadow
            blurRadius: 12,
            offset: const Offset(0, 6), // downward shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Employee Details',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 10),
          _DetailItem(title: 'Name', value: 'Praveen Kumar Thalapaneni'),
          _DetailItem(title: 'Mobile Number', value: '9087654321'),
          _DetailItem(
            title: 'Email',
            value: 'praveenkumarthalapaneni@gmail.com',
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _DetailItem(title: 'Gender', value: 'Male'),
              ),
              Expanded(
                child: _DetailItem(
                  title: 'Date of Birth',
                  value: '10th July 1996',
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _DetailItem(title: 'Role', value: 'UI / UX Designer'),
              ),
              Expanded(
                child: _DetailItem(title: 'Status', value: 'Active'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DetailItem extends StatelessWidget {
  final String title;
  final String value;

  const _DetailItem({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

/* ---------------- EDIT BUTTON ---------------- */
class _EditProfileButton extends StatelessWidget {
  const _EditProfileButton();

  @override
  Widget build(BuildContext context) {
    final actions = [
      {'icon': Icons.edit, 'label': 'Edit Profile'},
      {'icon': Icons.lock, 'label': 'Change Password'},
      {'icon': Icons.logout, 'label': 'Logout'},
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08), // soft shadow
            blurRadius: 12,
            offset: const Offset(0, 6), // downward shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Quick Actions',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: actions
                .map(
                  (action) => Column(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: const Color(0xFFF1EEFF),
                        child: Icon(
                          action['icon'] as IconData,
                          color: const Color(0xFF8E7CF0),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        action['label'] as String,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
