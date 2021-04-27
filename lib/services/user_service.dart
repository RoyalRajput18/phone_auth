import 'dart:io';
import 'package:app_1/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';

class UserServices {
  String collection = "user";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void createUser(UserDataModel userDataModel) {
    String id = userDataModel.mobileNumber.toString();
    print(id);
    _firestore
        .collection(collection)
        .doc(id)
        .set(userDataModel.toMap(userDataModel));
  }

  Future<void> createPatient({PatientDataModel patientDataModel}) {
    _firestore
        .collection('user')
        .doc(patientDataModel.mobileNumber.toString())
        .set(patientDataModel.toMap(patient: patientDataModel));
  }

  Future<void> createDoctor({DoctorDataModel doctorDataModel}) {
    _firestore
        .collection('user')
        .doc(doctorDataModel.mobileNumber.toString())
        .set(doctorDataModel.toMap(doctor: doctorDataModel));
  }

  void updateUserData(Map<String, dynamic> values) {
    _firestore.collection(collection).doc(values['number']).update(values);
  }

  Future<DocumentSnapshot> getUserById(String id) =>
      _firestore.collection(collection).doc(id).get().then((doc) {
        if (!doc.exists) {
          return null;
        }
        return doc;
      }).catchError((onError) => print(onError.toString()));
}
