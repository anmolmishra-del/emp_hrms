// import 'package:flutter/material.dart';

// class AttendanceScreen extends StatelessWidget {
//   const AttendanceScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF4F2FB),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: const [
//               _AttendanceHeader(),
//               SizedBox(height: 16),
//               WeeklyAttendanceChart(),
//               SizedBox(height: 16),
//               _WeekSummaryCard(),
//               SizedBox(height: 16),
//               _AttendanceActions(),
//               SizedBox(height: 24),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // ---------------- HEADER ----------------
// class _AttendanceHeader extends StatelessWidget {
//   const _AttendanceHeader();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(16),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         gradient: const LinearGradient(
//           colors: [Color(0xFF8E7CF0), Color(0xFFB7A9F4)],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         borderRadius: BorderRadius.circular(26),
//       ),
//       child: Row(
//         children: const [
//           CircleAvatar(
//             radius: 26,
//             backgroundImage: AssetImage('assets/images/profile.png'),
//           ),
//           SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Attendance',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 SizedBox(height: 4),
//                 Text(
//                   'Mark and manage your attendance',
//                   style: TextStyle(color: Colors.white70),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class WeeklyAttendanceChart extends StatelessWidget {
//   const WeeklyAttendanceChart({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final weeklyData = [
//       {'day': 'Sun', 'hours': 0.0},
//       {'day': 'Mon', 'hours': 8.0},
//       {'day': 'Tue', 'hours': 7.5},
//       {'day': 'Wed', 'hours': 6.0},
//       {'day': 'Thu', 'hours': 8.5},
//       {'day': 'Fri', 'hours': 7.0},
//       {'day': 'Sat', 'hours': 0.0},
//     ];

//     const maxHours = 9.0;

//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 16),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.06),
//             blurRadius: 12,
//             offset: const Offset(0, 6),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'Weekly Attendance',
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//           ),
//           const SizedBox(height: 20),

//           /// BAR CHART
//           SizedBox(
//             height: 180,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: weeklyData.map((data) {
//                 final double barHeight =
//                     (data['hours'] as double) / maxHours * 140;

//                 return Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Text(
//                       '${data['hours']}h',
//                       style: const TextStyle(fontSize: 10),
//                     ),
//                     const SizedBox(height: 6),
//                     Container(
//                       width: 18,
//                       height: barHeight,
//                       decoration: BoxDecoration(
//                         color: barHeight == 0
//                             ? Colors.grey.shade300
//                             : const Color.fromARGB(255, 53, 162, 235),
//                         borderRadius: BorderRadius.circular(6),
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     Text(
//                       data['day'] as String,
//                       style: const TextStyle(
//                         fontSize: 12,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ],
//                 );
//               }).toList(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _StatusTile extends StatelessWidget {
//   final String label;
//   final String value;

//   const _StatusTile({required this.label, required this.value});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 90,
//       padding: const EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         color: const Color(0xFFF1EEFF),
//         borderRadius: BorderRadius.circular(14),
//       ),
//       child: Column(
//         children: [
//           Text(
//             value,
//             style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             label,
//             style: const TextStyle(fontSize: 11, color: Colors.black54),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ---------------- WEEK SUMMARY ----------------
// class _WeekSummaryCard extends StatelessWidget {
//   const _WeekSummaryCard();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 16),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: const [
//           Text(
//             'This Week',
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//           ),
//           SizedBox(height: 12),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               _SummaryTile(label: 'Present', value: '5 Days'),
//               _SummaryTile(label: 'Absent', value: '0 Day'),
//               _SummaryTile(label: 'Leave', value: '0'),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _SummaryTile extends StatelessWidget {
//   final String label;
//   final String value;

//   const _SummaryTile({required this.label, required this.value});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//           value,
//           style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//         ),
//         const SizedBox(height: 4),
//         Text(
//           label,
//           style: const TextStyle(fontSize: 12, color: Colors.black54),
//         ),
//       ],
//     );
//   }
// }

// // ---------------- ATTENDANCE ACTION CARDS ----------------
// class _AttendanceActions extends StatelessWidget {
//   const _AttendanceActions();

//   @override
//   Widget build(BuildContext context) {
//     final actions = [
//       {
//         'title': 'Attendance Regularization',
//         'icon': Icons.edit_calendar,
//         'color': Color(0xFF8E7CF0),
//       },
//       {
//         'title': 'Daily Details',
//         'icon': Icons.list_alt,
//         'color': Color(0xFF00C853),
//       },
//       {
//         'title': 'In/Out Report',
//         'icon': Icons.report,
//         'color': Color(0xFFFF6D00),
//       },
//       {
//         'title': 'Calendar View',
//         'icon': Icons.calendar_today,
//         'color': Color(0xFF6C63FF),
//       },
//       {
//         'title': 'Change Shift Request',
//         'icon': Icons.swap_horiz,
//         'color': Color(0xFFFF4081),
//       },
//       {
//         'title': 'Geo-location Tracking',
//         'icon': Icons.location_on,
//         'color': Color(0xFF00ACC1),
//       },
//     ];

//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: GridView.builder(
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         itemCount: actions.length,
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 14,
//           mainAxisSpacing: 14,
//           childAspectRatio: 1.55,
//         ),
//         itemBuilder: (context, index) {
//           final action = actions[index];
//           return _ActionCard(
//             icon: action['icon'] as IconData,
//             title: action['title'] as String,
//             color: action['color'] as Color,
//             onTap: () {
//               // TODO: Navigate to respective page
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// class _ActionCard extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final Color color;
//   final VoidCallback? onTap;

//   const _ActionCard({
//     required this.icon,
//     required this.title,
//     required this.color,
//     this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(18),
//       child: Container(
//         padding: const EdgeInsets.all(14),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(18),
//           boxShadow: const [
//             BoxShadow(
//               color: Colors.black12,
//               blurRadius: 4,
//               offset: Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               padding: const EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 color: const Color(0xFFF1EEFF),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Icon(icon, color: color, size: 20),
//             ),
//             const Spacer(),
//             Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
//           ],
//         ),
//       ),
//     );
//   }
// }
