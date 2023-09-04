import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rawg_clean/features/games/presentation/blocs/games/local_games_bloc/local_games_bloc.dart';
import 'package:rawg_clean/features/games/presentation/blocs/games/remote_bloc/remote_games_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'combine_games_state.dart';

class CombineGamesCubit extends Cubit<CombineGamesState> {
  CombineGamesCubit(
    this._remoteGamesBloc,
    this._localGamesBloc,
  ) : super(const CombineGamesState());

  final RemoteGamesBloc _remoteGamesBloc;
  final LocalGamesBloc _localGamesBloc;

  Future<void> getData([bool isRefresh = false]) async {
    if (state.status != SubmissionStatus.success || isRefresh) {
      emit(state.copyWith(status: SubmissionStatus.inProgress));
      _remoteGamesBloc.add(const GetGames());
      _localGamesBloc.add(const GetSavedGames());

      Rx.combineLatest2(
        _remoteGamesBloc.stream,
        _localGamesBloc.stream,
        (
          remoteGamesState,
          localGamesState,
        ) =>
            {
          if (state.status != SubmissionStatus.success)
            {
              if (remoteGamesState is SuccessRemoteGamesState && localGamesState is SuccessLocalGamesState)
                emit(state.copyWith(status: SubmissionStatus.success))
              else if (remoteGamesState is LoadingRemoteGamesState || localGamesState is LoadingLocalGamesState)
                emit(state.copyWith(status: SubmissionStatus.inProgress))
              else if (remoteGamesState is FailedRemoteGamesState && state.status != SubmissionStatus.failure)
                emit(
                  state.copyWith(
                    status: SubmissionStatus.failure,
                    // errorMessage: remoteGamesState.errorMessage,
                  ),
                )
              else if (localGamesState is FailedLocalGamesState && state.status != SubmissionStatus.failure)
                emit(
                  state.copyWith(
                    status: SubmissionStatus.failure,
                    // errorMessage: localGamesState.errorMessage,
                  ),
                ),
            },
        },
      ).listen((_) {});
    }
  }
}
