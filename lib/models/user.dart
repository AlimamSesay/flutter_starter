class User {
  int id;
  bool loggedIn;
  String name;
  String firstName;
  String lastName;
  String username;
  String email;
  String password;
  String picture;
  String token;

  User.fromJson(Map<String, dynamic> json) {
    try {
      var user = json['user'];
      loggedIn = true;
      id = json['id'];
      name = user['name'];
      username = user['username'];
      token = json['token'];
      firstName = user["first_name"];
      lastName = user["last_name"];
      email = user["email"];
      picture = user["picture"]['data']['url'] ?? '';
    } catch (e) {
      print(e.toString());
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "loggedIn": loggedIn,
      "name": name,
      "firstName": firstName,
      "lastName": lastName,
      "username": username,
      "email": email,
      "password": password,
      "picture": picture,
      "token": token
    };
  }

  @override
  String toString() => 'User { username: $id $name $email}';
}
