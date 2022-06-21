class User {
  int? id;
  String name, email, password, mobile;
  User(this.name, this.email, this.password, this.mobile);
  toUserMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'mobile': mobile,
    };
  }

  User.fromMap(Map<String, dynamic> c)
      : name = c["name"],
        email = c["email"],
        password = c['password'],
        mobile = c['mobile'];

  // Map<String, Object?> toMap() {
  //   return {
  //     'id': id,
  //     'name': name,
  //     'email': email,
  //     'password': password,
  //     'mobile': mobile
  //   };
  // }
}
