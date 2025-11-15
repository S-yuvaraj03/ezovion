part of 'signup_bloc.dart';

abstract class SignupEvent {}

class ProceedToSignupEvent extends SignupEvent {
  final User user;
  ProceedToSignupEvent(this.user);
}
