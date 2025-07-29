part of 'login_bloc.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String email;

  LoginSuccess(this.email);
}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure(this.error);
}

class LoginValidationState extends LoginState {
  final String? emailError;
  final String? passwordError;
  final bool isValid;

  LoginValidationState({
    this.emailError,
    this.passwordError,
    required this.isValid,
  });
}
