class Note {
  final String id;
  final String title;
  final String body;
  final String dateTime;
  final int color;

  /// All property is required
  Note({
    required this.id,
    required this.title,
    required this.body,
    required this.dateTime,
    required this.color,
  });

  /// Convert a Note Map into Note Object
  factory Note.fromMap(Map<String, dynamic> res) => Note(
        id: res['id'],
        title: res['title'],
        body: res['body'],
        dateTime: res['dateTime'],
        color: res['color'],
      );

  /// Convert a Note into a Map, The keys must correspond to the names of the
  /// columns in the database.
  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'body': body,
        'dateTime': dateTime,
        'color': color,
      };

  @override
  String toString() {
    return 'Note(id: $id, title: $title, body: $body, dateTime: $dateTime, color: $color)';
  }
}
