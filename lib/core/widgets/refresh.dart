import 'package:flutter/material.dart';
import 'package:rawg_clean/config/theme/app_themes.dart';

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
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppTheme.white,
                  fontSize: 20.0,
                ),
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
