import 'package:flutter/material.dart';
import 'package:rawg_clean/features/games/presentation/widgets/search_text_input.dart';
import 'package:rawg_clean/features/games/presentation/widgets/sliver_app_bar_custom/bookmarks_button.dart';

class SliverAppBarCustom extends StatelessWidget {
  const SliverAppBarCustom({super.key, required this.appBarBackgroundColor});

  final Color appBarBackgroundColor;

  @override
  Widget build(BuildContext context) => SliverAppBar(
        floating: false,
        pinned: true,
        toolbarHeight: 80,
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
        backgroundColor: appBarBackgroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(32.0),
            bottomRight: Radius.circular(32.0),
          ),
        ),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SearchTextInput(),
            SizedBox(width: 8.0),
            BookmarkButton(),
          ],
        ),
      );
}
