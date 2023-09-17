import 'package:dio/dio.dart';
import 'package:rawg_clean/core/constants/constants.dart';
import 'package:rawg_clean/features/games/data/models/game_model.dart';
import 'package:rawg_clean/features/games/data/models/pagination_model.dart';
import 'package:retrofit/retrofit.dart';

part 'games_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class GamesDataSource {
  factory GamesDataSource(Dio dio) = _GamesDataSource;

  @GET('/games')
  Future<HttpResponse<PaginationModel<GameModel>>> getGames({
    @Query('key') String? apiKey,
    @Query('page_size') int? pageSize,
    @Query('page') int? page,
    @Query('search') String? search,
  });
}
