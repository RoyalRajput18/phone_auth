import 'dart:io';

import 'package:app_1/constants/colors.dart';
import 'package:app_1/constants/config.dart';
import 'package:app_1/constants/screen_navigation.dart';
import 'package:app_1/constants/string.dart';
import 'package:app_1/screens/authentication/signup_patient/signup_patient2.dart';
import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:image_picker/image_picker.dart';

class SignUpPagePatient1 extends StatefulWidget {
  @override
  _SignUpPagePatient1State createState() => _SignUpPagePatient1State();
}

class _SignUpPagePatient1State extends State<SignUpPagePatient1> {
  double _screenHeight;
  double _screenWidth;
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();
  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
        // CircleAvatar(
        //   radius: 60.0,
        //   backgroundImage: _imageFile == null
        //       ? AssetImage("assets/doctor_pose.jpg")
        //       : FileImage(File(_imageFile.path)),
        // ),
        Container(
          height: SizeConfig.blockSizeVertical * 17,
          width: SizeConfig.blockSizeHorizontal * 30,
          decoration: BoxDecoration(
            // color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(18),
            image: DecorationImage(
              image: _imageFile == null
                  ? AssetImage("assets/doctor_pose.jpg")
                  : FileImage(File(_imageFile.path)),
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
        ),
        // Positioned(
        //   bottom: 20.0,
        //   right: 20.0,
        //   child: InkWell(
        //     onTap: () {
        //       showModalBottomSheet(
        //         context: context,
        //         builder: ((builder) => bottomSheet()),
        //       );
        //     },
        //     child: Icon(
        //       Icons.add_a_photo,
        //       color: kWhiteColor,
        //       size: 24.0,
        //     ),
        //   ),
        // ),
      ]),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            TextButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
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
                              tProfileStepCount1,
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
                                tYourProfile,
                                style: TextStyle(
                                  color: kBlackColor,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              tUpdateProfileText,
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
                                    InkWell(
                                      onTap: () {
                                        // Provider.of<AuthProvider>(context, listen: false)
                                        //     .authRoute(context);
                                        showModalBottomSheet(
                                          context: context,
                                          builder: ((builder) => bottomSheet()),
                                        );
                                      },
                                      child: Center(
                                        child: Container(
                                          height:
                                              SizeConfig.blockSizeVertical * 17,
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  30,
                                          decoration: BoxDecoration(
                                            // color: Colors.blueAccent,
                                            borderRadius:
                                                BorderRadius.circular(18),
                                            image: DecorationImage(
                                              image: _imageFile == null
                                                  ? AssetImage(
                                                      'assets/doctor_pose.jpg',
                                                    )
                                                  : FileImage(
                                                      File(_imageFile.path)),
                                              fit: BoxFit.cover,
                                              alignment: Alignment.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20.0, bottom: 10),
                                      child: FormField(
                                        controller: _firstNameController,
                                        attribute: "firstName",
                                        hintText: tFirstNameHintText,
                                        labelText: tFirstName,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: FormField(
                                        controller: _lastNameController,
                                        attribute: "lastName",
                                        hintText: tLastNameHintText,
                                        labelText: tLastName,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            // Provider.of<AuthProvider>(context, listen: false)
                            //     .authRoute(context);

                            if (_fbKey.currentState.saveAndValidate()) {
                              print(_fbKey.currentState.value);
                              if (_imageFile == null) {
                                showToast(
                                    message: "Please Select Profile Picture",
                                    context: context);
                              } else {
                                if (_imageFile != null) {
                                  changeScreen(
                                    context,
                                    SignUpPagePatient2(
                                      firstName: _fbKey
                                          .currentState.value['firstName'],
                                      lastName:
                                          _fbKey.currentState.value['lastName'],
                                      profileImage: _imageFile,
                                    ),
                                  );
                                } else {
                                  showToast(
                                      context: context,
                                      message:
                                          "Profile Picture must be selected");
                                }
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
                                              SizeConfig.screenHeight / 30,
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
