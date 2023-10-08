import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rawg_clean/core/enums/submission_status_enum.dart';
import 'package:rawg_clean/features/games/domain/entities/game_entity.dart';
import 'package:rawg_clean/features/games/domain/usecases/get_remote_games_usecase.dart';

part 'remote_games_event.dart';
part 'remote_games_state.dart';

class RemoteGamesBloc extends Bloc<RemoteGamesEvent, RemoteGamesState> {
  RemoteGamesBloc(this._getRemoteGamesUseCase) : super(const RemoteGamesState()) {
    on<AddSearch>(
      _onAddSearch,
      transformer: restartable(),
    );

    on<GetFirstPage>(
      _onGetFirstPage,
      transformer: restartable(),
    );

    on<GetNextPage>(
      _onGetNextPage,
      transformer: restartable(),
    );

    on<GetGames>(
      _onGetGames,
      transformer: restartable(),
    );
  }

  final GetRemoteGamesUseCase _getRemoteGamesUseCase;

  Future<void> _onAddSearch(
    AddSearch event,
    Emitter<RemoteGamesState> emit,
  ) async {
    emit(state.copyWith(search: () => event.search));
  }

  Future<void> _onGetFirstPage(
    GetFirstPage event,
    Emitter<RemoteGamesState> emit,
  ) async {
    emit(
      state.copyWith(
        status: SubmissionStatus.inProgress,
        page: 1,
        games: [],
      ),
    );
    add(GetGames(1, event.reset));
  }

  Future<void> _onGetNextPage(
    GetNextPage event,
    Emitter<RemoteGamesState> emit,
  ) async {
    final nextPage = state.page + 1;
    add(GetGames(nextPage, false));
  }

  Future<void> _onGetGames(
    GetGames event,
    Emitter<RemoteGamesState> emit,
  ) async {
    emit(
      state.copyWith(
        status: SubmissionStatus.inProgress,
        hasMorePages: false,
      ),
    );

    final failureOrResponse = await _getRemoteGamesUseCase(
      event.page,
      state.search,
    );

    failureOrResponse.fold(
      (failure) {
        emit(
          state.copyWith(
            errorMessage: failure.message,
            status: SubmissionStatus.failure,
          ),
        );
      },
      (response) {
        late List<GameEntity> updatedList;
        if (event.page == 1) {
          updatedList = response.results!;
        } else {
          updatedList = [...state.games, ...response.results!];
        }

        emit(
          state.copyWith(
            games: updatedList,
            page: event.page,
            status: SubmissionStatus.success,
            hasMorePages: response.next != null,
          ),
        );
      },
    );
  }
}
