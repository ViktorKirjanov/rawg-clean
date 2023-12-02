import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: Platform.isIOS ? const CupertinoActivityIndicator() : const CircularProgressIndicator(),
      );
}
