import 'package:flutter/cupertino.dart';
import 'package:rawg_clean/config/theme/app_themes.dart';

class TextSliverFillRemaining extends StatelessWidget {
  const TextSliverFillRemaining({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) => const SliverFillRemaining(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Text(
              'Unfortunately, nothing was found',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppTheme.white,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      );
}
