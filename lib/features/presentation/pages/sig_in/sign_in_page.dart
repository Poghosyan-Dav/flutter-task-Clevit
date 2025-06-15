import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'bloc/sign_in_bloc.dart';
import 'bloc/sign_in_event.dart';
import 'bloc/sign_in_state.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignInBloc(),
      child: const _SignInForm(),
    );
  }
}

class _SignInForm extends StatelessWidget {
  const _SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      listenWhen: (prev, curr) => prev.isSuccess != curr.isSuccess,
      listener: (context, state) {
        if (state.isSuccess) {
          context.go('/collection');
        } else if (state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage!)),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xFF02131E),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('Sign in',
                    style: TextStyle(fontSize: 24, color: Colors.white)),
                const SizedBox(height: 32),
                TextField(
                  onChanged: (val) =>
                      context.read<SignInBloc>().add(SignInEvent.emailChanged(val)),
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.amber),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                TextField(
                  obscureText: true,
                  onChanged: (val) => context
                      .read<SignInBloc>()
                      .add(SignInEvent.passwordChanged(val)),
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.amber),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber),
                    ),
                    suffixIcon: Icon(Icons.visibility, color: Colors.amber),
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: state.isSubmitting
                      ? null
                      : () => context
                      .read<SignInBloc>()
                      .add(const SignInEvent.submitted()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.black,
                    minimumSize: const Size.fromHeight(48),
                  ),
                  child: state.isSubmitting
                      ? const CircularProgressIndicator()
                      : const Text('Continue'),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Recover password',
                    style: TextStyle(color: Colors.amber),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
