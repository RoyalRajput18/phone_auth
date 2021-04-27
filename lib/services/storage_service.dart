import 'dart:io';

import 'package:app_1/constants/config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class StorageService {
  static Future<String> uploadUserProfileImage(
      {String url, File imageFile}) async {
    String photoId = Uuid().v4();
    File image = await compressImage(photoId, imageFile);

    if (url != null) {
      // Updating user profile image
      RegExp exp = RegExp(r'userProfile_(.*).jpg');
      photoId = exp.firstMatch(url)[1];
    }
    FirebaseAuth _auth = FirebaseAuth.instance;
    //  var userId = _auth.currentUser.phoneNumber.substring(3);
    UploadTask uploadTask =
        storageRef.child("profiles/" + "____" + "$photoId.jpg").putFile(image);

    String downloadUrl = await (await uploadTask).ref.getDownloadURL();
    return downloadUrl;
  }
// Future uploadFile(String uploadedFileUrl,File image) async {
//    StorageReference storageReference = FirebaseStorage.instance
//        .ref()
//        .child('profiles/${Path.basename(image.path)}}');
//    StorageUploadTask uploadTask = storageReference.putFile(image);
//    await uploadTask.onComplete;
//    print('File Uploaded');
//    storageReference.getDownloadURL().then((fileURL) {
//      setState(() {
//        _uploadedFileURL = fileURL;
//      });
//    });
//  }

  static Future<File> compressImage(String photoId, File image) async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    File compressedImageFile = await FlutterImageCompress.compressAndGetFile(
      image.absolute.path,
      '$path/img_$photoId.jpg',
      quality: 70,
    );
    return compressedImageFile;
  }

  // static Future<String> uploadPost(
  //   File imageFile,
  // ) async {
  //   String photoId = Uuid().v4();
  //   File image = await compressImage(photoId, imageFile);
  //   FirebaseAuth _auth = FirebaseAuth.instance;
  //   var userId = _auth.currentUser.phoneNumber.substring(3);
  //   StorageUploadTask uploadTask = storageRef
  //       .child("images/posts/$userId" + "_" + "$photoId.jpg")
  //       .putFile(image);
  //   StorageTaskSnapshot storageSnap = await uploadTask.onComplete;
  //   print('File Uploaded');
  //   String returnURL;
  //   await storageSnap.ref.getDownloadURL().then((fileURL) {
  //     returnURL = fileURL;
  //   });
  //   return returnURL;
  // }
}
