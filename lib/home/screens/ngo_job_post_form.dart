import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:volunteers_connect/auth/widgets/loginButton.dart';
import 'package:volunteers_connect/home/screens/ngo_home.dart';
import 'package:volunteers_connect/home/services/ngo_job_services.dart';
import 'package:volunteers_connect/home/widgets/custom_form_field.dart';
import 'package:volunteers_connect/providers/ngo_provider.dart';

class NGOJobpostForm extends ConsumerStatefulWidget {
  NGOJobpostForm({super.key});
  static const String routeName = '/NGOJobPostform';

  @override
  ConsumerState<NGOJobpostForm> createState() => _NGOJobpostFormState();
}

class _NGOJobpostFormState extends ConsumerState<NGOJobpostForm> {
  DateTime selectedDate = DateTime.now();
  TextEditingController titletextEditingController = TextEditingController();
  TextEditingController startdatetextEditingController =
      TextEditingController();
  TextEditingController enddatetextEditingController = TextEditingController();
  TextEditingController descriptiontextEditingController =
      TextEditingController();
  String country = '', state = '', city = '';
  void navigateback() {
    NGOJobServices ngoJobServices = NGOJobServices();
    ngoJobServices.postJob(
        context: context,
        name: ref.read(NgoProvider)!.name,
        nogId: ref.read(NgoProvider)!.id,
        startdate: startdatetextEditingController.text,
        enddate: enddatetextEditingController.text,
        state: state,
        country: country,
        district: city,
        heading: titletextEditingController.text,
        description: descriptiontextEditingController.text,
        profileUrl: ref.watch(NgoProvider)!.profileUrl);
    Navigator.of(context)
        .pushNamedAndRemoveUntil(NGOMainHomeScreen.routeName, (route) => false);
  }

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: selectedDate,
        lastDate: DateTime(selectedDate.year + 1));
    if (picked != null && picked != selectedDate) {
      setState(() {
        startdatetextEditingController.text =
            "${picked.day}-${picked.month}-${picked.year}";
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: selectedDate,
        lastDate: DateTime(selectedDate.year + 1));
    if (picked != null && picked != selectedDate) {
      setState(() {
        enddatetextEditingController.text =
            "${picked.day}-${picked.month}-${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              CustomFormTextField(
                  inputHintText: 'Job Title',
                  textEditingController: titletextEditingController),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  await _selectStartDate(context);
                },
                child: CustomFormTextField(
                    enabled: false,
                    inputHintText: 'Start-date',
                    textEditingController: startdatetextEditingController),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  await _selectEndDate(context);
                },
                child: CustomFormTextField(
                    enabled: false,
                    inputHintText: 'End-Date',
                    textEditingController: enddatetextEditingController),
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer(
                builder: (context, ref, child) => Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: SelectState(
                      style: TextStyle(
                          color: HexColor("#1d4980"),
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold),
                      onCountryChanged: (value) {
                        country = value;
                      },
                      onStateChanged: (value) {
                        state = value;
                      },
                      onCityChanged: (value) {
                        city = value;
                      }),
                ),
              ),
              CustomFormTextField(
                inputHintText: 'Description',
                textEditingController: descriptiontextEditingController,
                lines: 10,
              ),
              const SizedBox(
                height: 25,
              ),
              LoginButton(
                ontap: () => navigateback(),
                mainText: 'Submit',
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
