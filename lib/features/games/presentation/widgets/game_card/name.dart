import 'package:flutter/material.dart';

class GameName extends StatelessWidget {
  const GameName({super.key, required this.name});

  final String? name;

  @override
  Widget build(BuildContext context) => Text(
        name ?? 'Unknown name',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
}
