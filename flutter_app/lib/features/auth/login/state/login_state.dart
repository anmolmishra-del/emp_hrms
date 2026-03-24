enum LoginStatus { initial, loading, success, failure }

class LoginState {
  final bool obscurePassword;
  final bool isValidMobile;
  final LoginStatus status;
  final String? errorMessage;

  LoginState({
    this.obscurePassword = true,
    this.isValidMobile = false,
    this.status = LoginStatus.initial,
    this.errorMessage,
  });

  LoginState copyWith({
    bool? obscurePassword,
    bool? isValidMobile,
    LoginStatus? status,
    String? errorMessage,
  }) {
    return LoginState(
      obscurePassword: obscurePassword ?? this.obscurePassword,
      isValidMobile: isValidMobile ?? this.isValidMobile,
      status: status ?? this.status,
      errorMessage: errorMessage,
    );
  }
}
