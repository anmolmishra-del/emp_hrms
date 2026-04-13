import 'package:flutter_app/features/profile/pages/jobdetail.dart/model/model_class.dart';

class JobDetailsState {
  final bool isLoading;
  final EmployeeModel? employeeData;
  final String? error;

  const JobDetailsState({
    this.isLoading = false,
    this.employeeData,
    this.error,
  });

  JobDetailsState copyWith({
    bool? isLoading,
    EmployeeModel? employeeData,
    String? error,
  }) {
    return JobDetailsState(
      isLoading: isLoading ?? this.isLoading,
      employeeData: employeeData ?? this.employeeData,
      error: error ?? this.error,
    );
  }
}
