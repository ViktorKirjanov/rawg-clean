import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rawg_clean/core/enums/submission_status_enum.dart';
import 'package:rawg_clean/features/games/domain/entities/game_entity.dart';
import 'package:rawg_clean/features/games/domain/usecases/get_local_games_usecase.dart';
import 'package:rawg_clean/features/games/domain/usecases/remove_local_games_usecase.dart';
import 'package:rawg_clean/features/games/domain/usecases/save_local_games_usecase.dart';

part 'favorite_games_event.dart';
part 'favorite_games_state.dart';

class FavoriteGamesBloc extends Bloc<FavoriteGamesEvent, FavoriteGamesState> {
  FavoriteGamesBloc(
    this._getLocalGamesUseCase,
    this._removeLocalGamesUseCase,
    this._saveLocalGamesUseCase,
  ) : super(const FavoriteGamesState()) {
    on<GetSavedGames>(_onGetGames);
    on<RemoveGame>(_onRemoveGame);
    on<SaveGame>(_onSaveGame);
  }

  final GetLocalGamesUseCase _getLocalGamesUseCase;
  final RemoveLocalGamesUseCase _removeLocalGamesUseCase;
  final SaveLocalGamesUseCase _saveLocalGamesUseCase;

  Future<void> _onGetGames(GetSavedGames event, Emitter<FavoriteGamesState> emit) async {
    emit(state.copyWith(status: SubmissionStatus.inProgress));
    final failureOrResponse = await _getLocalGamesUseCase();
    failureOrResponse.fold(
      (failure) => emit(
        state.copyWith(
          status: SubmissionStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (games) => emit(
        state.copyWith(
          status: SubmissionStatus.success,
          games: games,
        ),
      ),
    );
  }

  Future<void> _onRemoveGame(RemoveGame removeGame, Emitter<FavoriteGamesState> emit) async {
    emit(state.copyWith(status: SubmissionStatus.inProgress));
    final failureOrResponseOnRemove = await _removeLocalGamesUseCase(game: removeGame.game);
    await failureOrResponseOnRemove.fold(
      (failure) async => emit(
        state.copyWith(
          status: SubmissionStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (_) async {
        final failureOrResponseGetGames = await _getLocalGamesUseCase();
        failureOrResponseGetGames.fold(
          (failure) => emit(
            state.copyWith(
              status: SubmissionStatus.failure,
              errorMessage: failure.message,
            ),
          ),
          (games) => emit(
            state.copyWith(
              status: SubmissionStatus.success,
              games: games,
            ),
          ),
        );
      },
    );
  }

  Future<void> _onSaveGame(SaveGame saveGame, Emitter<FavoriteGamesState> emit) async {
    emit(state.copyWith(status: SubmissionStatus.inProgress));
    final failureOrResponseOnSave = await _saveLocalGamesUseCase(game: saveGame.game);
    await failureOrResponseOnSave.fold(
      (failure) async => emit(
        state.copyWith(
          status: SubmissionStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (_) async {
        final failureOrResponseGetGames = await _getLocalGamesUseCase();
        failureOrResponseGetGames.fold(
          (failure) async => emit(
            state.copyWith(
              status: SubmissionStatus.failure,
              errorMessage: failure.message,
            ),
          ),
          (games) => emit(
            state.copyWith(
              status: SubmissionStatus.success,
              games: games,
            ),
          ),
        );
      },
    );
  }
}
