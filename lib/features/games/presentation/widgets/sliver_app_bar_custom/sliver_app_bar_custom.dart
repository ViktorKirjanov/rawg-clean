import 'package:flutter/material.dart';
import 'package:rawg_clean/features/games/presentation/widgets/search_text_input.dart';
import 'package:rawg_clean/features/games/presentation/widgets/sliver_app_bar_custom/bookmarks_button.dart';

class SliverAppBarCustom extends StatelessWidget {
  const SliverAppBarCustom({super.key, required this.appBarBackgroundColor});

  final Color appBarBackgroundColor;

  @override
  Widget build(BuildContext context) => SliverAppBar(
        floating: true,
        toolbarHeight: 80,
        backgroundColor: appBarBackgroundColor,
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(32.0),
            bottomRight: Radius.circular(32.0),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SearchTextInput(),
            const SizedBox(width: 8.0),
            const BookmarkButton(),
          ],
        ),
      );
}
