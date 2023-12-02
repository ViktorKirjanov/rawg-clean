import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  const Rating({
    super.key,
    required this.rating,
    required this.ratingTop,
  });

  final double? rating;
  final double? ratingTop;

  @override
  Widget build(BuildContext context) => (rating != null && ratingTop != null)
      ? Text(
          '$rating / $ratingTop',
          style: const TextStyle(
            color: Colors.white54,
            fontSize: 16.0,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        )
      : const SizedBox.shrink();
}
