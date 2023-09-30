import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rawg_clean/features/games/data/datasources/remote/games_api_service.dart';
import 'package:rawg_clean/features/games/data/models/game_model.dart';
import 'package:rawg_clean/features/games/data/models/pagination_model.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../helpers/constants/models.dart';
import '../../../../../helpers/test_helper.mocks.dart';

@GenerateMocks([GamesDataSource])
void main() {
  final HttpResponse<PaginationModel<GameModel>> successFetchPostResponse = HttpResponse<PaginationModel<GameModel>>(
    paginationModel,
    dio.Response<dynamic>(
      statusCode: HttpStatus.ok,
      requestOptions: dio.RequestOptions(path: ''),
    ),
  );

  final HttpResponse<PaginationModel<GameModel>> failureFetchPostResponse = HttpResponse<PaginationModel<GameModel>>(
    paginationModelCopy,
    dio.Response<dynamic>(
      statusCode: HttpStatus.notFound,
      requestOptions: dio.RequestOptions(path: ''),
    ),
  );

  group('GamesDataSource', () {
    late GamesDataSource service;
    setUp(() {
      service = MockGamesDataSource();
    });

    group('should return gamse when a call to data source is successful', () {
      test(
        'without parameters',
        () async {
          // arrange
          when(service.getGames()).thenAnswer(
            (realInvocation) async => Future.value(successFetchPostResponse),
          );

          // act
          final response = await service.getGames();

          // assert
          expect(response, successFetchPostResponse);
        },
      );

      test(
        'with parameters',
        () async {
          // arrange
          when(
            service.getGames(
              apiKey: 'xxx',
              pageSize: 10,
              page: 1,
              search: 'gear of war',
            ),
          ).thenAnswer(
            (realInvocation) async => Future.value(successFetchPostResponse),
          );

          // act
          final response = await service.getGames(
            apiKey: 'xxx',
            pageSize: 10,
            page: 1,
            search: 'gear of war',
          );

          // assert
          expect(response, successFetchPostResponse);
        },
      );
    });

    test(
      'should return server failure when a call to data source is unsuccessful',
      () async {
        // arrange
        when(service.getGames()).thenAnswer(
          (realInvocation) async => Future.value(failureFetchPostResponse),
        );

        // act
        final response = await service.getGames();

        // assert
        expect(response, failureFetchPostResponse);
        expect(response.response.statusCode, 404);
      },
    );
  });
}
