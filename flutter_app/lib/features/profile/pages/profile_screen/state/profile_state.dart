import 'package:flutter_app/features/profile/pages/jobdetail.dart/model/model_class.dart';

class ProfileState {
  final bool isLoading;
  final EmployeeModel? user;
  final String? error;

  const ProfileState({this.isLoading = false, this.user, this.error});

  ProfileState copyWith({bool? isLoading, EmployeeModel? user, String? error}) {
    return ProfileState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      error: error,
    );
  }
}
