import 'dart:io';

import 'package:flutter/material.dart';

class AndroidRefreshIndicator extends StatelessWidget {
  const AndroidRefreshIndicator({
    super.key,
    required this.child,
    required this.onRefresh,
  });

  final Widget child;
  final void Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return RefreshIndicator(
        onRefresh: () async => onRefresh(),
        child: child,
      );
    } else {
      return child;
    }
  }
}
