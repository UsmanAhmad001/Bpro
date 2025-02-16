import 'package:bpro/extensions/size_extention.dart';
import 'package:bpro/extensions/sizebox_extention.dart';
import 'package:bpro/utils/app_colors.dart';
import 'package:bpro/utils/app_images.dart';
import 'package:bpro/widgets/custom_appbar.dart';
import 'package:bpro/widgets/custom_text.dart';
import 'package:bpro/widgets/custom_textfield.dart';
import 'package:bpro/widgets/custombutton.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Change Password"),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  AppImages.background,
                ),
                fit: BoxFit.cover)),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Padding(
            padding: const EdgeInsets.only(left: 10,right: 10,top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Set a new password",
                  color: AppColors.appPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
                4.height,
                CustomText(
                  text:
                      "Create a new password. Ensure it differs from previous ones for security",
                  color: AppColors.appPrimaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
                20.height,
                customTextField(
                    bordercolor: AppColors.appPrimaryColor,
                    focusedBorderColor: AppColors.appPrimaryColor,
                    prefixIcon: Icon(
                      Icons.lock,
                      size: 25,
                      color: AppColors.appPrimaryColor,
                    ),
                    hintText: "Enter your password",
                    hintStyle: TextStyle(color: AppColors.appPrimaryColor)),
                16.height,
                customTextField(
                    bordercolor: AppColors.appPrimaryColor,
                    focusedBorderColor: AppColors.appPrimaryColor,
                    prefixIcon: Icon(
                      Icons.lock,
                      size: 25,
                      color: AppColors.appPrimaryColor,
                    ),
                    hintText: "Re-enter password",
                    hintStyle: TextStyle(color: AppColors.appPrimaryColor)),
                20.height,
                CustomButton(
                  height: 50,
                  width: context.screenWidth,
                  text: "Update Password",
                  color: AppColors.white,
                  fontSize: 16,
                  backgroundColor: AppColors.appPrimaryColor,
                  fontWeight: FontWeight.bold,
                  borderRadius: 10,
                  border: AppColors.appPrimaryColor,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
