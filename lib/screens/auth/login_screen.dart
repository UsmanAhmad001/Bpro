import 'package:bpro/controller/auth_controller.dart';
import 'package:bpro/extensions/size_extention.dart';
import 'package:bpro/extensions/sizebox_extention.dart';
import 'package:bpro/screens/auth/forget_password.dart';
import 'package:bpro/screens/auth/register_screen.dart';
import 'package:bpro/utils/app_colors.dart';
import 'package:bpro/utils/app_images.dart';
import 'package:bpro/widgets/custom_text.dart';
import 'package:bpro/widgets/custom_textfield.dart';
import 'package:bpro/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final AuthController authController = Get.find();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            height: context.screenHeight,
            width: double.infinity,
            child: Image.asset(
              AppImages.background,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 30,
            top: context.heightPercentage(0.18),
            child: CustomText(
              text: "Login",
              color: AppColors.white,
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
          Positioned(
              top: context.heightPercentage(0.3),
              left: 0,
              right: 0,
              child: Container(
                height: 1000,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: AppColors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customTextField(
                          controller: authController.loginusername,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your email";
                            }
                            return null;
                          },
                          prefixIcon: Icon(
                            Icons.person,
                            size: 25,
                            color: AppColors.appPrimaryColor,
                          ),
                          hintText: "Enter your username",
                        ),
                        16.height,

                        customTextField(
                          controller: authController.loginpassword,
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
                        ),

                        18.height,
                        Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () {
                                Get.to(ForgetPasswordScreen());
                              },
                              child: CustomText(
                                  text: "Forget Password?",
                                  color: AppColors.darkGrey),
                            )),
                        20.height,
                        // Register Button
                        Obx(() {
                          return authController.loading.value
                              ? Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.appPrimaryColor,
                                  ),
                                )
                              : CustomButton(
                                  height: 50,
                                  width: context.screenWidth,
                                  text: "Login",
                                  color: AppColors.white,
                                  fontSize: 16,
                                  backgroundColor: AppColors.appPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                  borderRadius: 10,
                                  border: Colors.transparent,
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      authController.userLogin();
                                      authController.saveUserData();
                                     // authController.userApi();
                                    }
                                  },
                                );
                        }),
                        20.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: "Don't have an account?",
                              color: AppColors.darkGrey,
                            ),
                            5.width,
                            GestureDetector(
                              onTap: () {
                                Get.to(RegisterScreen());
                              },
                              child: CustomText(
                                text: "Register",
                                color: AppColors.appPrimaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        30.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppImages.whattasapplogo,
                              height: 35,
                            ),
                            15.width,
                            Tooltip(
                              message: "Help",
                              child: Icon(
                                Icons.help,
                                size: 30,
                                color: AppColors.appPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
