import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rawg_clean/config/theme/app_themes.dart';
import 'package:rawg_clean/core/enums/parent_platform_enum.dart';
import 'package:rawg_clean/features/games/domain/entities/parent_platforms_entity.dart';

class ParentPlatformLogos extends StatelessWidget {
  const ParentPlatformLogos({super.key, required this.platforms});

  final List<ParentPlatformsEntity> platforms;

  @override
  Widget build(BuildContext context) {
    final List<Widget> logos = [];

    platforms.sort((b, a) => a.platform!.name!.compareTo(b.platform!.name!));

    for (final ParentPlatformsEntity platform in platforms) {
      if (platform.platform != null) {
        switch (platform.platform!.slug) {
          case ParentPlatform.android:
            logos.add(
              const Icon(FontAwesomeIcons.android, color: Colors.green),
            );
            break;
          case ParentPlatform.atari:
            logos.add(
              SvgPicture.asset(
                'assets/svg/atari.svg',
                colorFilter: const ColorFilter.mode(AppTheme.red, BlendMode.srcIn),
                height: 24.0,
              ),
            );
          case ParentPlatform.commodoreAmiga:
            logos.add(
              SvgPicture.asset(
                'assets/svg/commodore-amiga.svg',
                height: 24.0,
              ),
            );
            break;
          case ParentPlatform.ios:
          case ParentPlatform.mac:
            logos.add(
              const Icon(
                FontAwesomeIcons.apple,
                color: Colors.white70,
              ),
            );
            break;
          case ParentPlatform.linux:
            logos.add(
              SvgPicture.asset(
                'assets/svg/linux.svg',
                height: 24.0,
              ),
            );
            break;
          case ParentPlatform.nintendo:
            logos.add(
              SvgPicture.asset(
                'assets/svg/nintendo-switch.svg',
                height: 24.0,
              ),
            );
            break;
          case ParentPlatform.pc:
            logos.add(
              SvgPicture.asset(
                'assets/svg/windows.svg',
                height: 24.0,
              ),
            );
            break;
          case ParentPlatform.playstation:
            logos.add(
              const Icon(
                FontAwesomeIcons.playstation,
                color: Colors.blue,
              ),
            );

            break;
          case ParentPlatform.web:
            logos.add(
              SvgPicture.asset(
                'assets/svg/web.svg',
                colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
                height: 24.0,
              ),
            );
            break;
          case ParentPlatform.xbox:
            logos.add(
              const Icon(
                FontAwesomeIcons.xbox,
                color: Colors.green,
              ),
            );
            break;
          case ParentPlatform.sega:
            logos.add(
              SvgPicture.asset(
                'assets/svg/sega.svg',
                colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
                height: 24.0,
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
              padding: const EdgeInsets.only(right: 12.0),
              child: logo,
            ),
          )
          .toList(),
    );
  }
}
