import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:volunteers_connect/common/errorHandling.dart';
import 'package:volunteers_connect/common/shared_preferences_file.dart';
import 'package:volunteers_connect/home/screens/user_connect_screen.dart';
import 'package:volunteers_connect/home/screens/user_home_screen.dart';
import 'package:volunteers_connect/models/job_model.dart';
import 'package:volunteers_connect/models/userModel.dart';
import 'package:volunteers_connect/models/volunteers_applied.dart';

import '../../common/utils.dart';

class NGOJobServices {
  static final NGOJobServices _instance = NGOJobServices._internal();
  factory NGOJobServices() {
    return _instance;
  }
  NGOJobServices._internal();

  void postJob(
      {required BuildContext context,
      required String name,
      required String nogId,
      required String startdate,
      required String enddate,
      required String country,
      required String district,
      required String heading,
      required String state,
      required String description,
      String? profileUrl}) async {
    String? token = await LocalStorage.getString(tokenKey);
    debugPrint(token);
    Job job = Job(
        id: '',
        name: name,
        ngoId: nogId,
        startdate: startdate,
        enddate: enddate,
        country: country,
        district: district,
        state: state,
        heading: heading,
        description: description,
        profileUrl: profileUrl);
    http.Response res = await http.post(Uri.parse('$uri/api/postJob'),
        headers: getHeaderWithToken(token!), body: job.toJson());
    // httpErrorHandling(context: context, response: res, onSuccess: onSuccess)
  }

  Future<List<Job>> getJobs({required BuildContext context}) async {
    String? token = await LocalStorage.getString(tokenKey);
    List<Job> list = [];
    http.Response res = await http.get(Uri.parse('$uri/api/getJobs'),
        headers: getHeaderWithToken(token!));
    // ignore: use_build_context_synchronously
    httpErrorHandling(
        context: context,
        response: res,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            Job job = Job.fromJson(jsonEncode(jsonDecode(res.body)[i]));
            list.add(job);
          }
        });
    return list;
  }

  Future<void> applyForNGO(
      {required String jobId,
      required String userId,
      required BuildContext context}) async {
    String? token = await LocalStorage.getString(tokenKey);
    http.Response res = await http.post(Uri.parse('$uri/api//applyforNGO'),
        headers: getHeaderWithToken(token!),
        body: jsonEncode({'jobId': jobId, 'userId': userId}));
    // ignore: use_build_context_synchronously
    httpErrorHandling(
        context: context,
        response: res,
        onSuccess: () {
          Navigator.of(context).pushNamedAndRemoveUntil(
              UserConnectScreen.routeName, (route) => false);
        });
  }

  Future<List<Job>> getJobByNgo(String ngoId, BuildContext context) async {
    http.Response res =
        await http.get(Uri.parse('$uri/api/getJobByNgo/:$ngoId'));
    List<Job> jobs = [];
    // ignore: use_build_context_synchronously
    httpErrorHandling(
        context: context,
        response: res,
        onSuccess: () {
          print(jsonDecode(res.body).length);
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            jobs.add(Job.fromJson(jsonEncode(jsonDecode(res.body)[i])));
          }
        });
    print(jobs);
    return jobs;
  }

  Future<List<VolunteerApplied>> getVolunteersApplied(
      String jobId, BuildContext context) async {
    http.Response res =
        await http.get(Uri.parse('$uri/api/getAppliedPeople/:$jobId'));
    List<VolunteerApplied> jobs = [];
    // ignore: use_build_context_synchronously
    int sc = res.statusCode;
    print("The status code is $sc");
    switch (res.statusCode) {
      case 200:
        try{
          VolunteerApplied x = VolunteerApplied.fromJson(jsonEncode(jsonDecode(res.body)[0]));
          print("The length from get Volunteers Applied is");
          print("the jsondecode version is here $x");
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            jobs.add(VolunteerApplied.fromJson(jsonEncode(jsonDecode(res.body)[i])));
            print("camw here");
          }
          print("jobs are here $jobs");
        }
        catch(e, s){
          print('Exception details:\n $e');
        }
        break;

      case 500:
        // debugPrint(jsonDecode(response.body));
        debugPrint("This is from http ErrorHandling case:500\n");

        showSnackbar(context, jsonDecode(res.body)["err"]);
        break;
      default:
        debugPrint("This is from http ErrorHandling case:default\n");
        debugPrint(res.body);
        showSnackbar(context, res.body);
    }
    // httpErrorHandling(
    //     context: context,
    //     response: res,
    //     onSuccess: () {
    //       print("The length from get Volunteers Applied is");
    //       print(jsonDecode(res.body));
    //       for (int i = 0; i < jsonDecode(res.body).length; i++) {
    //         print("camw here");
    //         jobs.add(UserModel.fromJson(jsonEncode(jsonDecode(res.body)[i])));
    //       }
    //       print("volunteer applied on the ");
    //       print(jobs);
    //     });
    return jobs;
  }
}
