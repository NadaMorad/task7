part of 'login_bloc.dart';

abstract class LoginEvent {}

class LoginSubmittedEvent extends LoginEvent {
  final String email;
  final String password;

  LoginSubmittedEvent({required this.email, required this.password});
}

class LoginValidateEvent extends LoginEvent {
  final String email;
  final String password;

  LoginValidateEvent({required this.email, required this.password});
}
