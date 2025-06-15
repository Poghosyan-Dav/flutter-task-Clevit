// ... (previous imports remain the same)

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clevit_task/features/presentation/utilities/typography/text_theme.dart';
import 'package:go_router/go_router.dart';

import '../../utilities/strings/app_string.dart';
import '../../widgets/base/base_stateless_widget.dart';
import 'bloc/sign_in_bloc.dart';
import 'bloc/sign_in_event.dart';
import 'bloc/sign_in_state.dart';

class SignInPage extends BaseStatelessWidget {
  const SignInPage();

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      listenWhen: (prev, curr) => prev.isSuccess != curr.isSuccess,
      listener: (context, state) {
        if (state.isSuccess) {
          context.go('/collection');
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            elevation: 0,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height - kToolbarHeight - 48,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        AppStrings.signIn,
                        style: getFonts(context).ebGaramondBold?.copyWith(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                      if (state.errorMessage != null) ...[
                        const SizedBox(height: 16),
                        Text(
                          state.errorMessage!,
                          style: getFonts(context).ebGaramondMedium?.copyWith(
                            color: Colors.red,
                          ),
                        ),
                      ],
                      const SizedBox(height: 16),
                      TextField(
                        onChanged: (val) => context.read<SignInBloc>().add(SignInEvent.emailChanged(val)),
                        style: getFonts(context).ebGaramondMedium?.copyWith(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: AppStrings.email,
                          labelStyle: getFonts(context).ebGaramondMedium?.copyWith(color: Colors.amber),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.amber),
                          ),
                          errorText: state.email.isNotEmpty && !state.email.contains('@')
                              ? 'Invalid email format'
                              : null,
                          errorStyle: getFonts(context).ebGaramondMedium?.copyWith(
                            color: Colors.red,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      TextField(
                        obscureText: true,
                        onChanged: (val) => context.read<SignInBloc>().add(SignInEvent.passwordChanged(val)),
                        style: getFonts(context).ebGaramondMedium?.copyWith(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: AppStrings.password,
                          labelStyle: getFonts(context).ebGaramondMedium?.copyWith(color: Colors.amber),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.amber),
                          ),
                          suffixIcon: const Icon(Icons.visibility, color: Colors.amber),
                        ),
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: state.isSubmitting
                            ? null
                            : () => context.read<SignInBloc>().add(const SignInEvent.submitted()),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          foregroundColor: Colors.black,
                          minimumSize: const Size.fromHeight(48),
                          textStyle: getFonts(context).ebGaramondBold,
                        ),
                        child: state.isSubmitting
                            ? const CircularProgressIndicator()
                            : Text(
                          AppStrings.continueText,
                          style: getFonts(context).ebGaramondBold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: state.isSubmitting
                                ? null
                                : () {}, // TODO: Implement forgot password
                            child: Text(
                              'Can\'t sign in?',
                              style: getFonts(context).ebGaramondMedium.copyWith(
                                color: getColors(context).grey,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {}, // TODO: Implement recover password
                            child: Text(
                              AppStrings.recoverPassowrd,
                              style: getFonts(context).ebGaramondMediumItalic.copyWith(
                                color: Colors.amber,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}