import 'package:flutter/material.dart';

class InkEffect extends StatelessWidget {
  const InkEffect({super.key});

  @override
  Widget build(BuildContext context) => Material(
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.white.withOpacity(.1),
          highlightColor: Colors.white.withOpacity(.1),
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
        ),
      );
}
