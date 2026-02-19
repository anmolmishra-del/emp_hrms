import 'package:flutter/material.dart';
import 'package:flutter_app/core/widget/custome_card.dart';
import 'package:flutter_app/basic/attendence.dart';
import 'package:flutter_app/features/attendance/attendance_page.dart';

class AttendanceActions extends StatelessWidget {
  const AttendanceActions({super.key});

  @override
  Widget build(BuildContext context) {
    final actions = [
      {
        'title': 'Leaves',
        'icon': Icons.edit_calendar,
        'color': const Color(0xFF8E7CF0),
      },
      {
        'title': 'MyPay',
        'icon': Icons.list_alt,
        'color': const Color(0xFF00C853),
      },
      {
        'title': 'In/Out Report',
        'icon': Icons.report,
        'color': const Color(0xFFFF6D00),
      },
      {
        'title': 'Fix Attendance',
        'icon': Icons.calendar_today,
        'color': const Color(0xFF6C63FF),
      },
      {
        'title': 'Doc Box',
        'icon': Icons.swap_horiz,
        'color': const Color(0xFFFF4081),
      },
      {
        'title': 'Company Calendor',
        'icon': Icons.location_on,
        'color': const Color(0xFF00ACC1),
      },
      {
        'title': 'Ai Chat Bot',
        'icon': Icons.report,
        'color': const Color(0xFFFF6D00),
      },
      {
        'title': 'Tax Planner',
        'icon': Icons.calendar_today,
        'color': const Color(0xFF6C63FF),
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: actions.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: 1.55,
      ),
      itemBuilder: (context, index) {
        final action = actions[index];

        return AttendanceActionCard(
          title: action['title'] as String,
          icon: action['icon'] as IconData,
          color: action['color'] as Color,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AttendanceScreen()),
            );
          },
        );
      },
    );
  }
}
