// payroll_screen.dart
// Modern Payroll Screen UI

import 'package:flutter/material.dart';

class PayrollScreen extends StatelessWidget {
  const PayrollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F2FB),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _PayrollHeader(),
              const SizedBox(height: 16),
              _CurrentMonthCard(),
              const SizedBox(height: 16),
              _SalaryBreakdownCard(),
              const SizedBox(height: 16),
              _RecentPayslipsCard(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------- HEADER ----------------
class _PayrollHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF8E7CF0), Color(0xFFB7A9F4)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(26),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 26,
            backgroundImage: AssetImage('assets/profile.png'),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Payroll',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'View your salary details',
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ---------------- CURRENT MONTH SALARY ----------------
class _CurrentMonthCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Current Month',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              _PayrollTile(label: 'Basic Pay', value: '₹50,000'),
              _PayrollTile(label: 'Allowance', value: '₹5,000'),
              _PayrollTile(label: 'Deductions', value: '₹2,000'),
            ],
          ),
          const SizedBox(height: 16),
          Center(
            child: Column(
              children: const [
                Text(
                  'Net Salary',
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                SizedBox(height: 4),
                Text(
                  '₹53,000',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PayrollTile extends StatelessWidget {
  final String label;
  final String value;

  const _PayrollTile({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
      ],
    );
  }
}

// ---------------- SALARY BREAKDOWN ----------------
class _SalaryBreakdownCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Salary Breakdown',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          _BreakdownRow(label: 'Basic Pay', value: '₹50,000'),
          _BreakdownRow(label: 'House Rent Allowance', value: '₹3,000'),
          _BreakdownRow(label: 'Conveyance', value: '₹2,000'),
          _BreakdownRow(label: 'Professional Tax', value: '-₹200'),
          _BreakdownRow(label: 'Income Tax', value: '-₹1,800'),
          const Divider(height: 24, thickness: 1),
          _BreakdownRow(label: 'Net Salary', value: '₹53,000', isBold: true),
        ],
      ),
    );
  }
}

class _BreakdownRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;

  const _BreakdownRow({
    required this.label,
    required this.value,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black54,
              fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------- RECENT PAYSLIPS ----------------
// ---------------- RECENT PAYSLIPS ----------------
class _RecentPayslipsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final payslips = [
      {'month': 'January', 'net': '₹50,000'},
      {'month': 'February', 'net': '₹52,000'},
      {'month': 'March', 'net': '₹53,000'},
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Recent Payslips',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          Column(
            children: payslips
                .map(
                  (p) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          p['month']!,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          p['net']!,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // TODO: Add view payslip logic
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF8E7CF0),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 6,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text(
                                'View',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton.icon(
                              onPressed: () {
                                // TODO: Add download payslip logic
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      '${p['month']} payslip downloaded!',
                                    ),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.download, size: 14),
                              label: const Text(
                                'Download',
                                style: TextStyle(fontSize: 12),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF6C63FF),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
