import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:resto_app/data/models/model_restaurant.dart';
import 'package:resto_app/common/custom_error_handling.dart';

class DatabaseHelper {
  static DatabaseHelper? _instance;
  static final _firestore = FirebaseFirestore.instance;
  static late String _title;
  static late String _message;

  DatabaseHelper._internal() {
    _instance = this;
  }

  factory DatabaseHelper() => _instance ?? DatabaseHelper._internal();

  Future<Either<RestoAppException, dynamic>> addUserProfile({
    required String username,
    required String uid,
  }) async {
    try {
      await _firestore.collection('users').doc(uid).set({
        "username": username,
        "favoritesRestaurant": [],
      });
      return Right(null);
    } on FirebaseException catch (error) {
      _title = 'Database Error';
      _message = error.message!;
    }
    return Left(RestoAppException(title: _title, message: _message));
  }

  Future<Either<RestoAppException, Map<String, dynamic>>> readUserProfile(
      {required String uid}) async {
    try {
      var userProfile = await _firestore.collection('users').doc(uid).get();
      return Right(userProfile.data()!);
    } on FirebaseException catch (error) {
      _title = 'Database Error';
      _message = error.message!;
    }
    return Left(RestoAppException(title: _title, message: _message));
  }

  Future<Either<RestoAppException, dynamic>> insertRestaurant({
    required Restaurant restaurant,
    required String uid,
  }) async {
    try {
      _firestore.collection('users').doc(uid).update({
        'favoritesRestaurant': FieldValue.arrayUnion([
          restaurant.toJson(),
        ]),
      });
      return Right(null);
    } on FirebaseException catch (error) {
      _title = 'Database Error';
      _message = error.message!;
    }
    return Left(RestoAppException(title: _title, message: _message));
  }

  Future<Either<RestoAppException, dynamic>> removeFavoritesResto({
    required Restaurant restaurant,
    required String uid,
  }) async {
    try {
      await _firestore.collection('users').doc(uid).update({
        "favoritesRestaurant": FieldValue.arrayRemove([
          restaurant.toJson(),
        ])
      });

      return Right(null);
    } on FirebaseException catch (error) {
      _title = 'Database Error';
      _message = error.message!;
    }
    return Left(RestoAppException(title: _title, message: _message));
  }

  Future<Either<RestoAppException, bool>> readRestoById({
    required String uid,
    required String id,
  }) async {
    try {
      var userProfile = await _firestore.collection('users').doc(uid).get();
      var data = (userProfile.data()!['favoritesRestaurant'] as List<dynamic>)
          .map((element) =>
              Restaurant.fromAllRestaurantJson(element as Map<String, dynamic>))
          .toList();
      data = data.where((element) => element.id == id).toList();
      return Right(data.isNotEmpty);
    } on FirebaseException catch (error) {
      _title = 'Database Error';
      _message = error.message!;
    }
    return Left(RestoAppException(title: _title, message: _message));
  }

  Either<RestoAppException, Stream<DocumentSnapshot<Map<String, dynamic>>>>
      readFavoritesResto({
    required String uid,
  }) {
    try {
      var streamData = _firestore.collection('users').doc(uid).snapshots();
      return Right(streamData);
    } on FirebaseException catch (error) {
      _title = 'Database Error';
      _message = error.message!;
    }
    return Left(RestoAppException(title: _title, message: _message));
  }
}
