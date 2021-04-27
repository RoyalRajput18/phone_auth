import 'package:app_1/constants/colors.dart';
import 'package:app_1/constants/config.dart';
import 'package:app_1/constants/screen_navigation.dart';
import 'package:app_1/constants/string.dart';
import 'package:app_1/provider/auth.dart';
import 'package:app_1/screens/authentication/signup_patient/signup.dart';
import 'package:app_1/screens/authentication/verifty_phone.dart';
import 'package:app_1/screens/doctor/doctor_homepage.dart';
import 'package:app_1/services/user_service.dart';
import 'package:app_1/widgets/custom_textfield.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../mainpage_patient.dart';
import 'doctors/signup_doctors/signup_doctor1.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  double _height;
  double _width;
  TextEditingController phoneNumberController = TextEditingController();
  UserServices _userService = UserServices();

  GlobalKey<FormState> _key = GlobalKey();
  Widget screenRoute({String role}) {
    print(role);
    if (role == "admin") {
      return DoctorHomePage();
    } else {
      return MainPagePatient();
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    _height = SizeConfig.screenHeight;
    _width = SizeConfig.screenWidth;
    return Scaffold(
      body: Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        color: kWhiteColor,
        child: Stack(
          children: [
            Container(
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                // color: Colors.blueAccent,

                image: DecorationImage(
                  image: AssetImage(
                    'assets/doctor_pose.jpg',
                  ),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
            ),
            Container(
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                // color: Colors.blueAccent,
                gradient: kSignInPageGradient,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //  SizedBox(height: 0),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, top: 40),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(
                                    left: _width / 20, top: _height / 100),
                                child: Text(
                                  tWelcomeBack,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: kWhiteColor,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10.0,
                              ),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(left: _width / 15.0),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      tLoginInToContinue,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w200,
                                        fontSize: 17,
                                        color: kWhiteColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),

                Center(
                  child: Container(
                    margin: EdgeInsets.only(
                      left: _width / 12.0,
                      right: _width / 12.0,
                    ),
                    child: Form(
                      key: _key,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          phoneTextFormField(),
                        ],
                      ),
                    ),
                  ),
                ),

                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20, bottom: 5),
                      child: InkWell(
                        onTap: () {
                          if (phoneNumberController.text.length != 10) {
                            showToast(
                                message: "Enter Valid Mobile Number",
                                context: context);
                          } else {
                            _userService
                                .getUserById(phoneNumberController.text)
                                .then(
                              (user) {
                                if (user == null) {
                                  showToast(
                                      message:
                                          "PhoneNumber is Not Registered With Us Please Sign up first",
                                      context: context);
                                } else {
                                  Provider.of<AuthProvider>(context,
                                          listen: false)
                                      .verifyPhoneNumber(
                                    context,
                                    phoneNumberController.text,
                                    VerifyPhone(
                                      phoneNumber: phoneNumberController.text,
                                      callFrom: user.data()["role"].toString(),
                                    ),
                                    screenRoute(
                                        role: user.data()["role"].toString()),
                                  );
                                }
                              },
                            );
                          }
                        },
                        // onTap: () => changeScreen(
                        //     context,
                        //     VerifyPhone(
                        //       callFrom: "user",
                        //       phoneNumber: "+91 1234567890",
                        //     )),
                        // onTap: () =>
                        //     changeScreen(context, SignUpPagePatient1()),
                        child: Material(
                          elevation: 10,
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          child: Container(
                            alignment: Alignment.center,
                            // color: kPrimaryColor,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)),
                              color: kPrimaryColor,
                            ),
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              tLogIn,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: kWhiteColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: InkWell(
                        onTap: () =>
                            changeScreen(context, SignUpPagePatient1()),
                        child: Material(
                          elevation: 10,
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)),
                              color: kPrimaryColor,
                            ),
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              "Create An Account as a Patient",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: kWhiteColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        right: 20,
                        top: 5,
                      ),
                      child: InkWell(
                        onTap: () => changeScreen(context, SignUpPageDoctor1()),
                        child: Material(
                          elevation: 10,
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)),
                              color: kPrimaryColor,
                            ),
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              "Create An Account as Doctor",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: kWhiteColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20, bottom: 30),
                      child: Container(
                        alignment: Alignment.center,
                        //        margin: EdgeInsets.only(left: _width / 15.0),
                        child: Text(
                          tOtpSendNotice,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: kWhiteColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget phoneTextFormField() {
    return CustomTextField(
      textEditingController: phoneNumberController,
      keyboardType: TextInputType.number,
      prefix: true,
      label: "Mobile Number",
      validator: validateMobile,
      icon: Icons.phone,
      hint: tMobileNumber,
    );
  }
}

// Widget screenRoute(TextEditingController controller) {
//   _userServicse.getUserById(controller.text).then((value) {
//     if (value.exists) {
//       print(value["role"]);
//       if (value["role"] == "admin") {
//         return AdminHomePage();
//       } else {
//         return HomePage();
//       }
//     }
//   });
// }
