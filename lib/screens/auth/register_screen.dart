import 'dart:developer';
import 'package:bpro/controller/auth_controller.dart';
import 'package:bpro/controller/bpro_controller.dart';
import 'package:bpro/extensions/size_extention.dart';
import 'package:bpro/extensions/sizebox_extention.dart';
import 'package:bpro/utils/app_colors.dart';
import 'package:bpro/utils/app_images.dart';
import 'package:bpro/widgets/custom_checkbox.dart';
import 'package:bpro/widgets/custom_dialogue_box.dart';
import 'package:bpro/widgets/custom_text.dart';
import 'package:bpro/widgets/custom_textfield.dart';
import 'package:bpro/widgets/custombutton.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final BproController bproController = Get.put(BproController());
  final AuthController authController = Get.find();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          // Background Image
          SizedBox(
            height: context.screenHeight,
            width: double.infinity,
            child: Image.asset(
              AppImages.background,
              fit: BoxFit.cover,
            ),
          ),
          // Register Heading
          Positioned(
            left: 30,
            top: context.heightPercentage(0.12),
            child: CustomText(
              text: "Register",
              color: AppColors.white,
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),

          Positioned(
            top: context.heightPercentage(0.22),
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: AppColors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Name Field
                        customTextField(
                          controller: authController.name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your name";
                            }
                            return null;
                          },
                          prefixIcon: Icon(
                            Icons.person,
                            size: 25,
                            color: AppColors.appPrimaryColor,
                          ),
                          hintText: "Enter your name",
                        ),
                        16.height,
                        // Username Field
                        customTextField(
                          controller: authController.username,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your username";
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
                        // Email Field
                        customTextField(
                            controller: authController.email,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your email";
                              }
                              return null;
                            },
                            prefixIcon: Icon(
                              Icons.email,
                              size: 25,
                              color: AppColors.appPrimaryColor,
                            ),
                            hintText: "Enter your email",
                            keyboardType: TextInputType.emailAddress),
                        16.height,
                        //phone number

                        // Confirm Password Field
                        customTextField(
                          controller: authController.phone,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your phone number";
                            }
                            return null;
                          },
                          prefixIcon: Icon(
                            Icons.phone,
                            size: 22,
                            color: AppColors.appPrimaryColor,
                          ),
                          hintText: "Enter your phone number",
                        ),
                        18.height,

                        // Password Field
                        customTextField(
                          controller: authController.password,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your password";
                            }
                            return null;
                          },
                          prefixIcon: Icon(
                            Icons.lock,
                            size: 22,
                            color: AppColors.appPrimaryColor,
                          ),
                          hintText: "Enter your password",
                        ),
                        16.height,
                        // Confirm Password Field
                        customTextField(
                          controller: authController.confirmpassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your confirm password";
                            }
                            return null;
                          },
                          prefixIcon: Icon(
                            Icons.lock,
                            size: 22,
                            color: AppColors.appPrimaryColor,
                          ),
                          hintText: "Enter your confirm password",
                        ),
                        18.height,
                        Row(
                          children: [
                            CustomCheckbox(onChanged: (value) {
                              if (authController.check = value!) {
                                log("Check ${authController.check}");
                              } else {
                                log("not check ${authController.check}");
                              }
                            }),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: context.heightPercentage(0.021)),
                                child: RichText(
                                  text: TextSpan(
                                    text: 'I am agree to the ',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.darkGrey,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Privacy Policy',
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            bproController.launchUrl(
                                                "https://www.monmatics.com/");
                                          },
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.appPrimaryColor,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' and ',
                                        style: TextStyle(
                                          color: AppColors.darkGrey,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Term & Conditions',
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            bproController.launchUrl(
                                                "https://www.monmatics.com/");
                                          },
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.appPrimaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 15),
                          child: CustomText(
                            text: "Disclaimer",
                            color: AppColors.darkGrey,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
                                  text: "Register",
                                  color: AppColors.white,
                                  fontSize: 16,
                                  backgroundColor: AppColors.appPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                  borderRadius: 10,
                                  border: Colors.transparent,
                                  onPressed: () {
                                    authController.userRegister();

                                    if (_formkey.currentState!.validate()) {
                                      if (!authController.check) {
                                        Get.dialog(
                                          customDialogueBox(
                                            context,
                                            "Please accept the Privacy Policy and Terms & Conditions before proceeding.",
                                          ),
                                        );
                                      } else {
                                        authController.userRegister();
                                      }
                                    }
                                  },
                                );
                        }),
                        20.height,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
