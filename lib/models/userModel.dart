import 'dart:convert';

// import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final String username;
  final String email;
  final String password;
  final String id;
  final String token;
  String? address;
  String? mobile;
  int? age;
  String? school;
  UserModel({
    required this.username,
    required this.email,
    required this.password,
    required this.id,
    required this.token,
    this.address,
    this.mobile,
    this.age,
    this.school,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'email': email,
      'password': password,
      'id': id,
      'token': token,
      'address': address,
      'mobile': mobile,
      'age': age,
      'school': school,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      id: map['_id'] as String,
      token: map['token'] as String,
      address: map['address'] != null ? map['address'] as String : null,
      mobile: map['mobile'] != null ? map['mobile'] as String : null,
      age: map['age'] != null ? map['age'] as int : null,
      school: map['school'] != null ? map['school'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  UserModel copyWith({
    String? username,
    String? email,
    String? password,
    String? id,
    String? token,
    String? address,
    String? mobile,
    int? age,
    String? school,
  }) {
    return UserModel(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      id: id ?? this.id,
      token: token ?? this.token,
      address: address ?? this.address,
      mobile: mobile ?? this.mobile,
      age: age ?? this.age,
      school: school ?? this.school,
    );
  }

  @override
  String toString() {
    return 'UserModel(username: $username, email: $email, password: $password, id: $id, token: $token, address: $address, mobile: $mobile, age: $age, school: $school)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.username == username &&
      other.email == email &&
      other.password == password &&
      other.id == id &&
      other.token == token &&
      other.address == address &&
      other.mobile == mobile &&
      other.age == age &&
      other.school == school;
  }

  @override
  int get hashCode {
    return username.hashCode ^
      email.hashCode ^
      password.hashCode ^
      id.hashCode ^
      token.hashCode ^
      address.hashCode ^
      mobile.hashCode ^
      age.hashCode ^
      school.hashCode;
  }
}
