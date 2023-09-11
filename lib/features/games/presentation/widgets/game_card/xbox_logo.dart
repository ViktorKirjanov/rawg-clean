import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class XboxLogo extends StatelessWidget {
  const XboxLogo({super.key});

  @override
  Widget build(BuildContext context) => const Icon(
        FontAwesomeIcons.xbox,
        color: Colors.green,
      );
}
