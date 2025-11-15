import 'dart:async';

import 'package:ezovian/features/auth/models/user_models.dart';
import 'package:ezovian/presentation/signup_page/domain/usecase/signup_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignupUsecase signupUsecase = SignupUsecase();
  SignupBloc() : super(SignupInitial()) {
    on<ProceedToSignupEvent>(_onProceedToSignupEvent);
  }
  FutureOr<void> _onProceedToSignupEvent(
    ProceedToSignupEvent event,
    Emitter<SignupState> emit,
  ) async {
    emit(SignupLoading());
    try {
      final success = await signupUsecase.call(event.user);
      if (success) {
        emit(SignupSuccess('Signup successful'));
      } else {
        emit(SignupError('Signup failed'));
      }
    } catch (e) {
      emit(SignupError(e.toString()));
    }
  }
}
