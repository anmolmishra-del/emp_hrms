class EmployeeModel {
  final String fullName;
  final String email;
  final String phone;
  final String employeeCode;

  final String dob;
  final String gender;
  final String address;
  final String emergencyContact;

  final String department;
  final String designation;
  final String joiningDate;
  final bool isActive;

  final String reportingManager;
  final String bankName;
  final String accountNumber;

  // Optional (not in API)
  final String employmentType;
  final String workLocation;
  final String salary;

  EmployeeModel({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.employeeCode,
    required this.designation,
    required this.dob,
    required this.gender,
    required this.address,
    required this.emergencyContact,
    required this.department,
    required this.joiningDate,
    required this.isActive,
    required this.reportingManager,
    required this.bankName,
    required this.accountNumber,
    this.employmentType = "Full Time",
    this.workLocation = "",
    this.salary = "N/A",
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    final personal = json["employee_personal_detail"] ?? {};
    final user = json["user"] ?? {};
    final bank = json["bank_detail"] ?? {};
    final manager = json["manager"] ?? {};

    String address = [
      personal["address_street1"],
      personal["address_city"],
      personal["address_state"],
    ].where((e) => e != null && e.toString().isNotEmpty).join(", ");

    return EmployeeModel(
      // 🔹 HEADER
      fullName: json["full_name"] ?? "",
      email: user["email"] ?? "",
      phone: user["phone_number"] ?? "",
      employeeCode: user["employee_code"] ?? "",
      designation: json["designation"]?["title"] ?? "",

      // 🔹 PROFILE
      dob: personal["date_of_birth"] ?? "",
      gender: personal["gender"] ?? "",
      emergencyContact: personal["emergency_contact"] ?? "",
      address: address,

      // 🔹 JOB
      department: json["department"]?["name"] ?? "",
      joiningDate: json["date_of_joining"] ?? "",
      isActive: json["is_active"] ?? false,
      reportingManager: manager["full_name"] ?? "",

      // 🔹 BANK
      bankName: bank["bank_name"] ?? "",
      accountNumber: bank["bank_account_number"] ?? "",
    );
  }
}
// Map<String, dynamic> toJson() {
//     return {
//       "full_name": fullName,
//       "email": email,
//       "phone": phone,
//       "employee_code": employeeCode,
//       "designation": designation,
//       "date_of_birth": dob,
//       "gender": gender,
//       "address": address,
//       "emergency_contact": emergencyContact,
//       "department": department,
//       "date_of_joining": joiningDate,
//       "is_active": isActive,
//       "reporting_manager": reportingManager,
//       "bank_name": bankName,
//       "account_number": accountNumber,
//     };
//   }