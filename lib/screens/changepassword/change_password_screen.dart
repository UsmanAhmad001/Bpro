import 'package:bpro/controller/auth_controller.dart';
import 'package:bpro/extensions/size_extention.dart';
import 'package:bpro/extensions/sizebox_extention.dart';
import 'package:bpro/utils/app_colors.dart';
import 'package:bpro/utils/app_images.dart';
import 'package:bpro/widgets/custom_appbar.dart';
import 'package:bpro/widgets/custom_text.dart';
import 'package:bpro/widgets/custom_textfield.dart';
import 'package:bpro/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});
  final AuthController authController = Get.find();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Change Password"),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.background),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
            child: Obx(() {
              return authController.loading.value
                  ? Center(
                      child: CircularProgressIndicator(
                      color: AppColors.appPrimaryColor,
                    ))
                  : Form(
                      key: _formkey,
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
                            isPassword: true,
                            obscureText: authController.hidepassword.value,
                            onSuffixTap: authController.showPassword,
                            controller: authController.changePassword,
                            bordercolor: AppColors.appPrimaryColor,
                            focusedBorderColor: AppColors.appPrimaryColor,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your password";
                              }
                              return null;
                            },
                            prefixIcon: Icon(
                              Icons.lock,
                              size: 25,
                              color: AppColors.appPrimaryColor,
                            ),
                            hintText: "Enter your password",
                            hintStyle:
                                TextStyle(color: AppColors.appPrimaryColor),
                          ),
                          16.height,
                          customTextField(
                            isPassword: true,
                            obscureText:
                                authController.confirmhidepassword.value,
                            onSuffixTap: authController.showConfirmPassword,
                            controller: authController.updatePassword,
                            bordercolor: AppColors.appPrimaryColor,
                            focusedBorderColor: AppColors.appPrimaryColor,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please re-enter your password";
                              }
                              return null;
                            },
                            prefixIcon: Icon(
                              Icons.lock,
                              size: 25,
                              color: AppColors.appPrimaryColor,
                            ),
                            hintText: "Re-enter password",
                            hintStyle:
                                TextStyle(color: AppColors.appPrimaryColor),
                          ),
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
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {
                                if (authController.changePassword.text ==
                                    authController.updatePassword.text) {
                                  authController.updateUserPassword();
                                } else {
                                  Get.snackbar(
                                      snackPosition: SnackPosition.BOTTOM,
                                      'Password Mismatch!',
                                      'Please enter correct password and confirm password',
                                      colorText: AppColors.white,
                                      backgroundColor: AppColors.charcoalgrey);
                                }
                              }
                            },
                          ),
                        ],
                      ),
                    );
            }),
          ),
        ),
      ),
    );
  }
}
