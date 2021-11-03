class CustomerReviews {
  late String id;
  String name;
  String review;
  late String date;

  CustomerReviews({
    required this.name,
    required this.review,
    required this.date,
  });

  CustomerReviews.post({
    required this.id,
    required this.name,
    required this.review,
  });

  factory CustomerReviews.fromJson(Map<String, dynamic> json) =>
      CustomerReviews(
        name: json['name'],
        review: json['review'],
        date: json['date'],
      );

  Map<String, dynamic> postToJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'review': review,
      };

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'review': review,
        'date': date,
      };
}
