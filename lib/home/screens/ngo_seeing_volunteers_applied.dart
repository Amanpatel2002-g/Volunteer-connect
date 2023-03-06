import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volunteers_connect/common/custom_appbar.dart';
import 'package:volunteers_connect/home/screens/user_ngo_apply_screen.dart';
import 'package:volunteers_connect/home/services/ngo_job_services.dart';
import 'package:volunteers_connect/models/job_model.dart';
import 'package:volunteers_connect/models/userModel.dart';

// ignore: must_be_immutable
class NGOseeingVolunteersApplied extends ConsumerWidget {
  NGOseeingVolunteersApplied({super.key, required this.jobId});
  String jobId;
  NGOJobServices ngoJobServices = NGOJobServices();
  static const String routeName = '/NGOseeingVolunteersApplied';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: customAppBar(context),
      body: FutureBuilder<List<UserModel>>(
        future: ngoJobServices.getVolunteersApplied(jobId, context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No Volunteers Applied'),
            );
          }
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                UserModel user = snapshot.data![index];
                print(snapshot.data!.length);
                return Card(
                  margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  color: Colors.white,
                  shadowColor: Colors.blueGrey,
                  elevation: 0.3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: const CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                        title: Text(
                          user.username,
                          style: const TextStyle(fontSize: 20),
                        ),
                        subtitle: Text(user.email),
                        // trailing: TextButton(
                        //     onPressed: () => Navigator.of(context).pushNamed(
                        //         UserNGOApplyScreen.routeName,
                        //         arguments: user),
                        //     child: const Text(
                        //       'Apply',
                        //       style: TextStyle(color: Colors.blue, fontSize: 18),
                        //     )),
                      ),
                    ],
                  ),
                );
              });
        },
      ),
    );
  }
}
