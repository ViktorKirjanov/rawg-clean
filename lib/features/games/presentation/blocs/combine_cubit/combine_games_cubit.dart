import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rawg_clean/core/enums/submission_status_enum.dart';
import 'package:rawg_clean/features/games/presentation/blocs/games/local_games_bloc/favorite_games_bloc.dart';
import 'package:rawg_clean/features/games/presentation/blocs/games/remote_games_bloc/remote_games_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'combine_games_state.dart';

class CombineGamesCubit extends Cubit<CombineGamesState> {
  CombineGamesCubit(
    this._remoteGamesBloc,
    this._favoriteGamesBloc,
  ) : super(const CombineGamesState());

  final RemoteGamesBloc _remoteGamesBloc;
  final FavoriteGamesBloc _favoriteGamesBloc;

  Future<void> getData([bool isRefresh = false]) async {
    if (state.status != SubmissionStatus.success || isRefresh) {
      emit(state.copyWith(status: SubmissionStatus.inProgress));
      _remoteGamesBloc.add(const GetFirstPage());
      _favoriteGamesBloc.add(const GetSavedGames());

      Rx.combineLatest2(
        _remoteGamesBloc.stream,
        _favoriteGamesBloc.stream,
        (
          remoteGamesState,
          localGamesState,
        ) =>
            {
          if (state.status != SubmissionStatus.success)
            {
              if (remoteGamesState.status.isSuccess && localGamesState.status.isSuccess)
                emit(state.copyWith(status: SubmissionStatus.success))
              else if (remoteGamesState.status.isInProgress || localGamesState.status.isInProgress)
                emit(state.copyWith(status: SubmissionStatus.inProgress))
              else if (remoteGamesState.status.isFailure && state.status != SubmissionStatus.failure)
                emit(
                  state.copyWith(
                    status: SubmissionStatus.failure,
                    errorMessage: remoteGamesState.errorMessage,
                  ),
                )
              else if (localGamesState.status.isFailure && state.status != SubmissionStatus.failure)
                emit(
                  state.copyWith(
                    status: SubmissionStatus.failure,
                    errorMessage: localGamesState.errorMessage,
                  ),
                ),
            },
        },
      ).listen((_) {});
    }
  }
}
