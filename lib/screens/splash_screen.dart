import 'package:app_1/constants/colors.dart';
import 'package:app_1/constants/config.dart';
import 'package:app_1/constants/screen_navigation.dart';
// import 'package:drapp/constants/colors.dart';
// import 'package:drapp/constants/config.dart';
// import 'package:drapp/constants/screen_navigation.dart';
// import 'package:drapp/screens/Home/homepage_patient.dart';
// import 'package:drapp/screens/Patient/doctorlist.dart';
// import 'package:drapp/screens/doctor/doctor_homepage.dart';
// import 'package:drapp/screens/appointments/book_appointment.dart';
// import 'package:drapp/screens/authentication/doctors/signup_doctors/signup_doctor1.dart';
// import 'package:drapp/screens/authentication/signin_patient.dart';
// import 'package:drapp/screens/mainpage_patient.dart';
import 'package:flutter/material.dart';

import 'authentication/signin_patient.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(8.0),
        color: kWhiteColor,
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              height: SizeConfig.blockSizeVertical * 40,
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                // color: Colors.blueAccent,
                image: DecorationImage(
                    image: AssetImage(
                  'assets/online_doctor.gif',

                  // fit: BoxFit.cover,
                  // alignment: Alignment.center,
                )),
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight / 150,
            ),
            Text(
              "Find your\nSymptoms",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              "Make your doctor appointment as\neasy as post a status from your\nFacebook",
              style: TextStyle(color: Colors.black, fontSize: 17),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: SizeConfig.screenHeight / 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 28.0),
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Provider.of<AuthProvider>(context, listen: false)
                    //     .authRoute(context);

                    changeScreen(context, SignInPage());
                    // changeScreen(context, MainPagePatient());
                    // changeScreen(context, DoctorHomePage());
                    //changeScreen(context, DoctorListViewPage());
                    //   changeScreen(context, AppointmentBookingPage());
                  },
                  child: Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(14),
                    child: Container(
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      height: 50,
                      width: 180,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          Center(
                            child: Text("Next",
                                style: TextStyle(
                                  color: kWhiteColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: SizeConfig.screenHeight / 40,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: Icon(
                              Icons.arrow_forward,
                              color: kWhiteColor,
                              size: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
