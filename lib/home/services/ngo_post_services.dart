import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:volunteers_connect/common/errorHandling.dart';
import 'package:volunteers_connect/common/shared_preferences_file.dart';
import 'package:volunteers_connect/common/utils.dart';
import 'package:volunteers_connect/models/post_model.dart';

class NGOPostServices {
  static final NGOPostServices _instance = NGOPostServices._internal();
  factory NGOPostServices() {
    return _instance;
  }
  NGOPostServices._internal();
  Future<void> addPost(
      {required String postType,
      required String name,
      required String id,
      PlatformFile? image,
      String? profileUrl,
      required String date,
      required String time,
      required String message,
      required String senderId,
      required BuildContext context}) async {
    try {
      debugPrint('came here for api call in NGOPostServices');
      String? imageurl;
      if (image != null) {
        final cloudinary = CloudinaryPublic('dlbvsohjy', 'ztfh6085');
        CloudinaryResponse res = await cloudinary
            .uploadFile(CloudinaryFile.fromFile(image.path!, folder: id));
        imageurl = res.secureUrl;
        debugPrint(imageurl);
      }
      String? token = await LocalStorage.getString(tokenKey);
      PostModel postModel = PostModel(
          postType: postType,
          name: name,
          date: date,
          time: time,
          message: message,
          senderId: senderId,
          imageUrl: imageurl,
          profileUrl: profileUrl);
      http.Response res = await http.post(Uri.parse('$uri/api/post/addPost'),
          headers: getHeaderWithToken(token!), body: postModel.toJson());
      // ignore: use_build_context_synchronously
      httpErrorHandling(
          context: context,
          response: res,
          onSuccess: () {
            showSnackbar(context, 'post Successful');
          });
    } catch (e) {
      debugPrint("This is the error from the addPosts");

      debugPrint(e.toString());
    }
  }

  Future<List<PostModel>> getPosts({required BuildContext context}) async {
    String? token = await LocalStorage.getString(tokenKey);
    List<PostModel> postModel = [];
    http.Response res = await http.get(Uri.parse('$uri/api/post/getPosts'),
        headers: getHeaderWithToken(token!));
    // ignore: use_build_context_synchronously
    httpErrorHandling(
        context: context,
        response: res,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            postModel
                .add(PostModel.fromJson(jsonEncode(jsonDecode(res.body)[i])));
          }
        });
    return postModel;
  }
}
