import 'package:resto_app/data/models/model_customer_review.dart';
import 'package:resto_app/data/models/model_detail_menu.dart';
import 'package:resto_app/data/models/model_restaurant.dart';
import 'package:resto_app/data/models/model_category.dart';
import 'package:resto_app/data/models/model_menu.dart';
import 'package:resto_app/data/api/api_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'api_service_test.mocks.dart';
import 'package:dartz/dartz.dart';
import 'dart:convert';

@GenerateMocks([http.Client])
void main() {
  final client = MockClient();
  group('API service unit testing', () {
    final String url = 'https://restaurant-api.dicoding.dev/';

    test('return Right data if success to fetch restaurants data', () async {
      when(client.get(Uri.parse(url + 'list')))
          .thenAnswer((_) async => http.Response(
                jsonEncode(
                  {
                    "restaurants": [
                      Restaurant(
                        id: '1',
                        name: 'mock',
                        description: 'mock',
                        pictureId: '11',
                        city: 'mock',
                        rating: 4.4,
                      ).toJson(),
                      Restaurant(
                        id: '2',
                        name: 'mock',
                        description: 'mock',
                        pictureId: '21',
                        city: 'mock',
                        rating: 4.4,
                      ).toJson(),
                    ]
                  },
                ),
                200,
              ));
      expect(await ApiService().getAllRestaurant(client), isA<Right>());
    });

    test('return Left if failed to fetch restaurants data', () async {
      when(client.get(Uri.parse(url + 'list')))
          .thenAnswer((_) async => http.Response(
                'Bad Request',
                400,
              ));
      expect(await ApiService().getAllRestaurant(client), isA<Left>());
    });

    test('return Right data if success to fetch detail restaurant data',
        () async {
      when(client.get(Uri.parse(url + 'detail/2')))
          .thenAnswer((_) async => http.Response(
                jsonEncode(
                  {
                    'restaurant': Restaurant.detailRestaurant(
                      id: '2',
                      name: 'mock',
                      description: 'mock',
                      pictureId: '22',
                      city: 'mock',
                      rating: 4.2,
                      address: 'mock',
                      category: [
                        Category(name: 'mock'),
                      ],
                      menus: Menu(
                        foods: [DetailMenu(name: 'mock')],
                        drinks: [DetailMenu(name: 'mock')],
                      ),
                      customerReviews: [
                        CustomerReviews(
                          name: 'mock',
                          review: 'mock',
                          date: DateTime.now().toString(),
                        )
                      ],
                    ).detailRestotoJson(),
                  },
                ),
                200,
              ));
      expect(await ApiService().getDetailRestaurant('2', client), isA<Right>());
    });

    test('return Left data if failed to fetch detail restaurant data',
        () async {
      when(client.get(Uri.parse(url + 'detail/10')))
          .thenAnswer((_) async => http.Response(
                'Not Found',
                404,
              ));
      expect(await ApiService().getDetailRestaurant('10', client), isA<Left>());
    });
  });
}
