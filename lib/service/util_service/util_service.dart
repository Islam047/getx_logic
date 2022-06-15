import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static fireSnackGetX(String msg) {
    Get.snackbar(
      '',
      '',
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.FLOATING,
      messageText: Text(
        msg,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        textAlign: TextAlign.center,
      ),
      titleText: Container(),
      margin: const EdgeInsets.only(
          bottom: kBottomNavigationBarHeight, left: 50, right: 50),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      borderRadius: 50,
      backgroundColor: Colors.grey.shade500.withOpacity(0.9),
      colorText: Colors.white,
    );
  }

  // FireSnackBar
  static fireSnackBar(String msg, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.grey.shade400.withOpacity(0.975),
        content: Text(msg, style: const TextStyle(color: Colors.white, fontSize: 16),
          textAlign: TextAlign.center,),
        duration: const Duration(milliseconds: 2500),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        shape: const StadiumBorder(),
      ),
    );
  }

}