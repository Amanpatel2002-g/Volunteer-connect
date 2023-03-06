import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volunteers_connect/auth/widgets/loginButton.dart';
import 'package:volunteers_connect/common/custom_appbar.dart';
import 'package:volunteers_connect/home/screens/user_connect_screen.dart';
import 'package:volunteers_connect/home/screens/user_home_screen.dart';
import 'package:volunteers_connect/home/services/ngo_job_services.dart';
import 'package:volunteers_connect/models/job_model.dart';
import 'package:volunteers_connect/providers/user_provider.dart';

// ignore: must_be_immutable
class UserNGOApplyScreen extends ConsumerWidget {
  UserNGOApplyScreen({super.key, required this.job});
  final Job job;
  static const String routeName = '/UserNGOApplyScreen';
  NGOJobServices ngoJobServices = NGOJobServices();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: customAppBar(context),
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                'Location: ',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            // for the description
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                '${job.district}, ${job.state}, ${job.country}',
                style: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                'Description: ',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            // for the description
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                job.description,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 40),
            LoginButton(
              ontap: () => ngoJobServices
                  .applyForNGO(
                      jobId: job.id,
                      userId: ref.read(userProvider)!.id,
                      context: context)
                  .then((_) => Navigator.of(context).pushNamedAndRemoveUntil(
                      UserHomeScreen.routeName, (route) => false)),
              mainText: 'Apply for this NGO',
            ),
            const SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
