import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volunteers_connect/home/screens/ngo_seeing_volunteers_applied.dart';
import 'package:volunteers_connect/home/screens/user_ngo_apply_screen.dart';
import 'package:volunteers_connect/home/services/ngo_job_services.dart';
import 'package:volunteers_connect/models/job_model.dart';
import 'package:volunteers_connect/providers/ngo_provider.dart';

// ignore: must_be_immutable
class NGOseeingJobs extends ConsumerWidget {
  NGOseeingJobs({super.key});
  NGOJobServices ngoJobServices = NGOJobServices();
  static const String routeName = '/NGOseeingJobs';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<List<Job>>(
      future: ngoJobServices.getJobByNgo(ref.read(NgoProvider)!.id, context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.data!.isEmpty) {
          return const Center(
            child: Text('Well No Jobs have been uploaded By you'),
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
                      const SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).pushNamed(
                            NGOseeingVolunteersApplied.routeName,
                            arguments: job.id),
                        child: ListTile(
                          title: Text(
                            job.heading,
                            style: const TextStyle(fontSize: 20),
                          ),
                          subtitle:
                              Text('from ${job.startdate} to ${job.enddate}'),
                        ),
                      ),
                    ],
                  ));
            });
      },
    );
  }
}
