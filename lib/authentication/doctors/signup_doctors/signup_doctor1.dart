import 'dart:io';
import 'package:app_1/constants/colors.dart';
import 'package:app_1/constants/config.dart';
import 'package:app_1/constants/screen_navigation.dart';
import 'package:app_1/constants/string.dart';
import 'package:app_1/screens/authentication/doctors/signup_doctors/signup_doctor2.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

class SignUpPageDoctor1 extends StatefulWidget {
  @override
  _SignUpPageDoctor1State createState() => _SignUpPageDoctor1State();
}

class _SignUpPageDoctor1State extends State<SignUpPageDoctor1> {
  double _screenHeight;

  double _screenWidth;
  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  TextEditingController _firstNameController = TextEditingController();

  TextEditingController _lastNameController = TextEditingController();

  TextEditingController _permenantRegistrationController =
      TextEditingController();

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
                          tDoctorProfileStepCount1,
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
                          tBasicInformation,
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
                          Container(
                            width: _screenWidth,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                imageProfile(),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
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
                                      child: Material(
                                        elevation: 10,
                                        borderRadius: BorderRadius.circular(14),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: kPrimaryColor,
                                            borderRadius:
                                                BorderRadius.circular(14),
                                          ),
                                          height: SizeConfig.screenHeight / 20,
                                          width: SizeConfig.screenHeight / 4.6,
                                          child: Center(
                                            child: Text(tUploadYourAvatar,
                                                style: TextStyle(
                                                  color: kWhiteColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      SizeConfig.screenHeight /
                                                          40,
                                                )),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: AutoSizeText(
                                        "Your avatar should is a friendly\nand inviting head shot.\nClearly indentifiable as you",
                                        maxLines: 4,
                                        style: TextStyle(
                                          color: kGreyColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 20.0, bottom: 10),
                            child: FormField(
                              controller: _firstNameController,
                              attribute: "firstName",
                              hintText: tFirstNameHintText,
                              labelText: tFirstName,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: FormField(
                              controller: _lastNameController,
                              attribute: "LastName",
                              hintText: tLastNameHintText,
                              labelText: tLastName,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: FormField(
                              controller: _permenantRegistrationController,
                              attribute: "prNo",
                              hintText: tPermenantRegistrationNoHintText,
                              labelText: tPermenantRegistrationNo,
                            ),
                          ),

                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 0),
                            child: Container(
                              height: SizeConfig.blockSizeVertical * 25,
                              child: FormBuilderChoiceChip(
                                name: "gender",
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
                                    FormBuilderValidators.required(context),

                                alignment: WrapAlignment.center,
                                spacing: 50,
                                crossAxisAlignment: WrapCrossAlignment.center,
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
                          ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 30),
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
                                contentPadding:
                                    EdgeInsets.only(top: 10.0, bottom: 0.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  // borderSide: BorderSide.none,
                                ),
                                //     border: InputBorder.none,
                              ),
                              validator:
                                  FormBuilderValidators.required(context),
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

                          changeScreen(
                            context,
                            SignUpPageDoctor2(
                              firstName: _fbKey.currentState.value["firstName"]
                                  .toString(),
                              dob: _fbKey.currentState.value["dob"].toString(),
                              gender: _fbKey.currentState.value["gender"]
                                  .toString(),
                              lastName: _fbKey.currentState.value["LastName"]
                                  .toString(),
                              prNo:
                                  _fbKey.currentState.value["prNo"].toString(),
                              profileImage: _imageFile.path.toString(),
                            ),
                          );
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
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            FlatButton.icon(
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
