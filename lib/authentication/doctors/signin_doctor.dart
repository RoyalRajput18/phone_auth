// import 'package:drapp/constants/colors.dart';
// import 'package:drapp/constants/config.dart';
// import 'package:drapp/constants/string.dart';
// import 'package:drapp/widgets/custom_textfield.dart';
// import 'package:flutter/material.dart';

// class SignInDoctorPage extends StatefulWidget {
//   @override
//   _SignInDoctorPageState createState() => _SignInDoctorPageState();
// }

// class _SignInDoctorPageState extends State<SignInDoctorPage> {
//   double _height;
//   double _width;
//   bool isTermsAndConditionAccepted;
//   TextEditingController phoneNumberController = TextEditingController();

//   GlobalKey<FormState> _key = GlobalKey();
//   TextEditingController firstNameController = TextEditingController();
//   TextEditingController lastNameController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     _height = SizeConfig.screenHeight;
//     _width = SizeConfig.screenWidth;
//     return Scaffold(
//       body: Container(
//         width: SizeConfig.screenWidth,
//         height: SizeConfig.screenHeight,
//         color: kWhiteColor,
//         child: Column(
//           children: [
//             //  SizedBox(height: 0),

//             Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           margin: EdgeInsets.only(
//                               left: _width / 20, top: _height / 100),
//                           child: Row(
//                             children: <Widget>[
//                               Text(
//                                 tWelcomeBack,
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 30,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           alignment: Alignment.centerLeft,
//                           margin: EdgeInsets.only(left: _width / 15.0),
//                           child: Row(
//                             children: <Widget>[
//                               Text(
//                                 tLoginInToContinue,
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.w200,
//                                   fontSize: 17,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
// //                     Column(
// //                       mainAxisSize: MainAxisSize.min,
// //                       children: [
// // //                                   Material(
// // //                                     elevation: 10,
// // //                                     borderRadius: BorderRadius.circular(40),
// // //                                     child: Container(
// // //                                       height: SizeConfig.blockSizeVertical * 9,
// // //                                       width:
// // //                                           SizeConfig.blockSizeHorizontal * 18,
// // //                                       alignment: Alignment.center,
// // //                                       decoration: BoxDecoration(
// // //                                         // border: Border.all(
// // //                                         //   color: Colors.black,
// // //                                         // ),
// // //                                         borderRadius: BorderRadius.circular(40),
// // // //                                      color: Colors.white,
// // //                                         // shape: BoxShape.circle,
// // //                                       ),
// // //                                       child: GestureDetector(
// // //                                           onTap: () {
// // //                                             print('Adding photo');
// // //                                           },
// // //                                           child: Icon(
// // //                                             Icons.add_a_photo,
// // //                                             size: 27,
// // //                                             color: kFirstPrimaryGradientColor,
// // //                                           )),
// // //                                     ),
// // //                                   ),
// //                         Container(
// //                           child: RaisedButton(
// //                             onPressed: () {},
// //                             child: Center(child: Icon(Icons.add_a_photo)),
// //                           ),
// //                         ),
// //                         Container(
// //                           child: Text("Add Profile Picture"),
// //                         ),
// //                       ],
// //                     ),
//                   ],
//                 ),
//               ],
//             ),

