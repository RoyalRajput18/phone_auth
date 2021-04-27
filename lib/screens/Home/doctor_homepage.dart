import 'package:app_1/constants/colors.dart';
import 'package:app_1/constants/config.dart';
import 'package:app_1/constants/screen_navigation.dart';
import 'package:app_1/widgets/bottombar.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../settings/settings.dart';

class DoctorHomePage extends StatefulWidget {
  @override
  _DoctorHomePageState createState() => _DoctorHomePageState();
}

class _DoctorHomePageState extends State<DoctorHomePage> {
  var currentIndex = 0;
  @override
  void initState() {
    // todo: implement initState
    super.initState();
    currentIndex = 0;
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      bottomNavigationBar: BubbleBottomBar(
        opacity: .2,
        currentIndex: currentIndex,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        elevation: 8,
        onTap: changePage,
        //new
        hasNotch: false,
        //new
        hasInk: true,
        //new, gives a cute ink effect
        inkColor: t2_colorPrimaryLight,
        //optional, uses theme color if not specified
        items: <BubbleBottomBarItem>[
          tab(Icons.home, "Home"),
          tab(Icons.favorite_border, "Appoinments"),
          tab(Icons.person_outline, "Setting"),
        ],
      ),
      body: IndexedStack(
        index: currentIndex,
        children: [
          DoctorPage(),
          Settings(),
        ],
      ),
    );
  }
}

class DoctorPage extends StatefulWidget {
  @override
  _DoctorPageState createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin"),
        actions: [
          TextButton.icon(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
            label: Text(
              'Logout',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Tasks for Today",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        " 4 out of 6 Completed",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                  Icon(Icons.ac_unit),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              physics: const AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 25.0,
                crossAxisSpacing: 25.0,
                childAspectRatio: 1.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 80,
                  // child: GestureDetector(
                  //   onTap: () => changeScreen(
                  //       context, doctorHomePageMenuList[index].widget),
                  //   child: Card(
                  //     elevation: 6,
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(20),
                  //     ),
                  //     child: Column(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         CircleAvatar(
                  //           radius: 30,
                  //           backgroundColor: Colors.transparent,
                  //           backgroundImage: AssetImage(
                  //             doctorHomePageMenuList[index].imageUrl,
                  //           ),
                  //         ),
                  //         SizedBox(
                  //           height: 10,
                  //         ),
                  //         Text(
                  //           doctorHomePageMenuList[index].name,
                  //           textAlign: TextAlign.center,
                  //           style: TextStyle(
                  //             fontWeight: FontWeight.w600,
                  //             fontSize: 16,
                  //             letterSpacing: 0.27,
                  //             color: DesignCourseAppTheme.darkerText,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                );
              },
              // itemCount: doctorHomePageMenuList.length,
            ),
          ],
        ),
      ),
    );
  }
}
