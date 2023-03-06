import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:volunteers_connect/common/utils.dart';
import 'package:volunteers_connect/home/screens/ngo_home.dart';
import 'package:volunteers_connect/home/services/ngo_post_services.dart';
import 'package:volunteers_connect/providers/ngo_provider.dart';

// ignore: must_be_immutable
class NGOPostAddPage extends ConsumerStatefulWidget {
  const NGOPostAddPage({super.key});
  static const String routeName = '/NGOPostAddPage';
  @override
  ConsumerState<NGOPostAddPage> createState() => _NGOPostAddPageState();
}

class _NGOPostAddPageState extends ConsumerState<NGOPostAddPage> {
  @override
  void dispose() {
    super.dispose();
  }

  TextEditingController postTextEditingController = TextEditingController();
  PlatformFile? file;
  DateTime selectedDate = DateTime.now();
  void cameraOnPressed() async {
    file = await pickImage();
    setState(() {});
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: Keys.scaffoldKey,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Container(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () => SchedulerBinding.instance
                              .addPostFrameCallback((_) {
                            Navigator.of(Keys.scaffoldKey.currentContext!)
                                .pushNamedAndRemoveUntil(
                                    NGOMainHomeScreen.routeName,
                                    (route) => false);
                          }),
                          icon: const Icon(
                            FontAwesomeIcons.xmark,
                            size: 30,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        IconButton(
                            onPressed: () {
                              cameraOnPressed();
                            },
                            icon: const Icon(FontAwesomeIcons.camera)),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            if (postTextEditingController.text.isNotEmpty) {
                              NGOPostServices()
                                  .addPost(
                                      image: file,
                                      id: ref.watch(NgoProvider)!.id,
                                      postType: PostType.ngo,
                                      name: ref.watch(NgoProvider)!.name,
                                      date: DateFormat('yyyy-MM-dd')
                                          .format(DateTime.now()),
                                      time: DateFormat.jm()
                                          .format(DateTime.now()),
                                      message: postTextEditingController.text,
                                      senderId: ref.watch(NgoProvider)!.id,
                                      context: context)
                                  .then((value) => Navigator.of(context)
                                      .pushNamedAndRemoveUntil(
                                          NGOMainHomeScreen.routeName,
                                          (route) => false));
                            } else {
                              showSnackbar(
                                  context, 'cant post the empty message');
                            }
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: HexColor("#0073e6")),
                          child: const Text(
                            'Post',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ),
                      ],
                    )),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: TextField(
                    controller: postTextEditingController,
                    decoration: const InputDecoration(
                        hintText: 'What do you want to talk about?',
                        hintStyle: TextStyle(fontSize: 20),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none),
                    style: const TextStyle(fontSize: 20),
                    autofocus: false,
                    maxLines: null,
                    keyboardType: TextInputType.text,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
