import 'package:flutter/material.dart';
import 'package:rawg_clean/config/theme/app_themes.dart';
import 'package:rawg_clean/features/games/presentation/pages/games_page/games_pages.dart';
import 'package:rawg_clean/injection_container.dart';

Future<void> main() async {
  await initDependencies();
  runApp(const RawgApp());
}

class RawgApp extends StatelessWidget {
  const RawgApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        home: const GamesPages(),
      );
}
