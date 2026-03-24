import 'package:flutter/material.dart';
import 'package:flutter_app/features/auth/login/state/login_state.dart';
import 'package:flutter_app/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());

  final formKey = GlobalKey<FormState>();
  final TextEditingController mobileController = TextEditingController();

  /// VALIDATION
  String? validateMobile(String? value) {
    if (value == null || value.isEmpty) {
      return "Mobile number required";
    } else if (value.length != 10) {
      return "Enter valid 10-digit number";
    }
    return null;
  }

  /// MOBILE CHANGE
  void onMobileChanged(String value) {
    emit(state.copyWith(isValidMobile: value.length == 10));
  }

  /// SEND OTP
  void sendOtp(BuildContext context) {
    if (!formKey.currentState!.validate()) return;

    emit(state.copyWith(status: LoginStatus.loading));

    Future.delayed(const Duration(seconds: 1), () {
      emit(state.copyWith(status: LoginStatus.success));

      Navigator.pushNamed(
        context,
        Routes.otp,
        arguments: mobileController.text,
      );
    });
  }
}
