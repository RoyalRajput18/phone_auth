import 'dart:io';

import 'package:app_1/constants/colors.dart';
import 'package:app_1/constants/config.dart';
import 'package:app_1/constants/screen_navigation.dart';
import 'package:app_1/constants/string.dart';
import 'package:app_1/models/user_model.dart';
import 'package:app_1/provider/auth.dart';
import 'package:app_1/services/storage_service.dart';
import 'package:app_1/services/user_service.dart';
import 'package:app_1/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../mainpage_patient.dart';
import '../verifty_phone.dart';

class SignUpPagePatient2 extends StatefulWidget {
  String firstName;
  String lastName;
  PickedFile profileImage;

  SignUpPagePatient2({
    @required this.firstName,
    @required this.lastName,
    @required this.profileImage,
  });

  @override
  _SignUpPagePatient2State createState() => _SignUpPagePatient2State();
}

class _SignUpPagePatient2State extends State<SignUpPagePatient2> {
  double _screenHeight;

  double _screenWidth;
  bool loading = false;
  TextEditingController _mobileNumberController = TextEditingController();

  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  Future<dynamic> imageUploader({dynamic imagePath}) async {
    dynamic userProfileImageUrl = await StorageService.uploadUserProfileImage(
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

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    _screenHeight = SizeConfig.screenHeight;
    _screenWidth = SizeConfig.screenWidth;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10),
            height: _screenHeight,
            width: _screenWidth,
            //color: Colors.amberAccent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: InkWell(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 40,
                      width: 40,
                      child: Center(
                        child: IconButton(
                          icon: Icon(Icons.arrow_back, color: kBlackColor),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tProfileStepCount2,
                              style: TextStyle(
                                color: kBlackColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, bottom: 10.0),
                              child: Text(
                                tOtherInformation,
                                style: TextStyle(
                                  color: kBlackColor,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Text(
                              tUpdateProfileTextPage2,
                              style: TextStyle(
                                color: kBlackColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                left: _screenWidth / 18.0,
                                right: _screenWidth / 18.0,
                              ),
                              child: FormBuilder(
                                key: _fbKey,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: SizeConfig.blockSizeVertical * 25,
                                      child: FormBuilderChoiceChip(
                                        name: "Gender",
                                        //        elevation: 10,
                                        elevation: 2,

                                        selectedShadowColor: kPrimaryColor,
                                        pressElevation: 10,

                                        decoration: InputDecoration(
                                          labelText: "Gender",
                                          border: OutlineInputBorder(
                                            // borderRadius:
                                            //     BorderRadius.circular(30.0),
                                            borderSide: BorderSide.none,
                                          ),
                                          labelStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24,
                                          ),
                                        ),
                                        validator:
                                            FormBuilderValidators.required(
                                                context),

                                        alignment: WrapAlignment.center,
                                        spacing: 50,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.all(
                                              new Radius.circular(20.0)),
                                        ),

                                        backgroundColor: kWhiteColor,
                                        options: [
                                          FormBuilderFieldOption(
                                              child: Container(
                                                height: 80,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                      'assets/male_black.png',
                                                    ),
                                                    fit: BoxFit.cover,
                                                    alignment: Alignment.center,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                              ),
                                              value: tMale),
                                          FormBuilderFieldOption(
                                              child: Container(
                                                height: 80,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                      'assets/female_black.png',
                                                    ),
                                                    fit: BoxFit.cover,
                                                    alignment: Alignment.center,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                // child: Icon(Icons.),
                                              ),
                                              value: tFemale),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10.0, bottom: 10),
                                      child: phoneTextFormField(),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20.0, bottom: 10),
                                      child: FormBuilderDateTimePicker(
                                        name: "dob",
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        inputType: InputType.date,
                                        format: DateFormat("dd-MM-yyyy"),
                                        decoration: InputDecoration(
                                          labelText: tBirthday,
                                          hintText: tBirthdateHintText,
                                          prefixIcon: Icon(
                                            Icons.calendar_today,
                                            color: kPrimaryColor,
                                            size: 20,
                                          ),
                                          contentPadding: EdgeInsets.only(
                                              top: 10.0, bottom: 0.0),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            // borderSide: BorderSide.none,
                                          ),
                                          //     border: InputBorder.none,
                                        ),
                                        validator:
                                            FormBuilderValidators.required(
                                                context),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () async {
                            // Provider.of<AuthProvider>(context, listen: false)
                            //     .authRoute(context);

                            if (_fbKey.currentState.saveAndValidate()) {
                              print(_fbKey.currentState.value);
                              if (_mobileNumberController.text == null ||
                                  _mobileNumberController.text.length != 10) {
                                showToast(
                                    context: context,
                                    message:
                                        "Please Enter 10 digit Mobile Number");
                              } else {
                                UserServices()
                                    .getUserById(
                                        _mobileNumberController.text.trim())
                                    .then(
                                  (user) async {
                                    if (user != null) {
                                      showToast(
                                          message:
                                              "PhoneNumber is Registered With Us Please Sign up first",
                                          context: context);
                                    } else {
                                      setState(() {
                                        loading = true;
                                      });

                                      await imageUploader(
                                              imagePath:
                                                  widget.profileImage.path)
                                          .then((profileImg) async {
                                        PatientDataModel patientDataModel =
                                            PatientDataModel(
                                          role: "patient",
                                          firstName: widget.firstName,
                                          lastName: widget.lastName,
                                          mobileNumber:
                                              _mobileNumberController.text,
                                          patientDOB: _fbKey
                                              .currentState.value['dob']
                                              .toString(),
                                          patientGender: _fbKey
                                              .currentState.value['Gender']
                                              .toString(),
                                          profileImageUrl:
                                              widget.profileImage.toString(),
                                        );
                                        print(patientDataModel);

                                        await UserServices().createPatient(
                                          patientDataModel: patientDataModel,
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
                                            callFrom: "patient",
                                            phoneNumber:
                                                _mobileNumberController.text,
                                          ),
                                          MainPagePatient(),
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
                              child: loading == true
                                  ? Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(),
                                        Center(
                                          child: Text(tContinue,
                                              style: TextStyle(
                                                color: kWhiteColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    SizeConfig.screenHeight /
                                                        30,
                                              )),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 15.0),
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
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
  }) : super(key: key);

  final TextEditingController controller;
  final String attribute;
  final String labelText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(30.0),
      child: FormBuilderTextField(
        name: attribute,
        autocorrect: true,
        cursorColor: kPrimaryColor,
        validator: FormBuilderValidators.compose(
          [
            FormBuilderValidators.required(context),
            FormBuilderValidators.minLength(context, 2),
          ],
        ),
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          prefixIcon: Icon(
            Icons.person,
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
