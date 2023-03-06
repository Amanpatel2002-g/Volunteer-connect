import 'package:flutter/material.dart';
import 'package:volunteers_connect/auth/screens/vol_auth_screen_sign_in.dart';
import 'package:volunteers_connect/home/screens/ngo_profile_page.dart';

class UserSettingPage extends StatelessWidget {
  const UserSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircleAvatar(
            radius: 100,
            child: Icon(
              Icons.person,
              size: 100,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'name',
            style: TextStyle(fontSize: 30),
          ),
          const Text(
            '100039709739472',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 50,
          ),
          ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              children: [
                GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushNamed(NGOProfilePage.routeName),
                  child: const ListTile(
                    selectedColor: Colors.blue,
                    leading: Icon(
                      Icons.person_2_sharp,
                      size: 40,
                    ),
                    title: Text(
                      'Profile Settings',
                      style: TextStyle(fontSize: 20),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_sharp),
                  ),
                ),
                const ListTile(
                  leading: Icon(
                    Icons.help_outline_sharp,
                    size: 40,
                  ),
                  title: Text(
                    'Help and Support',
                    style: TextStyle(fontSize: 20),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_sharp),
                ),
                // SizedBox(
                //   height: ,
                // ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
                      VolAuthScreen.routeName, (route) => false),
                  child: const ListTile(
                    leading: Icon(
                      Icons.logout_rounded,
                      size: 40,
                    ),
                    title: Text(
                      'Logout',
                      style: TextStyle(fontSize: 20),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_sharp),
                  ),
                ),
              ])
        ],
      ),
    );
  }
}
