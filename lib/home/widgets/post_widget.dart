// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:volunteers_connect/home/widgets/complete_post_widget.dart';

class PostWidget extends StatelessWidget {
  final String name;
  final String date;
  final String time;
  String? profileUrl;
  String? imageUrl;
  final String message;
  PostWidget({
    Key? key,
    required this.name,
    required this.date,
    required this.time,
    this.profileUrl,
    this.imageUrl,
    required this.message,
  }) : super(key: key);
  final String postMessage =
      "As a Flutter software engineer, I am highly skilled in developing mobile applications using Flutter's powerful framework. My expertise in the Dart language allows me to build complex and efficient apps that are both responsive and scalable. I have experience creating cross-platform solutions for a range of industries, including healthcare, finance, and e-commerce. With my knowledge of Flutter, I can help you build high-quality apps that exceed your users' expectations and drive business growth. I stay up-to-date with the latest advancements in Flutter technology to ensure that my apps are always cutting-edge, and I utilize Flutter's hot reload feature to quickly iterate and test my code, resulting in a faster development process and higher-quality output.";
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height,
      // width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(8),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage:
                          profileUrl != null ? NetworkImage(profileUrl!) : null,
                      child: profileUrl != null
                          ? null
                          : const Icon(
                              Icons.person,
                              size: 40,
                            ),
                    ),
                  ),
                  const SizedBox(
                    width: 9,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Text(time),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(date),
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_vert,
                        size: 30,
                      )),
                  const SizedBox(
                    width: 10,
                  )
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              GestureDetector(
                onTap: () => Navigator.of(context)
                    .pushNamed(CompletePostWidget.routeName),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24.5),
                      child: Text(
                        message,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: imageUrl != null ? Image.network(imageUrl!) : null,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
