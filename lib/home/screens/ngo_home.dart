import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:volunteers_connect/common/color_file.dart';
import 'package:volunteers_connect/common/custom_appbar.dart';
import 'package:volunteers_connect/home/screens/ngo_add_post_page.dart';
import 'package:volunteers_connect/home/screens/ngo_job_post_form.dart';
import 'package:volunteers_connect/home/screens/ngo_post_screen.dart';
import 'package:volunteers_connect/home/screens/ngo_seeing_jobs.dart';
import 'package:volunteers_connect/home/screens/ngo_seeing_volunteers_applied.dart';
import 'package:volunteers_connect/home/screens/ngo_setting_screen.dart';
import 'package:volunteers_connect/home/screens/user_connect_screen.dart';

class NGOMainHomeScreen extends StatefulWidget {
  const NGOMainHomeScreen({super.key});
  static const String routeName = '/NGOMainHomeScreen';
  // NGOMainHomeScreen ({Key key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NGOMainHomeScreenState createState() => _NGOMainHomeScreenState();
}

class _NGOMainHomeScreenState extends State<NGOMainHomeScreen> {
  int _selectedIndex = 0;
  // ignore: unused_field
  static const String routeName = '/NGOMainHomeScreen';
  static final List<Widget> _widgetOptions = [
    const NGOPostScreen(),
    NGOseeingJobs(),
    const NGOSettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _selectedIndex == 0 || _selectedIndex == 1
            ? customAppBar(context)
            : null,
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Post Page',
                  backgroundColor: Colors.green),
              BottomNavigationBarItem(
                  icon: Icon(Icons.local_post_office),
                  label: 'Job Page',
                  backgroundColor: Colors.yellow),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'settings',
                backgroundColor: Colors.blue,
              ),
            ],
            backgroundColor: Colors.white,
            unselectedItemColor: const Color.fromARGB(255, 140, 138, 138),
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            selectedItemColor: const Color.fromARGB(255, 8, 7, 7),
            iconSize: 35,
            onTap: _onItemTapped,
            elevation: 5),
        floatingActionButton: Visibility(
          visible: _selectedIndex == 2 ? false : true,
          child: FloatingActionButton(
            onPressed: () {
              if (_selectedIndex == 1) {
                Navigator.of(context).pushNamed(NGOJobpostForm.routeName);
              } else {
                SchedulerBinding.instance.addPostFrameCallback((_) {
                  Navigator.of(context).pushNamed(NGOPostAddPage.routeName);
                });
              }
            },
            child: const Icon(
              Icons.add,
              size: 30,
            ),
          ),
        ));
  } 
}
