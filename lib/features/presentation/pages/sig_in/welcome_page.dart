import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF02131E),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/pattern.png', fit: BoxFit.cover),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(24),
              margin: const EdgeInsets.symmetric(horizontal: 32),
              decoration: BoxDecoration(
                color: const Color(0xFF0C1C24).withOpacity(0.8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Welcome!',
                      style: TextStyle(fontSize: 24, color: Colors.white)),
                  const SizedBox(height: 8),
                  const Text('Text text text',
                      style: TextStyle(color: Colors.white70)),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black,
                      minimumSize: const Size.fromHeight(48),
                    ),
                    child: const Text('Scan bottle'),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Have an account?",
                          style: TextStyle(color: Colors.white70)),
                      TextButton(
                        onPressed: () {
                          context.go('/sign-in');
                        },
                        child: const Text(
                          'Sign in first',
                          style: TextStyle(color: Colors.amber),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
