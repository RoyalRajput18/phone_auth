import 'package:app_1/constants/colors.dart';
import 'package:app_1/screens/settings/settings.dart';
import 'package:app_1/widgets/bottombar.dart';

import 'package:flutter/material.dart';

import 'Home/homepage_patient.dart';

class MainPagePatient extends StatefulWidget {
  @override
  _MainPagePatientState createState() => _MainPagePatientState();
}

class _MainPagePatientState extends State<MainPagePatient> {
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
          HomePagePatient(),
          Settings(),
        ],
      ),
    );
  }
}
