// ignore: file_names
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volunteers_connect/models/userModel.dart';

class UserNotifier extends StateNotifier<UserModel?> {
  UserNotifier()
      // : super(UserModel(id: '', username: '', email: '', password: ''));
      : super(null);

UserModel? get user => state;

  void setUser(UserModel userModel) {
    state = userModel;
  }
}

final userProvider =
    StateNotifierProvider<UserNotifier, UserModel?>(((ref) => UserNotifier()));
