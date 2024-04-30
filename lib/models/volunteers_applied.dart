// ignore: file_names
import 'dart:convert';


// ignore_for_file: public_member_api_docs, sort_constructors_first
class VolunteerApplied {
  final String username;
  final String email;
  final String password;
  final String id;
  String?profilePic;
  String? address;
  String? mobile;
  int? age;
  String? school;
  VolunteerApplied({
    required this.username,
    required this.email,
    required this.password,
    required this.id,
    this.profilePic,
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
      'address': address,
      'mobile': mobile,
      'age': age,
      'school': school,
      'profilePic': profilePic
    };
  }

  factory VolunteerApplied.fromMap(Map<String, dynamic> map) {
    return VolunteerApplied(
      username: map['username'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      id: map['_id'] as String,
      address: map['address'] != null ? map['address'] as String : null,
      mobile: map['mobile'] != null ? map['mobile'] as String : null,
      age: map['age'] != null ? map['age'] as int : null,
      school: map['school'] != null ? map['school'] as String : null,
      profilePic: map['profilePic']!=null?map['profilePic'] as String :null,
    );
  }

  String toJson() => json.encode(toMap());

  factory VolunteerApplied.fromJson(String source) =>
      VolunteerApplied.fromMap(json.decode(source) as Map<String, dynamic>);

  VolunteerApplied copyWith({
    String? username,
    String? email,
    String? password,
    String? id,
    String? address,
    String? mobile,
    int? age,
    String? school,
    String ? profilePic
  }) {
    return VolunteerApplied(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      id: id ?? this.id,
      address: address ?? this.address,
      mobile: mobile ?? this.mobile,
      age: age ?? this.age,
      school: school ?? this.school,
      profilePic: profilePic??this.profilePic,
    );
  }

  @override
  String toString() {
    return 'VolunteerApplied(username: $username, email: $email, password: $password, id: $id, address: $address, mobile: $mobile, age: $age, school: $school)';
  }

  @override
  bool operator ==(covariant VolunteerApplied other) {
    if (identical(this, other)) return true;
  
    return 
      other.username == username &&
      other.email == email &&
      other.password == password &&
      other.id == id &&
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
      address.hashCode ^
      mobile.hashCode ^
      age.hashCode ^
      school.hashCode;
  }
}
