import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rawg_clean/features/games/domain/entities/game_entity.dart';
import 'package:rawg_clean/features/games/domain/usecases/get_local_games_usecase.dart';
import 'package:rawg_clean/features/games/domain/usecases/remove_local_games_usecase.dart';
import 'package:rawg_clean/features/games/domain/usecases/save_local_games_usecase.dart';

part 'local_games_event.dart';
part 'local_games_state.dart';

class LocalGamesBloc extends Bloc<LocalGamesEvent, LocalGamesState> {
  LocalGamesBloc(
    this._getLocalGamesUseCase,
    this._removeLocalGamesUseCase,
    this._saveLocalGamesUseCase,
  ) : super(const LoadingLocalGamesState()) {
    on<GetSavedGames>(_onGetGames);
    on<RemoveGame>(_onRemoveGame);
    on<SaveGame>(_onSaveGame);
  }

  final GetLocalGamesUseCase _getLocalGamesUseCase;
  final RemoveLocalGamesUseCase _removeLocalGamesUseCase;
  final SaveLocalGamesUseCase _saveLocalGamesUseCase;

  Future<void> _onGetGames(GetSavedGames event, Emitter<LocalGamesState> emit) async {
    final localGames = await _getLocalGamesUseCase();
    emit(SuccessLocalGamesState(games: localGames));
  }

  Future<void> _onRemoveGame(RemoveGame removeGame, Emitter<LocalGamesState> emit) async {
    await _removeLocalGamesUseCase(params: removeGame.game);
    final games = await _getLocalGamesUseCase();
    emit(SuccessLocalGamesState(games: games));
  }

  Future<void> _onSaveGame(SaveGame saveGame, Emitter<LocalGamesState> emit) async {
    await _saveLocalGamesUseCase(params: saveGame.game);
    final games = await _getLocalGamesUseCase();
    emit(SuccessLocalGamesState(games: games));
  }
}
