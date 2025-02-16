import 'package:bpro/screens/auth/login_screen.dart';
import 'package:bpro/utils/app_colors.dart';
import 'package:bpro/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

customDialogueBox(BuildContext context, String message) {
  Widget cancelButton = TextButton(
    child: CustomText(
        text: "Cancel", color: AppColors.white, fontWeight: FontWeight.bold),
    onPressed: () {
      Get.back();
    },
  );
  Widget continueButton = TextButton(
    child: CustomText(
      text: "Continue",
      color: AppColors.white,
      fontWeight: FontWeight.bold,
    ),
    onPressed: () {
      Get.to(LoginScreen());
    },
  );

  AlertDialog alert = AlertDialog(
    backgroundColor: AppColors.appPrimaryColor,
    // title: CustomText(text: "Alert Box", color: AppColors.white),
    title: CustomText(
      text: message,
      color: AppColors.white,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
