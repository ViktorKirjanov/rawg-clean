import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:rawg_clean/config/theme/app_themes.dart';

class BookmarkButton extends StatelessWidget {
  const BookmarkButton({super.key});

  @override
  Widget build(BuildContext context) => GestureDetector(
        child: Container(
          width: 60.0,
          height: 60.0,
          decoration: BoxDecoration(
            color: AppTheme.darkBlue,
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            border: Border.all(
              width: 1.0,
              color: AppTheme.blue,
            ),
          ),
          child: const Center(
            child: Icon(
              FontAwesomeIcons.bookmark,
              color: AppTheme.green,
              size: 24.0,
            ),
          ),
        ),
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
          context.push('/local');
        },
      );
}
