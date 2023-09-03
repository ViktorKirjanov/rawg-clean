import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rawg_clean/config/theme/app_themes.dart';

class LikeButton extends StatelessWidget {
  const LikeButton({super.key});

  @override
  Widget build(BuildContext context) => Positioned(
        top: 8.0,
        right: 8.0,
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                color: Colors.white.withOpacity(0.5),
              ),
              child: const Center(
                child: Icon(
                  FontAwesomeIcons.heart,
                  color: AppTheme.black,
                  size: 24.0,
                ),
              ),
            ),
          ),
        ),
      );
}
