import 'package:ezovian/features/auth/models/user_models.dart';
import 'package:ezovian/features/auth/repository.dart/auth_repository.dart';
import 'package:ezovian/shared/constants/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<LoginEvent>(_login);
    on<SignupEvent>(_signup);
    on<LogoutEvent>((event, emit) => emit(AuthInitial()));
  }
  void _login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final success = await authRepository.login(event.email, event.password);
    if (success) {
      emit(AuthSuccess(event.email));
    } else {
      emit(AuthError(AppConstants.invalidCredentials));
    }
  }

  void _signup(SignupEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final success = await authRepository.signup(event.user);
    if (success) {
      emit(AuthSuccess(AppConstants.signUpSuccessfull));
    } else {
      emit(AuthError(AppConstants.signUpFailed));
    }
  }
}
