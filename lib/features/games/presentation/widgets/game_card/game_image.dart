import 'package:flutter/widgets.dart';
import 'package:rawg_clean/core/widgets/network_image_loader.dart';

class GameImage extends StatelessWidget {
  const GameImage({
    super.key,
    required this.backgroundImage,
  });

  final String? backgroundImage;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 200.0,
        width: double.infinity,
        child: NetworkImageLoader(
          path: backgroundImage,
        ),
      );
}
