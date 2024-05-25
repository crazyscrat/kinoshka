import 'package:flutter/material.dart';

abstract class AppTextStyle{
  static const title = TextStyle(color: Colors.white);
  static const movieName = TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500);
  static const rating =  TextStyle(color: Colors.grey);
  static const authInfoHeader = TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500);
  static const authInfo = TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400);

  static const loginBtnText = TextStyle(color: AppTextStyle.authBtnTextWhite, fontSize: 16, fontWeight: FontWeight.w800);
  static const loginResetBtnText = TextStyle(color: AppTextStyle.authBtnTextDark, fontSize: 16, fontWeight: FontWeight.w400);

  static const authBtnTextWhite = Colors.white;
  static const authBtnTextDark = Color.fromARGB(255, 1, 180, 228);

  static const playTrailerText = TextStyle(color: Colors.black, fontSize: 16);
}