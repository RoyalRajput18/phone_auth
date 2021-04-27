import 'package:app_1/constants/colors.dart';
import 'package:flutter/material.dart';

Widget getSearchBarUI() {
  return Padding(
    padding: const EdgeInsets.only(left: 14, right: 14.0),
    child: Material(
      borderRadius: BorderRadius.circular(30.0),
      elevation: 10,
      child: TextFormField(
        keyboardType: TextInputType.text,
        cursorColor: kPrimaryColor,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: kPrimaryColor, size: 20),
          hintText: "Search for Doctors",
          labelText: "Search",
          contentPadding: EdgeInsets.only(top: 10.0, bottom: 0.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          errorMaxLines: 1,
        ),
        autofocus: false,
        enabled: false,
        // enableInteractiveSelection: false,
        onEditingComplete: () {},
      ),
    ),
  );
}
