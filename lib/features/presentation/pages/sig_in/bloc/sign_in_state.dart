import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_state.freezed.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState({
    required String email,
    required String password,
    required bool isSubmitting,
    required bool isSuccess,
    required String? errorMessage,
  }) = _SignInState;

  factory SignInState.initial() => const SignInState(
    email: '',
    password: '',
    isSubmitting: false,
    isSuccess: false,
    errorMessage: null,
  );
}
