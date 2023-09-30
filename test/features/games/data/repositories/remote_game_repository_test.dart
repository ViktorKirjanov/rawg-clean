import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rawg_clean/core/constants/constants.dart';
import 'package:rawg_clean/core/errors/failure.dart';
import 'package:rawg_clean/features/games/data/models/game_model.dart';
import 'package:rawg_clean/features/games/data/models/pagination_model.dart';
import 'package:rawg_clean/features/games/data/repositories/remote_game_repository_impl.dart';
import 'package:rawg_clean/features/games/domain/entities/game_entity.dart';
import 'package:rawg_clean/features/games/domain/entities/pagination_entity.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../helpers/constants/models.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockGamesDataSource mockGamesDataSource;
  late RemoteGameRepositoryImpl remoteGameRepositoryImpl;

  final HttpResponse<PaginationModel<GameModel>> successResponseModel = HttpResponse<PaginationModel<GameModel>>(
    paginationModel,
    dio.Response<dynamic>(
      statusCode: HttpStatus.ok,
      requestOptions: dio.RequestOptions(path: ''),
    ),
  );

  setUp(() {
    mockGamesDataSource = MockGamesDataSource();
    remoteGameRepositoryImpl = RemoteGameRepositoryImpl(mockGamesDataSource);
  });

  group('RemoteGameRepositoryImpl', () {
    test(
      'should return list of games when a call to data source is successful',
      () async {
        // arrange
        when(
          mockGamesDataSource.getGames(
            apiKey: apiKey,
            pageSize: 1000,
            page: 1,
            search: null,
          ),
        ).thenAnswer((_) async => successResponseModel);

        // act
        final result = await remoteGameRepositoryImpl.getGames(1, null);

        // assert
        expect(
          result,
          equals(
            const Right<Failure, PaginationEntity<GameEntity>>(paginationModel),
          ),
        );
      },
    );

    test(
      'should return server failure when a call to data source is unsuccessful',
      () async {
        // arrange
        when(
          mockGamesDataSource.getGames(
            apiKey: apiKey,
            pageSize: 1000,
            page: 1,
            search: null,
          ),
        ).thenThrow(
          dio.DioException(
            type: dio.DioExceptionType.badResponse,
            requestOptions: dio.RequestOptions(),
          ),
        );

        // act
        final result = await remoteGameRepositoryImpl.getGames(1, null);

        // assert
        expect(
          result,
          equals(
            const Left<Failure, PaginationEntity<GameEntity>>(ServerFailure('Oops, something went wrong')),
          ),
        );
      },
    );

    test(
      'should return connection failure when the device has no internet',
      () async {
        // arrange
        when(
          mockGamesDataSource.getGames(
            apiKey: apiKey,
            pageSize: 1000,
            page: 1,
            search: null,
          ),
        ).thenThrow(
          const SocketException('Failed to connect to the network'),
        );

        // act
        final result = await remoteGameRepositoryImpl.getGames(1, null);

        // assert
        expect(
          result,
          equals(
            const Left<Failure, PaginationEntity<GameEntity>>(ConnectionFailure('Failed to connect to the network')),
          ),
        );
      },
    );
  });
}
