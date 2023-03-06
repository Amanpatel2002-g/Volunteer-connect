import 'package:flutter/material.dart';
import 'package:volunteers_connect/home/services/ngo_post_services.dart';
import 'package:volunteers_connect/home/widgets/post_widget.dart';
import 'package:volunteers_connect/models/post_model.dart';

class UserPostScreen extends StatelessWidget {
  const UserPostScreen({super.key});
  static const String routeName = '/UserPostScreen';
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PostModel>>(
      future: NGOPostServices().getPosts(context: context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            PostModel post = snapshot.data![index];
            return PostWidget(
              name: post.name,
              date: post.date,
              time: post.time,
              message: post.message,
              imageUrl: post.imageUrl,
              profileUrl: post.profileUrl,
            );
          },
        );
      },
    );
    // return
    // );
  }
}