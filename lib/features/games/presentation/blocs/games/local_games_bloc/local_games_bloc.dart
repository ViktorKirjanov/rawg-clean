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
    emit(const LoadingLocalGamesState());
    final failureOrResponse = await _getLocalGamesUseCase();
    failureOrResponse.fold(
      (failure) => emit(FailedLocalGamesState(failure.message)),
      (games) => emit(SuccessLocalGamesState(games: games)),
    );
  }

  Future<void> _onRemoveGame(RemoveGame removeGame, Emitter<LocalGamesState> emit) async {
    final failureOrResponseOnRemove = await _removeLocalGamesUseCase(game: removeGame.game);
    await failureOrResponseOnRemove.fold(
      (failure) async => emit(FailedLocalGamesState(failure.message)),
      (_) async {
        final failureOrResponseGetGames = await _getLocalGamesUseCase();
        failureOrResponseGetGames.fold(
          (failure) => emit(FailedLocalGamesState(failure.message)),
          (games) => emit(SuccessLocalGamesState(games: games)),
        );
      },
    );
  }

  Future<void> _onSaveGame(SaveGame saveGame, Emitter<LocalGamesState> emit) async {
    final failureOrResponseOnSave = await _saveLocalGamesUseCase(game: saveGame.game);
    await failureOrResponseOnSave.fold(
      (failure) async => emit(FailedLocalGamesState(failure.message)),
      (_) async {
        final failureOrResponseGetGames = await _getLocalGamesUseCase();
        failureOrResponseGetGames.fold(
          (failure) async => emit(FailedLocalGamesState(failure.message)),
          (games) => emit(SuccessLocalGamesState(games: games)),
        );
      },
    );
  }
}
