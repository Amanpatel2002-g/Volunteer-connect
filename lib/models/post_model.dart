// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PostModel {
  final String postType;
  final String name;
  String? profileUrl;
  final String date;
  final String time;
  String? imageUrl;
  final String message;
  final String senderId;
  PostModel({
    required this.postType,
    required this.name,
    this.profileUrl,
    required this.date,
    required this.time,
    this.imageUrl,
    required this.message,
    required this.senderId,
  });

  PostModel copyWith({
    String? postType,
    String? name,
    String? profileUrl,
    String? date,
    String? time,
    String? imageUrl,
    String? message,
    String? senderId,
  }) {
    return PostModel(
      postType: postType ?? this.postType,
      name: name ?? this.name,
      profileUrl: profileUrl ?? this.profileUrl,
      date: date ?? this.date,
      time: time ?? this.time,
      imageUrl: imageUrl ?? this.imageUrl,
      message: message ?? this.message,
      senderId: senderId ?? this.senderId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'postType': postType,
      'name': name,
      'profileUrl': profileUrl,
      'date': date,
      'time': time,
      'imageUrl': imageUrl,
      'message': message,
      'senderId': senderId,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      postType: map['postType'] as String,
      name: map['name'] as String,
      profileUrl: map['profileUrl'] != null ? map['profileUrl'] as String : null,
      date: map['date'] as String,
      time: map['time'] as String,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      message: map['message'] as String,
      senderId: map['senderId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PostModel(postType: $postType, name: $name, profileUrl: $profileUrl, date: $date, time: $time, imageUrl: $imageUrl, message: $message, senderId: $senderId)';
  }

  @override
  bool operator ==(covariant PostModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.postType == postType &&
      other.name == name &&
      other.profileUrl == profileUrl &&
      other.date == date &&
      other.time == time &&
      other.imageUrl == imageUrl &&
      other.message == message &&
      other.senderId == senderId;
  }

  @override
  int get hashCode {
    return postType.hashCode ^
      name.hashCode ^
      profileUrl.hashCode ^
      date.hashCode ^
      time.hashCode ^
      imageUrl.hashCode ^
      message.hashCode ^
      senderId.hashCode;
  }
}
