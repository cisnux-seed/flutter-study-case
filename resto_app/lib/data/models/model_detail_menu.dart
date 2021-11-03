class DetailMenu {
  final String name;

  DetailMenu({required this.name});

  factory DetailMenu.fromJson(Map<String, dynamic> json) => DetailMenu(
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
      };
}
