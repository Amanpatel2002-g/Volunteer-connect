import 'package:flutter/material.dart';

class CompletePostWidget extends StatelessWidget {
  const CompletePostWidget({super.key});
  final String postMessage =
      "As a Flutter software engineer, I am highly skilled in developing mobile applications using Flutter's powerful framework. My expertise in the Dart language allows me to build complex and efficient apps that are both responsive and scalable. I have experience creating cross-platform solutions for a range of industries, including healthcare, finance, and e-commerce. With my knowledge of Flutter, I can help you build high-quality apps that exceed your users' expectations and drive business growth. I stay up-to-date with the latest advancements in Flutter technology to ensure that my apps are always cutting-edge, and I utilize Flutter's hot reload feature to quickly iterate and test my code, resulting in a faster development process and higher-quality output.";
  static const String routeName = '/CompletePostWidget';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        // height: MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        // margin: const EdgeInsets.only(top: 10),
        child: Center(
          child: Card(
            elevation: 1.5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: const CircleAvatar(
                          radius: 40,
                          child: Icon(
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
                        children: const [
                          Text(
                            'John Star Here Again',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text('17/02/2023'),
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
                    height: 15,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24.5),
                    child: Text(
                      postMessage,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Image.network(
                        "https://lh3.googleusercontent.com/p967fAW0LY695un5SI9dN2ucbN6W6SKNIKg12b84U14H0O-hWea8rhG4DWeDSuFmJq2hBUHu7HjZKbDx_2cdQU97FBU=w640-h400-e365-rj-sc0x00ffffff"),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
