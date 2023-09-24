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

import '../../../../../helpers/test_helper.mocks.dart';

@GenerateMocks([GamesDataSource])
void main() {
  const responsePayload = PaginationModel<GameModel>(
    count: 853138,
    next: 'https://api.rawg.io/api/games?key=7e475ba564e14a53a1b42d6f5cb6be06&page=2&page_size=10',
    previous: null,
    results: [],
  );

  final HttpResponse<PaginationModel<GameModel>> successFetchPostResponse = HttpResponse<PaginationModel<GameModel>>(
    responsePayload,
    dio.Response<dynamic>(
      statusCode: HttpStatus.ok,
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
        // arrange

        // act
        () async {
          when(service.getGames()).thenAnswer(
            (realInvocation) async => Future.value(successFetchPostResponse),
          );
          // assert
          expect(await service.getGames(), successFetchPostResponse);
        },
      );

      test(
        'with parameters',
        () async {
          // arrange

          // act
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

          // assert
          expect(
            await service.getGames(
              apiKey: 'xxx',
              pageSize: 10,
              page: 1,
              search: 'gear of war',
            ),
            successFetchPostResponse,
          );
        },
      );
    });

    test(
      'should return server failure when a call to data source is unsuccessful',
      () async {
        // arrange

        // act
        when(service.getGames()).thenThrow(
          (_) async => dio.Response<dynamic>(
            statusCode: HttpStatus.notFound,
            requestOptions: dio.RequestOptions(path: ''),
          ),
        );

        // assert
        throwsA(const TypeMatcher<dio.DioException>());
      },
    );
  });
}
