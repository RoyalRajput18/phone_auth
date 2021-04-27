import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;
  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
  }
}

final _firestore = FirebaseFirestore.instance;
final storageRef = FirebaseStorage.instance.ref();
final usersRef = _firestore.collection('user');
final patientAppointmentRef = _firestore.collection('appointment');
final doctorAppointmentRef = _firestore.collection('appointment');

class Specialities {
  final String name;
  final String imageUrl;

  const Specialities(this.name, this.imageUrl);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Specialities &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() {
    return name;
  }
}

class Languages {
  final String language;

  const Languages(this.language);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Languages &&
          runtimeType == other.runtimeType &&
          language == other.language;

  @override
  int get hashCode => language.hashCode;

  @override
  String toString() {
    return language;
  }
}

const languages = <Languages>[
  Languages("English"),
  Languages("Hindi"),
  Languages("Gujarati"),
  Languages("Urdu"),
  Languages("French")
];

const specialities = <Specialities>[
  Specialities('Coronavirus related', 'assets/corona.jpg'),
  Specialities('General Surgery', 'assets/surgeon.png'),
  Specialities('Gynaecology', 'assets/gynecologist.png'),
  Specialities('General Physician', 'assets/md.png'),
  Specialities('Dermatology', 'assets/dermatology.png'),
  Specialities('Sexology', 'assets/sexologist.png'),
  Specialities('Psychiatry', 'assets/psychiatry.png'),
  Specialities('Stomach and digestive', 'assets/gastroenterology.png'),
  Specialities('Pediatrics', 'assets/pediatrics.png'),
  Specialities('Ear, Nose ,Throat', 'assets/ent.png'),
  Specialities('Kidney and urine', 'assets/urology.png'),
  Specialities('Orthopedic', 'assets/orthopedics.png'),
  Specialities('Neurology', 'assets/neurology.png'),
  Specialities('Cardiology', 'assets/cardiology.png'),
  Specialities('Diet and nutrition', 'assets/diet.png'),
  Specialities('Diabetes and endocrinology', 'assets/diabetes.png'),
  Specialities('Eye and Vision', 'assets/eye.png'),
  Specialities('Dental', 'assets/dentist.png'),
  Specialities('Breathing and chest', 'assets/monitoring.png'),
  Specialities('Ayurveda', 'assets/ayurveda.png'),
  Specialities('Homeopathy', 'assets/homeopathy.png'),
  Specialities('Canser', 'assets/cancer.png'),
  Specialities('Physiotherapy', 'assets/physiotherapy.png'),
  Specialities('Psychological Counselling', 'assets/stethoscope.png'),
  Specialities('Other disease', 'assets/stethoscope.png'),
];

class DoctorDisplayData {
  final String name;
  final String imageUrl;

  const DoctorDisplayData(this.name, this.imageUrl);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DoctorDisplayData &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() {
    return name;
  }
}

const doctorDisplayData = <DoctorDisplayData>[
  DoctorDisplayData('Coronavirus related', 'assets/corona.jpg'),
  DoctorDisplayData('Coronavirus related', 'assets/corona.jpg'),
  DoctorDisplayData('Coronavirus related', 'assets/corona.jpg'),
  DoctorDisplayData('Coronavirus related', 'assets/corona.jpg'),
  DoctorDisplayData('Coronavirus related', 'assets/corona.jpg'),
  DoctorDisplayData('Coronavirus related', 'assets/corona.jpg'),
  DoctorDisplayData('Coronavirus related', 'assets/corona.jpg'),
  DoctorDisplayData('Coronavirus related', 'assets/corona.jpg'),
  DoctorDisplayData('Coronavirus related', 'assets/corona.jpg'),
  DoctorDisplayData('Coronavirus related', 'assets/corona.jpg'),
];
const List<String> cities = [
  'Surat',
  'Gandhinagar',
  'Ahemedabad',
  "Vadodara",
  "Rajkot",
  "Amreli",
  "Bhavnagar",
  "Valsad",
  "Bharuch",
];

const List<String> timedataList = [
  "09:00AM",
  "09:30AM",
  "10:00AM",
  "10:30AM",
  "11:00AM",
  "11:30AM",
  "12:00PM",
  "12:30PM",
  "01:00PM",
  "01:30PM",
  "02:00PM",
  "02:30PM",
  "03:00PM",
  "03:30PM",
  "04:00PM",
  "04:30PM",
  "05:00PM",
  "05:30PM",
  "06:00PM",
  "06:30PM",
  "07:00PM",
  "07:30PM",
  "08:00PM",
];
// void showToast(message, BuildContext context) {
//   print(message);
//   Toast.show(message, context,
//       duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
// }

class DoctorHomePageMenu {
  final String name;
  final String imageUrl;
  final Widget widget;

  const DoctorHomePageMenu(this.name, this.imageUrl, this.widget);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DoctorHomePageMenu &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() {
    return name;
  }
}
