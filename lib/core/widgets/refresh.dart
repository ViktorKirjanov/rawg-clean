import 'package:flutter/material.dart';

class Refresh extends StatelessWidget {
  const Refresh({
    super.key,
    required this.message,
    required this.onPressed,
  });

  final String message;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                message,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                width: double.infinity,
                height: 60.0,
                child: OutlinedButton(
                  onPressed: onPressed,
                  child: const Text('Refresh'),
                ),
              ),
            ],
          ),
        ),
      );
}
