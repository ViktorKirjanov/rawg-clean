import 'package:flutter/material.dart';
import 'package:rawg_clean/config/theme/app_themes.dart';
import 'package:rawg_clean/features/games/presentation/pages/remote_games_page.dart';
import 'package:rawg_clean/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(const RawgApp());
}

class RawgApp extends StatelessWidget {
  const RawgApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        home: const RemoteGamesPage(),
      );
}
