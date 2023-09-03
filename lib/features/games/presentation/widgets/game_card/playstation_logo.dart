import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlaystationLogo extends StatelessWidget {
  const PlaystationLogo({super.key});

  @override
  Widget build(BuildContext context) => const Icon(
        FontAwesomeIcons.playstation,
        color: Colors.blue,
      );
}
