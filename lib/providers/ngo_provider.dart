// ignore: file_names
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volunteers_connect/models/ngoModel.dart';

class NGONotifier extends StateNotifier<NGOModel?> {
  NGONotifier()
      // : super(UserModel(id: '', username: '', email: '', password: ''));
      : super(null);

NGOModel? get ngo => state;

  void setNGO(NGOModel ngoModel) {
    state = ngoModel;
  }
}

final NgoProvider =
    StateNotifierProvider<NGONotifier, NGOModel?>(((ref) => NGONotifier()));