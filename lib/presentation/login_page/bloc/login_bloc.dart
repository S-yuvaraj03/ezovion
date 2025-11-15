import 'dart:async';

import 'package:ezovian/presentation/login_page/domain/usecase/login_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase loginUsecase = LoginUsecase();
  LoginBloc() : super(LoginInitial()) {
    on<ProceedToLoginEvent>(_onLoginEvent);
  }
  FutureOr<void> _onLoginEvent(
    ProceedToLoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    try {
      final success = await loginUsecase.call(event.email, event.password);
      if (success) {
        emit(LoginSuccess('Login successful'));
      } else {
        emit(LoginError('Login failed'));
      }
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }
}
