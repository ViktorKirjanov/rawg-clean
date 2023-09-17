import 'package:flutter/material.dart';
import 'package:rawg_clean/config/theme/app_themes.dart';

class CustomScrollViewWrapper extends StatefulWidget {
  const CustomScrollViewWrapper({
    super.key,
    required this.appbar,
    required this.pinned,
    required this.floating,
    required this.slivers,
  });

  final Widget appbar;
  final bool pinned;
  final bool floating;
  final List<Widget> slivers;

  @override
  State<CustomScrollViewWrapper> createState() => _CustomScrollViewWrapperState();
}

class _CustomScrollViewWrapperState extends State<CustomScrollViewWrapper> {
  final ScrollController _scrollController = ScrollController();

  Color _appBarBackgroundColor = AppTheme.darkBlue.withOpacity(.0);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 0 && _scrollController.offset <= 75) {
        setState(() {
          _appBarBackgroundColor = AppTheme.darkBlue.withOpacity(_scrollController.offset / 90);
        });
      } else if (_scrollController.offset <= 0) {
        setState(() {
          _appBarBackgroundColor = AppTheme.darkBlue.withOpacity(.0);
        });
      } else {
        setState(() {
          _appBarBackgroundColor = AppTheme.darkBlue.withOpacity(.9);
        });
      }

      if (_appBarBackgroundColor.opacity >= .9) {
        setState(() {
          _appBarBackgroundColor = AppTheme.darkBlue.withOpacity(.9);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) => CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            pinned: widget.pinned,
            floating: widget.floating,
            toolbarHeight: 80,
            elevation: 0.0,
            scrolledUnderElevation: 0.0,
            backgroundColor: _appBarBackgroundColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16.0),
                bottomRight: Radius.circular(16.0),
              ),
            ),
            title: widget.appbar,
          ),
          ...widget.slivers,
        ],
      );
}
