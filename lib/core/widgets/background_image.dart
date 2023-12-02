import 'package:flutter/material.dart';
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
          Container(color: AppTheme.black.withOpacity(0.9)),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 82, 43, 172).withOpacity(0.2),
                  const Color.fromARGB(255, 11, 3, 12).withOpacity(0.5),
                ],
                stops: const [
                  0.0,
                  1.0,
                ],
              ),
            ),
          ),
          child,
        ],
      );
}
