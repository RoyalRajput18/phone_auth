import 'package:phone_auth/constants/variable.dart';

class UserDataModel {
  final String name;
  final String profileImageUrl;

  final String mobileNumber;

  UserDataModel({
    this.name,
    this.profileImageUrl,
    this.mobileNumber,
  });

  factory UserDataModel.fromDocs(Map<String, dynamic> doc) {
    return UserDataModel(
      name: doc['name'],
      profileImageUrl: doc['profileImageUrl'] ?? '',
      mobileNumber: doc['mobileNumber'],
    );
  }
  factory UserDataModel.copy(UserDataModel user) {
    var data = Map<String, dynamic>();
    data['name'] = user.name;
    data['profileImageUrl'] = user.profileImageUrl;
    print("====USER MOBILE====" + user.mobileNumber.toString());
    data['mobileNumber'] = user.mobileNumber.toString();

    return UserDataModel(
      name: data['name'],
      profileImageUrl: data['profileImageUrl'] ?? '',
      mobileNumber: data['mobileNumber'],
    );
  }
  Map toMap(UserDataModel user) {
    var data = Map<String, dynamic>();
    data['name'] = user.name;
    data['profileImageUrl'] = user.profileImageUrl;
    data['mobileNumber'] = user.mobileNumber;
    return data;
  }
}

class ClientDataModel {
  final String role;
  final String profileImageUrl;
  final String name;
  final String mobileNumber;

  ClientDataModel({
    this.profileImageUrl,
    this.role = "client",
    this.name,
    this.mobileNumber,
  });

  factory ClientDataModel.fromDocs({Map<String, dynamic> doc}) {
    return ClientDataModel(
      name: doc['name'] ?? "name",
      profileImageUrl: doc['clientProfileImageUrl'] ?? "",
      mobileNumber: doc['mobileNumber'],
      role: doc["role"],
    );
  }

  Map toMap({ClientDataModel client}) {
    var data = Map<String, dynamic>();

    data['firstName'] = client.name;
    data['clientProfileImageUrl'] = client.profileImageUrl;
    data['mobileNumber'] = client.mobileNumber;
    data['role'] = "client";
    return data;
  }
}

class AdminDataModel {
  final String role;
  final String profileImageUrl;
  final String name;

  final String permenantRegistrationNumber;

  final String mobileNumber;

  AdminDataModel({
    this.role = "admin",
    this.name,
    this.mobileNumber,
    this.permenantRegistrationNumber,
    this.profileImageUrl,
  });

  factory AdminDataModel.fromDocs({Map<String, dynamic> document}) {
    Variable variable = Variable();
    return AdminDataModel(
      name: document[variable.name],
      mobileNumber: document[variable.mobileNumber],
      permenantRegistrationNumber:
          document[variable.permenantRegistrationNumber],
      profileImageUrl: document[variable.profileImageUrl],
      role: document["role"],
    );
  }

  Map toMap({AdminDataModel admin}) {
    var document = Map<String, dynamic>();

    document["name"] = admin.name;
    document["mobileNumber"] = admin.mobileNumber;

    document["permenantRegistrationNumber"] = admin.permenantRegistrationNumber;
    document["profileImageUrl"] = admin.profileImageUrl;
    document["role"] = "admin";
    return document;
  }
}
