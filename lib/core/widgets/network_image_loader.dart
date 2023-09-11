import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NetworkImageLoader extends StatelessWidget {
  const NetworkImageLoader({
    super.key,
    required this.path,
  });

  final String? path;

  @override
  Widget build(BuildContext context) => path != null
      ? CachedNetworkImage(
          imageUrl: path!,
          fit: BoxFit.cover,
          placeholder: (context, url) => const SizedBox.shrink(),
          errorWidget: (context, url, error) => const _ErrorCover(),
        )
      : const _ErrorCover();
}

class _ErrorCover extends StatelessWidget {
  const _ErrorCover();

  @override
  Widget build(BuildContext context) => const Padding(
        padding: EdgeInsets.all(16.0),
        child: Icon(
          Icons.error,
          color: Colors.redAccent,
        ),
      );
}
