import 'package:go_router/go_router.dart';
import 'package:rawg_clean/features/games/presentation/pages/favorites_games_page.dart';
import 'package:rawg_clean/features/games/presentation/pages/remote_games_page.dart';

class AppRoutes {
  static final GoRouter _router = GoRouter(
    routerNeglect: true,
    initialLocation: RemoteGamesPage.route,
    routes: [
      GoRoute(
        name: '/',
        path: RemoteGamesPage.route,
        builder: (context, state) => const RemoteGamesPage(),
        routes: [
          GoRoute(
            name: 'favorites',
            path: FavoritesGamesPage.route,
            builder: (context, state) => const FavoritesGamesPage(),
          ),
        ],
      ),
    ],
  );

  GoRouter get router => _router;
}
