import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:resto_app/data/models/model_customer_review.dart';
import 'package:resto_app/data/models/model_restaurant.dart';
import 'dart:io';

import 'package:resto_app/common/custom_error_handling.dart';

class ApiService {
  var _url = "https://restaurant-api.dicoding.dev/";
  List<Restaurant> _allRestaurant = [];
  String _title = '';
  String _message = '';
  late Restaurant _detailRestaurant;
  List<CustomerReviews> _customerReviews = [];

  Future<Either<RestoAppException, List<Restaurant>>> getAllRestaurant(
    http.Client client,
  ) async {
    try {
      var response = await client.get(Uri.parse(_url + 'list'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> parsed = jsonDecode(response.body);
        _allRestaurant = (parsed['restaurants'] as List<dynamic>)
            .map((element) => Restaurant.fromAllRestaurantJson(
                element as Map<String, dynamic>))
            .toList();
        return Right(_allRestaurant);
      } else if (response.statusCode == 404) {
        _title = 'Error 404';
        _message = "Sorry, couldn't find\nany food or restaurant";
      } else if (response.statusCode == 400) {
        _title = 'Error 400';
        _message = "There's problem\nwith url format";
      } else if (response.statusCode == 500) {
        _title = 'Error 500';
        _message = "Sorry, server has problem";
      }
    } on SocketException catch (_) {
      _title = 'Connected to the internet';
      _message = 'And reopen this app';
    }
    return Left(RestoAppException(title: _title, message: _message));
  }

  Future<Either<RestoAppException, Restaurant>> getDetailRestaurant(
    String id,
    http.Client client,
  ) async {
    try {
      var response = await client.get(Uri.parse(_url + 'detail/$id'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> parsed = jsonDecode(response.body);
        _detailRestaurant =
            Restaurant.fromDetailRestaurantJson(parsed['restaurant']);
        return Right(_detailRestaurant);
      } else if (response.statusCode == 404) {
        _title = 'Error 404';
        _message = "Sorry, couldn't find\nany food or restaurant";
      } else if (response.statusCode == 400) {
        _title = 'Error 400';
        _message = "There's problem\nwith url format";
      } else if (response.statusCode == 500) {
        _title = 'Error 500';
        _message = "Sorry, server has problem";
      }
    } on SocketException catch (_) {
      _title = 'Connected to the internet';
      _message = 'And reopen this page';
    }
    return Left(RestoAppException(title: _title, message: _message));
  }

  Future<Either<RestoAppException, List<Restaurant>>> getRestaurantBySearch(
    String keyword,
    http.Client client,
  ) async {
    try {
      var response = await http.get(
        Uri.parse('https://restaurant-api.dicoding.dev/search/?q=$keyword'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> parsed = jsonDecode(response.body);
        _allRestaurant = (parsed['restaurants'] as List<dynamic>)
            .map((element) => Restaurant.fromAllRestaurantJson(
                element as Map<String, dynamic>))
            .toList();
        return Right(_allRestaurant);
      } else if (response.statusCode == 404) {
        _title = 'Error 404';
        _message = "Sorry, couldn't find\nany food or restaurant";
      } else if (response.statusCode == 400) {
        _title = 'Error 400';
        _message = "There's problem\nwith url format";
      } else if (response.statusCode == 500) {
        _title = 'Error 500';
        _message = "Sorry, server has problem";
      }
    } on SocketException catch (_) {
      _title = 'Connected to the internet';
      _message = 'And reopen this page';
    }
    return Left(RestoAppException(title: _title, message: _message));
  }

  Future<Either<RestoAppException, List<CustomerReviews>>> postRestoReview(
    String id,
    String name,
    String review,
    http.Client client,
  ) async {
    try {
      var response = await http.post(
        Uri.parse('https://restaurant-api.dicoding.dev/review'),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'X-Auth-Token': '12345',
        },
        body: CustomerReviews.post(
          id: id,
          name: name.isEmpty ? 'anonim' : name,
          review: review,
        ).postToJson(),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> parsed = jsonDecode(response.body);
        _customerReviews = (parsed['customerReviews'] as List<dynamic>)
            .map((element) =>
                CustomerReviews.fromJson(element as Map<String, dynamic>))
            .toList();
        return Right(_customerReviews);
      } else if (response.statusCode == 404) {
        _title = 'Error 404';
        _message = "Sorry, couldn't find\nany food or restaurant";
      } else if (response.statusCode == 400) {
        _title = 'Error 400';
        _message = "Please check your username and review";
      } else if (response.statusCode == 500) {
        _title = 'Error 500';
        _message = "Sorry, server has problem, your review isn't posted";
      }
    } on SocketException catch (_) {
      _title = 'Connected to the internet';
      _message = 'And repost your review';
    }
    return Left(RestoAppException(title: _title, message: _message));
  }
}
