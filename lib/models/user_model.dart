class UserModel {
  final String uid;
  final String userName;
  final String phoneNum;
  final String email;
  final String password;

  UserModel(
      {required this.uid,
      required this.userName,
      required this.phoneNum,
      required this.email,
      required this.password});

  factory UserModel.fromMap(map) => UserModel(
      uid: map['uid'] ?? '',
      userName: map['userName'] ?? '',
      phoneNum: map['phoneNum'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '');

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'userName': userName,
      'phoneNum': phoneNum,
      'email': email,
      'password': password
    };
  }
}
