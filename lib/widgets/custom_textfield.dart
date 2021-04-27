import 'package:app_1/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final String label;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool prefix;
  final IconData icon;
  final Function validator;

  double _width;

  CustomTextField({
    this.hint,
    @required this.label,
    this.validator,
    this.textEditingController,
    this.keyboardType,
    this.icon,
    this.prefix = false,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    return Material(
      borderRadius: BorderRadius.circular(30.0),
      elevation: 10,
      child: TextFormField(
        controller: textEditingController,
        validator: validator,
        keyboardType: keyboardType,
        cursorColor: kPrimaryColor,
        // maxLength: maxlength,

        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: kPrimaryColor, size: 20),
          hintText: hint,
          labelText: label,
          contentPadding: EdgeInsets.only(top: 10.0, bottom: 0.0),
          prefixText: prefix ? "+91" : "",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          errorMaxLines: 1,
        ),
      ),
    );
  }
}

String validateMobile(String value) {
// Indian Mobile number are of 10 digit only
  if (value.length != 10)
    return 'Mobile Number must be of 10 digit';
  else
    return null;
}

String validateName(String value) {
  if (value.length < 3)
    return 'Name must be more than 2 charater';
  else
    return null;
}
