import 'package:bpro/extensions/size_extention.dart';
import 'package:bpro/extensions/sizebox_extention.dart';
import 'package:bpro/utils/app_colors.dart';
import 'package:bpro/utils/app_images.dart';
import 'package:bpro/widgets/custom_appbar.dart';
import 'package:bpro/widgets/custom_text.dart';
import 'package:bpro/widgets/custom_textfield.dart';
import 'package:bpro/widgets/custombutton.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Forget Password"),
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
            padding: const EdgeInsets.only(left: 10,right: 10,top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Reset Your Password",
                  color: AppColors.appPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
                4.height,
                CustomText(
                  text:
                      "Enter your registered email address below, and we'll send you a link to reset your password",
                  color: AppColors.appPrimaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
                20.height,
                customTextField(
                    bordercolor: AppColors.appPrimaryColor,
                    focusedBorderColor: AppColors.appPrimaryColor,
                    prefixIcon: Icon(
                      Icons.email,
                      size: 25,
                      color: AppColors.appPrimaryColor,
                    ),
                    hintText: "Enter your email address",
                    hintStyle: TextStyle(color: AppColors.appPrimaryColor)),
                
                20.height,
                CustomButton(
                  height: 50,
                  width: context.screenWidth,
                  text: "Send Reset Link",
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
