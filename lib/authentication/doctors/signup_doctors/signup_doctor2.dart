import 'dart:io';

import 'package:app_1/constants/colors.dart';
import 'package:app_1/constants/config.dart';
import 'package:app_1/constants/screen_navigation.dart';
import 'package:app_1/constants/string.dart';
import 'package:app_1/models/user_model.dart';
import 'package:app_1/provider/auth.dart';
import 'package:app_1/screens/doctor/doctor_homepage.dart';
import 'package:app_1/services/storage_service.dart';
import 'package:app_1/services/user_service.dart';
import 'package:app_1/widgets/custom_textfield.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:provider/provider.dart';

import '../../verifty_phone.dart';

class SignUpPageDoctor2 extends StatefulWidget {
  String firstName;
  String lastName;
  String prNo;
  String gender;
  String dob;
  String profileImage;

  SignUpPageDoctor2({
    @required this.firstName,
    @required this.lastName,
    @required this.prNo,
    @required this.gender,
    @required this.dob,
    @required this.profileImage,
  });
  @override
  _SignUpPageDoctor2State createState() => _SignUpPageDoctor2State();
}

class _SignUpPageDoctor2State extends State<SignUpPageDoctor2> {
  double _screenHeight;

  double _screenWidth;
  bool loading = false;

  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  TextEditingController _mobileNumberController = TextEditingController();
  TextEditingController _hospitalNameController = TextEditingController();
  TextEditingController _hospitalAddressController = TextEditingController();
  TextEditingController _experienceController = TextEditingController();
  Future<String> imageUploader({String imagePath}) async {
    String userProfileImageUrl = await StorageService.uploadUserProfileImage(
      imageFile: File(imagePath),
      url: null,
    );
    return userProfileImageUrl;
  }

  Widget phoneTextFormField() {
    return CustomTextField(
      textEditingController: _mobileNumberController,
      keyboardType: TextInputType.number,
      prefix: true,
      label: "Mobile Number",
      validator: validateMobile,
      icon: Icons.phone,
      hint: tMobileNumber,
    );
  }

