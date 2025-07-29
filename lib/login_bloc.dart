import 'package:flutter_bloc/flutter_bloc.dart';
import '../auth_repo.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepo authRepo;

  LoginBloc({required this.authRepo}) : super(LoginInitial()) {
    on<LoginValidateEvent>((event, emit) {
      String? emailError;
      String? passwordError;
      bool isValid = true;

      if (event.email.isEmpty) {
        emailError = "Email is required";
      }
      if (event.password.isEmpty) {
        passwordError = "Password is required";
        isValid = false;
      }
      emit(
        LoginValidationState(
          emailError: emailError,
          passwordError: passwordError,
          isValid: isValid,
        ),
      );
    });

    on<LoginSubmittedEvent>((event, emit) async {
      emit(LoginLoading());
      try {
        final user = await authRepo.signinWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        if (user != null) {
          emit(LoginSuccess(event.email));
        } else {
          emit(LoginFailure("Login failed"));
        }
      } catch (e) {
        emit(LoginFailure(e.toString()));
      }
    });
  }
}
