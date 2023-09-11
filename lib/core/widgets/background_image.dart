import 'package:flutter/widgets.dart';
import 'package:rawg_clean/config/theme/app_themes.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    super.key,
    required this.image,
    required this.child,
  });

  final String image;
  final Widget child;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 0.75,
                colors: [
                  AppTheme.black.withOpacity(0.9),
                  AppTheme.black.withOpacity(0.95),
                  AppTheme.black.withOpacity(1.0),
                ],
                stops: const [
                  0.0,
                  0.5,
                  1.0,
                ],
              ),
            ),
          ),
          child,
        ],
      );
}
