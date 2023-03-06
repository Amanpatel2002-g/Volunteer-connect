import 'package:flutter/material.dart';

import 'package:volunteers_connect/common/search_text_field.dart';
import 'package:volunteers_connect/home/screens/ngo_profile_page.dart';

TextEditingController _textEditingController = TextEditingController();
AppBar customAppBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Row(
      children: [
        GestureDetector(
          onTap: () =>
              Navigator.of(context).pushNamed(NGOProfilePage.routeName),
          child: const CircleAvatar(
            child: Icon(Icons.person),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.only(bottom: 3),
          child: SearchTextField(
              labelText: '',
              inputHintText: 'Search here',
              textEditingController: _textEditingController),
        )
      ],
    ),
    elevation: 1.5,
    backgroundColor: Colors.white,
  );
}
