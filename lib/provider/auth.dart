import 'dart:async';
import 'package:app_1/models/user_model.dart';
import 'package:app_1/provider/user_data.dart';
import 'package:app_1/screens/splash_screen.dart';
import 'package:app_1/services/user_service.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../constants/screen_navigation.dart';
import '../screens/doctor/doctor_homepage.dart';
import '../screens/mainpage_patient.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class AuthProvider with ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;

  UserDataProvider _userDataProvider = UserDataProvider();
  UserServices _userService = UserServices();

  TextEditingController phoneNo;

  String verificationId;
  String errorMessage = '';
  bool loading = false;
  UserDataModel userDataModel = UserDataModel();

  void setUserData(UserDataModel user) {
    userDataModel = UserDataModel.copy(user);

    print(userDataModel.mobileNumber.toString());
    print(userDataModel.profileImageUrl);
    notifyListeners();
  }

  // ignore: missing_return
  Widget authRoute(BuildContext context) {
    var _user = _auth.currentUser;
    if (_user != null) {
      _userDataProvider.currentUserId = _user.phoneNumber.substring(3);
      _userService.getUserById(_user.phoneNumber.substring(3)).then(
        (value) {
          print(value);
          if (value != null) {
            print(value['role']);
            if (value['role'] == "doctor") {
              return changeScreenReplacement(context, DoctorHomePage());
            } else {
              return changeScreenReplacement(context, MainPagePatient());
            }
          }
        },
      );
    } else {
      // return SignInPage();
      return SplashScreen();
    }
  }

  Future<void> verifyPhoneNumber(BuildContext context, String number,
      Widget widget, Widget afterOtpWidget) async {
    final PhoneCodeSent smsOTPSent = (String verId, [int forceCodeResend]) {
      print("smsOTPSent={smsOTPSent}");
      print(verId);
      print("fjnsdjjngjn$number");

      this.verificationId = verId;
      changeScreen(context, widget);
    };
    final PhoneVerificationCompleted verificationCompleted =
        (AuthCredential phoneAuthCredential) {
      _auth
          .signInWithCredential(phoneAuthCredential)
          .then((UserCredential value) {
        if (value.user != null) {
          // Handle loogged in state

          // _userService.createUser(userDataModel);
          // _userDataProvider.imageUploadHandler();
          // print(userDataModel.mobileNumber.toString() + "mobileNUmber");

          // print(userDataModel);

          showToast(message: 'SUCCESS1', context: context);

          print(value.user.phoneNumber);
          changeScreenReplacement(context, afterOtpWidget);

          print(value.user.phoneNumber);
        } else {
          showToast(
            context: context,
            message: "Error validating OTP, try again",
          );
        }
      }).catchError((error) {
        showToast(
          context: context,
          message: "Try again in sometime",
        );
      });
    };
    print(smsOTPSent);
    print("fjnsdjjngjn$number");
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: '+91$number', // PHONE NUMBER TO SEND OTP

          codeAutoRetrievalTimeout: (String verId) {
            this.verificationId = verId;
          },
          codeSent:
              smsOTPSent, // WHEN CODE SENT THEN WE OPEN DIALOG TO ENTER OTP.
          timeout: const Duration(seconds: 60),
          verificationCompleted: verificationCompleted,
          verificationFailed: (FirebaseAuthException exceptio) {
            print('${exceptio.message} + something is wrong');
          });
    } catch (e) {
      handleError(e, context);
      errorMessage = e.toString();
      notifyListeners();
    }
  }

  handleError(error, BuildContext context) {
    print(error);
    errorMessage = error.toString();
    notifyListeners();
    switch (error.code) {
      case 'ERROR_INVALID_VERIFICATION_CODE':
        print("The verification code is invalid");
        break;
      default:
        errorMessage = error.message;
        break;
    }
    notifyListeners();
  }

  // void createNormalUser({UserDataModel user}) {
  //   _userServicse.createUser({
  //     "number": number,
  //     "first_name": firstName,
  //     "last_name": lastName,
  //     "role": "user",
  //   });
  // }

  // void createAdminUser(
  //     {String firstName,
  //     String lastName,
  //     String number,
  //     String garageName,
  //     GeoPoint garageLocation}) {
  //   _userServicse.createUser({
  //     "number": number,
  //     "garage_name": garageName,
  //     "garage_location": garageLocation,
  //     "first_name": firstName,
  //     "last_name": lastName,
  //     "role": "admin",
  //   });
  // }

  // void createUser(
  //     {String phoneNumber, String callFrom, Map<String, dynamic> values}) {
  //   createNormalUser(
  //     firstName: values["first_name"],
  //     // id: id,
  //     number: phoneNumber,
  //     lastName: values["last_name"],
  //   );
  // }

  Future<void> otpVerify({
    BuildContext context,
    Widget widget,
    //  UserDataModel userDataModel,
    String smsOTP,
  }) async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsOTP,
      );
      _auth.signInWithCredential(credential).then((user) async {
        print(user);
        if (user.user != null) {
          loading = true;
          notifyListeners();
          print(userDataModel.mobileNumber.toString());
          if (userDataModel != null) {
            // _userDataProvider.imageUploadHandler();
            print("userDataModel in auth.dart" + userDataModel.name.toString());
            _userService.createUser(userDataModel);
            print(userDataModel.mobileNumber.toString() + "mobileNUmber");
            showToast(message: 'SUCCESS3', context: context);
            print(user.user.phoneNumber);
            loading = false;
            notifyListeners();
            changeScreenReplacement(context, widget);
          } else {
            print(user);

            showToast(message: 'SUCCESS4', context: context);

            print(user.user.phoneNumber);
            changeScreenReplacement(context, widget);
          }
        } else {
          showToast(message: 'You Enter Invalid OTP', context: context);
        }
      }).catchError((e) {
        print(e);
        showToast(message: 'You Enter Invalid Otp', context: context);
      });
    } catch (e) {
      print("${e.toString()}");
    }
  }

  Future signOut() async {
    _auth.signOut();
    // _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }
}
