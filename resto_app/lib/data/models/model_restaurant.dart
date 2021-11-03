import 'model_category.dart';
import 'model_customer_review.dart';
import 'model_menu.dart';

class Restaurant {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;
  late String address;
  late Menu menus;
  late List<Category> category;
  late List<CustomerReviews> customerReviews;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
  });

  Restaurant.detailRestaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.address,
    required this.category,
    required this.menus,
    required this.customerReviews,
  });

  factory Restaurant.fromAllRestaurantJson(Map<String, dynamic> json) =>
      Restaurant(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        pictureId: json['pictureId'],
        city: json['city'],
        rating: (json['rating'] as num).toDouble(),
      );

  factory Restaurant.fromDetailRestaurantJson(Map<String, dynamic> json) =>
      Restaurant.detailRestaurant(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        city: json['city'],
        address: json['address'],
        pictureId: json['pictureId'],
        category: (json['categories'] as List<dynamic>)
            .map(
              (customerReview) => Category.fromJson(
                customerReview as Map<String, dynamic>,
              ),
            )
            .toList(),
        menus: Menu.fromJson(json['menus'] as Map<String, dynamic>),
        rating: (json['rating'] as num).toDouble(),
        customerReviews: (json['customerReviews'] as List<dynamic>)
            .map(
              (customerReview) => CustomerReviews.fromJson(
                customerReview as Map<String, dynamic>,
              ),
            )
            .toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'description': description,
        'pictureId': pictureId,
        'city': city,
        'rating': rating,
      };

  Map<String, dynamic> detailRestotoJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'description': description,
        'city': city,
        'address': address,
        'pictureId': pictureId,
        'categories': category.map((element) => element.toJson()).toList(),
        'menus': menus.toJson(),
        'rating': rating,
        'customerReviews':
            customerReviews.map((element) => element.toJson()).toList(),
      };
}
