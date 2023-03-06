import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volunteers_connect/home/screens/user_ngo_apply_screen.dart';
import 'package:volunteers_connect/home/services/ngo_job_services.dart';
import 'package:volunteers_connect/models/job_model.dart';
import 'package:volunteers_connect/providers/user_provider.dart';

class UserConnectScreen extends ConsumerWidget {
  UserConnectScreen({super.key});
  NGOJobServices ngoJobServices = NGOJobServices();
  static const String routeName = '/UserConnectScreen';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<List<Job>>(
      future: ngoJobServices.getJobs(context: context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              Job job = snapshot.data![index];
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
                      leading: job.profileUrl != null
                          ? Image.network(job.profileUrl!)
                          : const CircleAvatar(
                              child: Icon(
                                Icons.person,
                                size: 2,
                              ),
                            ),
                      title: Text(
                        job.name,
                        style: const TextStyle(fontSize: 20),
                      ),
                      subtitle: Text(job.heading),
                      trailing: TextButton(
                          onPressed: () => Navigator.of(context).pushNamed(
                              UserNGOApplyScreen.routeName,
                              arguments: job),
                          child: const Text(
                            'Apply',
                            style: TextStyle(color: Colors.blue, fontSize: 18),
                          )),
                    ),
                  ],
                ),
              );
            });
      },
    );
  }
}
