class EmployeeModel {
  final String fullName;
  final String employeeCode;
  final String? dateOfJoining;
  final String designation;
  final String department;
  final String manager;

  EmployeeModel({
    required this.fullName,
    required this.employeeCode,
    this.dateOfJoining,
    required this.designation,
    required this.department,
    required this.manager,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      fullName: json['full_name'] ?? '',
      employeeCode: json['employee_code'] ?? '',
      dateOfJoining: json['date_of_joining'],

      // ✅ SAFE parsing
      designation: json['designation']?['name'] ?? '',
      department: json['department']?['name'] ?? '',
      manager: json['manager']?['name'] ?? '',
    );
  }
}
