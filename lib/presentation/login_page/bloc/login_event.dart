part of 'login_bloc.dart';

abstract class LoginEvent {}

class ProceedToLoginEvent extends LoginEvent {
  final String email;
  final String password;
  ProceedToLoginEvent(this.email, this.password);
}