  final ValueChanged _onChanged = (val) => print(val);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    _screenHeight = SizeConfig.screenHeight;
    _screenWidth = SizeConfig.screenWidth;
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(10),
          height: _screenHeight,
          width: _screenWidth,
          //color: Colors.amberAccent,
          child: ListView(
            shrinkWrap: true,
            //  crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 10),
                child: InkWell(
                  child: Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: IconButton(
                        icon: Icon(Icons.arrow_back, color: kBlackColor),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10.0,
                        ),
                        child: Text(
                          tDoctorProfileStepCount2,
                          style: TextStyle(
                            color: kBlackColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Text(
                          tYourWorkProfile,
                          style: TextStyle(
                            color: kBlackColor,
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          tVerifyProfileNotice,
                          style: TextStyle(
                            color: kBlackColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: _screenWidth / 18.0,
                      right: _screenWidth / 18.0,
                    ),
                    child: FormBuilder(
                      key: _fbKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Material(
                            elevation: 10,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            child: FormBuilderChipsInput(
                              decoration: const InputDecoration(
                                  labelText: 'Specialities',
                                  hintText: "Select Your Specialities",
                                  border: OutlineInputBorder(
                                    //borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: kPrimaryColor,
                                    size: 20,
                                  ),
                                  contentPadding:
                                      EdgeInsets.only(top: 10.0, bottom: 8.0),
                                  labelStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                              name: 'specialities',
                              // validator:
                              //   FormBuilderValidators.required(context),

                              onChanged: _onChanged,
                              initialValue: [
                                Specialities(
                                    'Coronavirus related', 'assets/corona.jpg'),
                              ],
                              maxChips: 5,
                              findSuggestions: (String query) {
                                if (query.isNotEmpty) {
                                  var lowercaseQuery = query.toLowerCase();
                                  return specialities.where((profile) {
                                    return profile.name
                                        .toLowerCase()
                                        .contains(query.toLowerCase());
                                  }).toList(growable: false)
                                    ..sort((a, b) => a.name
                                        .toLowerCase()
                                        .indexOf(lowercaseQuery)
                                        .compareTo(b.name
                                            .toLowerCase()
                                            .indexOf(lowercaseQuery)));
                                } else {
                                  return const <Specialities>[];
                                }
                              },
                              chipBuilder: (context, state, profile) {
                                return InputChip(
                                  key: ObjectKey(profile),
                                  label: Text(profile.name),
                                  avatar: CircleAvatar(
                                    backgroundImage:
                                        AssetImage(profile.imageUrl),
                                  ),
                                  onDeleted: () => state.deleteChip(profile),
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                );
                              },
                              suggestionBuilder: (context, state, profile) {
                                return ListTile(
                                  key: ObjectKey(profile),
                                  leading: CircleAvatar(
                                    backgroundImage:
                                        AssetImage(profile.imageUrl),
                                  ),
                                  title: Text(profile.name),
                                  onTap: () => state.selectSuggestion(profile),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 30.0, bottom: 10),
                            child: Divider(
                              height: 2,
                              thickness: 2,
                              color: kPrimaryColor,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 20.0, bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 20.0, left: 8),
                                  child: Text(
                                    tPrimaryHospitalOrClinic,
                                    style: TextStyle(
                                      color: kBlackColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, bottom: 10),
                                  child: FormField(
                                    controller: _hospitalNameController,
                                    attribute: "hospitalName",
                                    hintText: tEnterHospitalOrClinicName,
                                    labelText: tHospitalOrClinicName,
                                    textInputType: TextInputType.name,
                                    validators: FormBuilderValidators.compose(
                                      [
                                        FormBuilderValidators.required(context),
                                        FormBuilderValidators.minLength(
                                            context, 2),
                                      ],
                                    ),
                                    iconData: Icons.apartment,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, bottom: 10),
                                  child: FormField(
                                    controller: _hospitalAddressController,
                                    attribute: "hospitalAddress",
                                    hintText: tEnterHospitalAddress,
                                    labelText: tHospitalAddress,
                                    textInputType: TextInputType.streetAddress,
                                    validators: FormBuilderValidators.compose(
                                      [
                                        FormBuilderValidators.required(context),
                                        FormBuilderValidators.minLength(
                                            context, 2),
                                      ],
                                    ),
                                    iconData: Icons.location_on,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, bottom: 10),
                                  child: Material(
                                    elevation: 10,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    child: FormBuilderDropdown(
                                      name: 'city',
                                      decoration: const InputDecoration(
                                        labelText: tCity,
                                        prefixIcon: Icon(
                                          Icons.location_city,
                                          color: kPrimaryColor,
                                          size: 20,
                                        ),
                                        contentPadding: EdgeInsets.only(
                                            top: 10.0, bottom: 0.0),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30.0)),
                                          // borderSide: BorderSide.none,
                                        ),
                                      ),
                                      // initialValue: 'Male',
                                      hint: Text('Select City'),
                                      validator: FormBuilderValidators.required(
                                          context),

                                      items: cities
                                          .map((city) => DropdownMenuItem(
                                                value: city,
                                                child: Text('$city'),
                                              ))
                                          .toList(),
                                      // isExpanded: false,
                                      allowClear: true,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, bottom: 10),
                                  child: phoneTextFormField(),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 20.0, bottom: 20),
                            child: Divider(
                              height: 2,
                              thickness: 2,
                              color: kPrimaryColor,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 10),
                            child: FormField(
                              controller: _experienceController,
                              attribute: "yearExperience",
                              hintText: tEnterYourWorkExperience,
                              labelText: tYearExperience,
                              textInputType: TextInputType.number,
                              validators: FormBuilderValidators.compose(
                                [
                                  FormBuilderValidators.required(context),
                                  FormBuilderValidators.minLength(context, 1),
                                  FormBuilderValidators.maxLength(context, 2),
                                ],
                              ),
                              iconData: Icons.assignment_ind,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 30),
                            child: Material(
                              elevation: 10,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              child: FormBuilderChipsInput(
                                decoration: const InputDecoration(
                                    labelText: tLanguage,
                                    hintText: tEnterLanguage,
                                    border: OutlineInputBorder(
                                      //borderSide: BorderSide.none,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: kPrimaryColor,
                                      size: 20,
                                    ),
                                    contentPadding:
                                        EdgeInsets.only(top: 10.0, bottom: 8.0),
                                    labelStyle: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)),
                                name: 'languages',
                                //  validator: FormBuilderValidators.compose(
                                //    [
                                //      FormBuilderValidators.required(context),
                                //    ]
                                //  ),
                                onChanged: _onChanged,
                                initialValue: [
                                  Languages(
                                    'English',
                                  ),
                                ],
                                maxChips: 5,
                                findSuggestions: (String query) {
                                  if (query.isNotEmpty) {
                                    var lowercaseQuery = query.toLowerCase();
                                    return languages.where((profile) {
                                      return profile.language
                                          .toLowerCase()
                                          .contains(query.toLowerCase());
                                    }).toList(growable: false)
                                      ..sort((a, b) => a.language
                                          .toLowerCase()
                                          .indexOf(lowercaseQuery)
                                          .compareTo(b.language
                                              .toLowerCase()
                                              .indexOf(lowercaseQuery)));
                                  } else {
                                    return const <Languages>[];
                                  }
                                },
                                chipBuilder: (context, state, profile) {
                                  return InputChip(
                                    key: ObjectKey(profile),
                                    label: Text(profile.language),
                                    onDeleted: () => state.deleteChip(profile),
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  );
                                },
                                suggestionBuilder: (context, state, profile) {
                                  return ListTile(
                                    key: ObjectKey(profile),
                                    title: Text(profile.language),
                                    onTap: () =>
                                        state.selectSuggestion(profile),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50.0),
                    child: InkWell(
                      onTap: () {
                        // Provider.of<AuthProvider>(context, listen: false)
                        //     .authRoute(context);

                        if (_fbKey.currentState.saveAndValidate()) {
                          print(_fbKey.currentState.value);
                          if (_mobileNumberController.text == null ||
                              _mobileNumberController.text.length != 10) {
                            showToast(
                                context: context,
                                message: "Please Enter 10 digit Mobile Number");
                          } else {
                            UserServices()
                                .getUserById(_mobileNumberController.text)
                                .then(
                              (user) async {
                                if (user != null) {
                                  showToast(
                                      message:
                                          "PhoneNumber is Not Registered With Us Please Sign up first",
                                      context: context);
                                } else {
                                  setState(() {
                                    loading = true;
                                  });
                                  await imageUploader(
                                          imagePath: widget.profileImage)
                                      .then((profileImg) async {
                                    DoctorDataModel doctorDataModel =
                                        DoctorDataModel(
                                      city: _fbKey.currentState.value["city"],
                                      doctorDOB: widget.dob,
                                      doctorGender: widget.gender,
                                      doctorSpecialities: _fbKey
                                          .currentState.value["specialities"],
                                      experience: _fbKey
                                          .currentState.value["yearExperience"],
                                      firstName: widget.firstName,
                                      hospitalAddress: _fbKey.currentState
                                          .value["hospitalAddress"],
                                      hospitalName: _fbKey
                                          .currentState.value["hospitalName"],
                                      languages: _fbKey
                                          .currentState.value["languages"],
                                      lastName: widget.lastName,
                                      mobileNumber:
                                          _mobileNumberController.text.trim(),
                                      officePhoneNumber:
                                          _mobileNumberController.text.trim(),
                                      permenantRegistrationNumber: widget.prNo,
                                      profileImageUrl: profileImg,
                                    );
                                    // print(doctorDataModel);
                                    await UserServices().createDoctor(
                                      doctorDataModel: doctorDataModel,
                                    );

                                    print("===MOBILE===" +
                                        _mobileNumberController.text
                                            .trim()
                                            .toString());
                                    Provider.of<AuthProvider>(context,
                                            listen: false)
                                        .verifyPhoneNumber(
                                      context,
                                      _mobileNumberController.text.trim(),
                                      VerifyPhone(
                                        callFrom: "doctor",
                                        phoneNumber:
                                            _mobileNumberController.text,
                                      ),
                                      DoctorHomePage(),
                                    );
                                    setState(() {
                                      loading = false;
                                    });
                                  });
                                }
                              },
                            );
                          }
                        }
                      },
                      child: Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          height: 50,
                          width: _screenWidth,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(),
                              Center(
                                child: Text(tContinue,
                                    style: TextStyle(
                                      color: kWhiteColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: SizeConfig.screenHeight / 30,
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 15.0),
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: kWhiteColor,
                                  size: 26,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FormField extends StatelessWidget {
  const FormField({
    Key key,
    @required this.controller,
    @required this.attribute,
    @required this.hintText,
    @required this.labelText,
    @required this.validators,
    @required this.iconData,
    @required this.textInputType,
  }) : super(key: key);

  final TextEditingController controller;
  final String attribute;
  final String labelText;
  final String hintText;
  final IconData iconData;
  final FormFieldValidator<String> validators;
  final TextInputType textInputType;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(30.0),
      child: FormBuilderTextField(
        name: attribute,
        autocorrect: true,
        keyboardType: textInputType,
        cursorColor: kPrimaryColor,
        expands: false,
        validator: validators,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          prefixIcon: Icon(
            iconData,
            color: kPrimaryColor,
            size: 20,
          ),
          contentPadding: EdgeInsets.only(top: 10.0, bottom: 0.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            // borderSide: BorderSide.none,
          ),
          //     border: InputBorder.none,
        ),
        controller: controller,
        style: TextStyle(color: kBlackColor),
      ),
    );
  }
}
