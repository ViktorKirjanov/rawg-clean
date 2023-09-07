import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rawg_clean/core/enums/platform_enum.dart';
import 'package:rawg_clean/features/games/data/models/platforms_model.dart';

class PlatformLogos extends StatelessWidget {
  const PlatformLogos({super.key, required this.platforms});

  final List<PlatformsModel> platforms;

  @override
  Widget build(BuildContext context) {
    final List<Widget> logos = [];
    final List<Platform> added = [];

    for (final PlatformsModel platform in platforms) {
      if (platform.platform != null && !added.contains(platform.platform!.slug)) {
        switch (platform.platform!.slug) {
          case Platform.playstation1:
          case Platform.playstation2:
          case Platform.playstation3:
          case Platform.playstation4:
          case Platform.playstation5:
          case Platform.psp:
            added.addAll([
              Platform.playstation1,
              Platform.playstation2,
              Platform.playstation3,
              Platform.playstation4,
              Platform.playstation5,
              Platform.psp,
            ]);

            logos.add(
              const Icon(
                FontAwesomeIcons.playstation,
                color: Colors.blue,
              ),
            );

            break;
          case Platform.xbox360:
          case Platform.xboxOld:
          case Platform.xboxOne:
          case Platform.xboxSeriesX:
            added.addAll([
              Platform.xbox360,
              Platform.xboxOld,
              Platform.xboxOne,
              Platform.xboxSeriesX,
            ]);

            logos.add(
              const Icon(
                FontAwesomeIcons.xbox,
                color: Colors.green,
              ),
            );
            break;
          case Platform.android:
            added.add(Platform.android);
            logos.add(
              const Icon(
                FontAwesomeIcons.android,
                color: Colors.green,
              ),
            );
            break;
          case Platform.pc:
          case Platform.psVita:
            added.addAll([
              Platform.pc,
              Platform.psVita,
            ]);
            logos.add(
              const Icon(
                FontAwesomeIcons.windows,
                color: Colors.white70,
              ),
            );
            break;
          case Platform.ios:
          case Platform.macintosh:
          case Platform.macos:
            added.addAll([
              Platform.ios,
              Platform.macintosh,
              Platform.macos,
            ]);
            logos.add(
              const Icon(
                FontAwesomeIcons.apple,
                color: Colors.white70,
              ),
            );
            break;
          default:
        }
      }
    }

    return Row(
      children: logos
          .map(
            (logo) => Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: logo,
            ),
          )
          .toList(),
    );
  }
}
