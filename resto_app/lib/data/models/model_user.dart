class UserProfile {
  final String username;

  UserProfile({
    required this.username,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        username: json['username'],
      );
}
