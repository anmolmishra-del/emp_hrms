import 'package:flutter/material.dart';
import 'package:flutter_app/core/services/api_service.dart';
import 'package:flutter_app/features/profile/pages/jobdetail.dart/cubit/job_cubit.dart'
    show JobDetailsCubit;
import 'package:flutter_app/features/profile/pages/jobdetail.dart/model/model_class.dart';
import 'package:flutter_app/features/profile/pages/jobdetail.dart/repository/job_repository.dart';
import 'package:flutter_app/features/profile/pages/profile_screen/ui/profile_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/job_state.dart';

class JobDetailsPage extends StatelessWidget {
  JobDetailsPage({super.key});

  final apiService = ApiService();
  late final EmployeeRepository employeeRepo = EmployeeRepository(apiService);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // create: (context) => JobDetailsCubit(employeeRepo)..loadData(),
      create: (context) => JobDetailsCubit(employeeRepo),

      child: BlocBuilder<JobDetailsCubit, JobDetailsState>(
        builder: (context, state) {
          final user = state.employeeData;

          return DefaultTabController(
            length: 2,
            child: Scaffold(
              backgroundColor: Colors.grey.shade100,
              appBar: AppBar(
                title: const Text("Employee Details"),
                backgroundColor: Colors.blue,
                centerTitle: true,
              ),

              body: NestedScrollView(
                headerSliverBuilder: (context, _) {
                  return [
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          _buildProfileHeader(user),
                          const SizedBox(height: 10),
                          _buildTabBar(),
                        ],
                      ),
                    ),
                  ];
                },

                body: TabBarView(
                  children: [_buildProfileTab(user), _buildJobTab(user)],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // ---------------- TAB BAR ----------------
  Widget _buildTabBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: const TabBar(
        indicator: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        labelColor: Colors.white,
        dividerColor: Colors.transparent,
        unselectedLabelColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.tab,
        tabs: [
          Tab(text: "Profile"),
          Tab(text: "Job Details"),
        ],
      ),
    );
  }
}

// ---------------- PROFILE HEADER ----------------
Widget _buildProfileHeader(EmployeeModel? user) {
  return Container(
    padding: const EdgeInsets.all(16),
    color: Colors.white,
    child: Column(
      children: [
        const CircleAvatar(
          radius: 45,
          backgroundImage: NetworkImage(
            "https://randomuser.me/api/portraits/men/75.jpg",
          ),
        ),
        const SizedBox(height: 10),

        Text(
          user?.fullName ?? "",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),

        Text(user?.designation ?? "", style: TextStyle(color: Colors.grey)),

        const Divider(),

        _info(Icons.email, user?.email ?? ""),
        _info(Icons.phone, user?.phone ?? ""),
        _info(Icons.badge, "Employee ID: ${user?.employeeCode ?? ""}"),
        // _info(Icons.location_on, employee?["employee_personal_detail"]?["address_city"] ?? ""),
      ],
    ),
  );
}

// ---------------- PROFILE TAB ----------------
Widget _buildProfileTab(EmployeeModel? user) {
  return ListView(
    padding: const EdgeInsets.all(16),
    children: [
      buildCard("Profile Details", [
        detailRow("Date of Birth", formatDate(user?.dob)),
        detailRow("Gender", user?.gender ?? ""),
        detailRow("Address", user?.address ?? ""),
        detailRow("Name", user?.fullName ?? ""),
        // detailRow("Relationship", user?.relationship ?? ""),
        detailRow("Phone", user?.phone ?? ""),
      ]),
    ],
  );
}

// ---------------- JOB TAB ----------------
Widget _buildJobTab(EmployeeModel? user) {
  return ListView(
    padding: const EdgeInsets.all(16),
    children: [
      buildCard("Employment Details", [
        detailRow("Department", user?.department ?? ""),
        detailRow("Designation", user?.designation ?? ""),
        detailRow("Joining Date", user?.joiningDate ?? ""),
        detailRow("Employment Type", user?.employmentType ?? ""),
        detailRow("Work Location", user?.workLocation ?? ""),
        detailRow("Reporting Manager", user?.reportingManager ?? ""),
        detailRow("Status", "Active", isStatus: true),
        detailRow("Salary", user?.salary ?? ""),
        detailRow("Bank Name", user?.bankName ?? ""),
        detailRow("Account No", user?.accountNumber ?? ""),
      ]),
    ],
  );
}

// ---------------- HELPERS ----------------
Widget _info(IconData icon, String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Row(
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(width: 10),
        Expanded(child: Text(text)),
      ],
    ),
  );
}

Widget buildCard(String title, List<Widget> children) {
  return Container(
    padding: const EdgeInsets.all(16),
    margin: const EdgeInsets.only(bottom: 16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          blurRadius: 8,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        ...children,
      ],
    ),
  );
}

Widget detailRow(String title, String value, {bool isStatus = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(
          value,
          style: TextStyle(
            color: isStatus ? Colors.green : Colors.black,
            fontWeight: isStatus ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    ),
  );
}
