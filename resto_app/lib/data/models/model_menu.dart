import 'model_detail_menu.dart';

class Menu {
  final List<DetailMenu> foods;
  final List<DetailMenu> drinks;

  Menu({
    required this.foods,
    required this.drinks,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        foods: (json['foods'] as List<dynamic>)
            .map((food) => DetailMenu.fromJson(food as Map<String, dynamic>))
            .toList(),
        drinks: (json['drinks'] as List<dynamic>)
            .map((drink) => DetailMenu.fromJson(drink as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'foods': foods.map((element) => element.toJson()).toList(),
        'drinks': drinks.map((element) => element.toJson()).toList(),
      };
}
