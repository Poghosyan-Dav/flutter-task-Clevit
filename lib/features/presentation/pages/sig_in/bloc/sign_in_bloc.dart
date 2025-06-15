import 'package:flutter_bloc/flutter_bloc.dart';
import 'sign_in_event.dart';
import 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState.initial()) {
    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<Submitted>((event, emit) async {
      if (!_isValidEmail(state.email) || state.password.isEmpty) {
        emit(state.copyWith(errorMessage: 'Invalid credentials',isSubmitting: false,
          isSuccess: false,));
        return;
      }

      emit(state.copyWith(isSubmitting: true, errorMessage: null,isSuccess: true));
      await Future.delayed(const Duration(seconds: 1)); // mock auth
      emit(state.copyWith(isSubmitting: false,isSuccess: false));
      // Navigate or emit success state
    });
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }
}
