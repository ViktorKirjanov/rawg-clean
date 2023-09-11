import 'package:flutter/cupertino.dart';
import 'package:rawg_clean/config/theme/app_themes.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) => const Center(
        child: CupertinoActivityIndicator(
          color: AppTheme.white,
        ),
      );
}