//             Center(
//               child: Container(
//                 margin: EdgeInsets.only(
//                   left: _width / 12.0,
//                   right: _width / 12.0,
//                 ),
//                 child: Form(
//                   key: _key,
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: <Widget>[
//                       // firstNameTextFormField(),
//                       // SizedBox(height: _height / 60.0),
//                       // lastNameTextFormField(),
//                       // SizedBox(height: _height / 60.0),
//                       phoneTextFormField(),
//                     ],
//                   ),
//                 ),
//               ),
//             ),

//             Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 20.0, right: 20),
//                   child: InkWell(
//                     // onTap: () {
//                     //   if (phoneNumberController.text.length != 10) {
//                     //     showToast("Enter Valid Mobile Number", context);
//                     //   } else {
//                     //     _userServicse.getUserById(phoneNumberController.text).then(
//                     //       (user) {
//                     //         if (user == null) {
//                     //           showToast(
//                     //               "PhoneNumber is Not Registered With Us Please Sign up first",
//                     //               context);
//                     //         } else {
//                     //           Provider.of<AuthProvider>(context, listen: false)
//                     //               .verifyPhoneNumber(
//                     //             context,
//                     //             phoneNumberController.text,
//                     //             VerifyPhone(
//                     //               phoneNumber: phoneNumberController.text,
//                     //               callFrom: widget.callFrom,
//                     //             ),
//                     //             screenRoute(phoneNumberController),
//                     //           );
//                     //         }
//                     //       },
//                     //     );
//                     //   }
//                     // },
//                     // onTap: () => changeScreen(context, MainPage()),
//                     child: Material(
//                       elevation: 10,
//                       borderRadius: BorderRadius.all(Radius.circular(25.0)),
//                       child: Container(
//                         alignment: Alignment.center,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.all(Radius.circular(25.0)),
//                           color: kPrimaryColor,
//                         ),
//                         padding: const EdgeInsets.all(15.0),
//                         child: Text(
//                           tLogIn,
//                           style: TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.bold,
//                               color: kWhiteColor),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 20.0, right: 20),
//                   child: InkWell(
//                     // onTap: () {
//                     //   if (phoneNumberController.text.length != 10) {
//                     //     showToast("Enter Valid Mobile Number", context);
//                     //   } else {
//                     //     _userServicse.getUserById(phoneNumberController.text).then(
//                     //       (user) {
//                     //         if (user == null) {
//                     //           showToast(
//                     //               "PhoneNumber is Not Registered With Us Please Sign up first",
//                     //               context);
//                     //         } else {
//                     //           Provider.of<AuthProvider>(context, listen: false)
//                     //               .verifyPhoneNumber(
//                     //             context,
//                     //             phoneNumberController.text,
//                     //             VerifyPhone(
//                     //               phoneNumber: phoneNumberController.text,
//                     //               callFrom: widget.callFrom,
//                     //             ),
//                     //             screenRoute(phoneNumberController),
//                     //           );
//                     //         }
//                     //       },
//                     //     );
//                     //   }
//                     // },
//                     child: Material(
//                       elevation: 10,
//                       borderRadius: BorderRadius.all(Radius.circular(25.0)),
//                       child: Container(
//                         alignment: Alignment.center,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.all(Radius.circular(25.0)),
//                           border: Border.all(
//                             color: kPrimaryColor,
//                           ),
//                         ),
//                         padding: const EdgeInsets.all(15.0),
//                         child: Text(
//                           tCreateAnAccount,
//                           style: TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.bold,
//                               color: kBlackColor),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget firstNameTextFormField() {
//     return CustomTextField(
//       validator: validateName,
//       textEditingController: firstNameController,
//       keyboardType: TextInputType.text,
//       icon: Icons.person,
//       label: "First Name",
//       hint: "First Name",
//     );
//   }

//   Widget lastNameTextFormField() {
//     return CustomTextField(
//       validator: validateName,
//       textEditingController: lastNameController,
//       keyboardType: TextInputType.text,
//       icon: Icons.person,
//       label: tLastName,
//       hint: "Last Name",
//     );
//   }

//   Widget acceptTermsTextRow() {
//     return Container(
//       margin: EdgeInsets.only(top: _height / 100.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Checkbox(
//               activeColor: Colors.orange[200],
//               value: isTermsAndConditionAccepted,
//               onChanged: (bool newValue) {
//                 setState(() {
//                   isTermsAndConditionAccepted = newValue;
//                 });
//               }),
//           Text(
//             "I accept all terms and conditions",
//             style: TextStyle(
//               fontWeight: FontWeight.w400,
//               fontSize: 11,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget phoneTextFormField() {
//     return CustomTextField(
//       textEditingController: phoneNumberController,
//       keyboardType: TextInputType.number,
//       prefix: true,
//       validator: validateMobile,
//       icon: Icons.phone,
//       hint: tMobileNumber,
//       label: "Mobile Number",
//     );
//   }
// }

// // Widget screenRoute(TextEditingController controller) {
// //   _userServicse.getUserById(controller.text).then((value) {
// //     if (value.exists) {
// //       print(value["role"]);
// //       if (value["role"] == "admin") {
// //         return AdminHomePage();
// //       } else {
// //         return HomePage();
// //       }
// //     }
// //   });
// // }
