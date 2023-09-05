import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rawg_clean/features/games/domain/entities/game_entity.dart';
import 'package:rawg_clean/features/games/domain/entities/pagination_entity.dart';
import 'package:rawg_clean/features/games/domain/usecases/get_games_usecase.dart';

part 'remote_games_event.dart';
part 'remote_games_state.dart';

class RemoteGamesBloc extends Bloc<RemoteGamesEvent, RemoteGamesState> {
  RemoteGamesBloc(this._getGamesUseCase) : super(const LoadingRemoteGamesState()) {
    on<GetGames>(_onGetGames);
  }

  final GetGamesUseCase _getGamesUseCase;

  Future<void> _onGetGames(GetGames event, Emitter<RemoteGamesState> emit) async {
    emit(const LoadingRemoteGamesState());
    final failureOrResponse = await _getGamesUseCase();
    failureOrResponse.fold(
      (failure) => emit(FailedRemoteGamesState(failure.message)),
      (data) => emit(SuccessRemoteGamesState(games: data)),
    );
  }
}
