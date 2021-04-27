import 'dart:io';

import 'package:app_1/models/user_model.dart';
import 'package:app_1/services/storage_service.dart';
import 'package:app_1/services/user_service.dart';
import 'package:flutter/foundation.dart';

class UserDataProvider extends ChangeNotifier {
  String currentUserId;
  String userProfileImageUrl;
  UserDataModel userDataModel = UserDataModel();
  bool isSignInModeOn = true;
  UserServices _userServicse = UserServices();

  void setUserData(UserDataModel user) {
    userDataModel = UserDataModel.copy(user);

    print(userDataModel.mobileNumber);
    print(userDataModel.profileImageUrl);
    notifyListeners();
  }

  void setSignInMode(bool value) {
    isSignInModeOn = value;
    notifyListeners();
  }

  // void setUserProfileImage(String uploadedProfileImage) {
  //   userProfileImage = uploadedProfileImage;
  //   notifyListeners();
  // }

  void imageUploadHandler() async {
    userProfileImageUrl = await StorageService.uploadUserProfileImage(
      imageFile: File(userDataModel.profileImageUrl),
      url: null,
    );
    print(userProfileImageUrl);
    UserDataModel temp = UserDataModel(
        mobileNumber: userDataModel.mobileNumber,
        name: userDataModel.name,
        profileImageUrl: userProfileImageUrl);
    userDataModel = temp;
    _userServicse.createUser(userDataModel);
    print(userDataModel.profileImageUrl);
    notifyListeners();
  }
}
