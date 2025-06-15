import 'package:flutter_bloc/flutter_bloc.dart';
import 'sign_in_event.dart';
import 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState.initial()) {
    on<EmailChanged>((event, emit) {
      emit(state.copyWith(
        email: event.email,
        errorMessage: null, // Clear error when email changes
      ));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(
        password: event.password,
        errorMessage: null, // Clear error when password changes
      ));
    });

    on<Submitted>((event, emit) async {
      // Validate fields
      if (state.email.isEmpty) {
        emit(state.copyWith(
          errorMessage: 'Email is required',
          isSubmitting: false,
          isSuccess: false,
        ));
        return;
      }

      if (!_isValidEmail(state.email)) {
        emit(state.copyWith(
          errorMessage: 'Please enter a valid email',
          isSubmitting: false,
          isSuccess: false,
        ));
        return;
      }

      if (state.password.isEmpty) {
        emit(state.copyWith(
          errorMessage: 'Password is required',
          isSubmitting: false,
          isSuccess: false,
        ));
        return;
      }

      emit(state.copyWith(
        isSubmitting: true,
        errorMessage: null,
        isSuccess: false,
      ));

      await Future.delayed(const Duration(seconds: 1));

      if (_isValidEmail(state.email) && state.password.isNotEmpty) {
        emit(state.copyWith(
          isSubmitting: false,
          isSuccess: true,
        ));
      } else {
        emit(state.copyWith(
          isSubmitting: false,
          isSuccess: false,
          errorMessage: 'Invalid credentials',
        ));
      }
    });
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }
}