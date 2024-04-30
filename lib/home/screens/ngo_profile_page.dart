import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:volunteers_connect/providers/ngo_provider.dart';

class NGOProfilePage extends ConsumerStatefulWidget {
  const NGOProfilePage({super.key});
  static const String routeName = '/NGOProfilePage';
  @override
  ConsumerState<NGOProfilePage> createState() => _NGOProfilePageState();
}

class _NGOProfilePageState extends ConsumerState<NGOProfilePage> {
  final String aboutLines =
      "As a Flutter software engineer, I am highly skilled in developing mobile applications using Flutter's powerful framework.";
  final double coverHeight = 280;
  final double profileHeight = 144;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.zero,
      children: [
        buildTop(),
        buildNameAndProfession(),
        // buildContent(),
        aboutSection(),
      ],
    ));
  }

  Widget buildCoverImage() => Container(
        color: Colors.grey,
        child: Image.network(
            'https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
      );
  Widget buildProfileImageMethod() => CircleAvatar(
      radius: profileHeight / 2,
      backgroundColor: Colors.grey,
      child: Image.asset(
          'assets/images/pngtree-cartoon-color-simple-male-avatar-png-image_1934459.jpg'));

  Widget buildTop() {
    final double top = coverHeight - profileHeight / 2;
    return Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Container(
              margin: EdgeInsets.only(bottom: profileHeight / 2),
              child: buildCoverImage()),
          Positioned(top: top, child: buildProfileImageMethod())
        ]);
  }

  Widget buildSocialMeidaIcon(IconData icon) => CircleAvatar(
        radius: 25,
        child: Material(
          shape: const CircleBorder(),
          clipBehavior: Clip.hardEdge,
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Icon(
              icon,
              size: 32,
            ),
          ),
        ),
      );
  Widget buildNameAndProfession() => Column(
        children: [
          Text(ref.watch(NgoProvider)!.name),
          Text(
            ref.watch(NgoProvider)!.uniqueId,
            style: const TextStyle(fontSize: 28),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildSocialMeidaIcon(FontAwesomeIcons.slack),
              const SizedBox(
                width: 12,
              ),
              buildSocialMeidaIcon(FontAwesomeIcons.github),
              const SizedBox(
                width: 12,
              ),
              buildSocialMeidaIcon(FontAwesomeIcons.twitter),
              const SizedBox(
                width: 12,
              ),
              buildSocialMeidaIcon(FontAwesomeIcons.linkedin),
              const SizedBox(
                width: 12,
              ),
            ],
          )
        ],
      );
  Widget aboutSection() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 60,
            ),
            const Text(
              'About',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              aboutLines,
              style: const TextStyle(fontSize: 18, height: 1.4),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Experience',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              aboutLines,
              style: const TextStyle(fontSize: 18, height: 1.4),
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      );
}
