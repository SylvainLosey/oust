class User {
  final String token;
  final int id;
  final String email;

  User({this.token, this.id, this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    print('${json['token']} ${json['id']} ${json['email']}');
    return User(
      token: json['token'],
      id: json['id'],
      email: json['email']
    );
  }
}