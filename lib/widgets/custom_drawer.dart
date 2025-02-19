import 'package:bpro/controller/auth_controller.dart';
import 'package:bpro/screens/auth/login_screen.dart';
import 'package:bpro/screens/changepassword/change_password_screen.dart';
import 'package:bpro/screens/deleteaccount/delete_account_screen.dart';
import 'package:bpro/screens/disclaimer/disclaimer_screen.dart';
import 'package:bpro/screens/privacypolicy/privacy_policy_screen.dart';
import 'package:bpro/utils/app_colors.dart';
import 'package:bpro/utils/app_icons.dart';
import 'package:bpro/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget customDrawer(BuildContext context) {
  AuthController authController = Get.find();
  return Drawer(
    child: ListView(
      padding: const EdgeInsets.all(0),
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: AppColors.appPrimaryColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                  backgroundColor: AppColors.white,
                  radius: 30,
                  child: Obx(() {
                    return Text(
                      authController.userName.value.isEmpty
                          ? "BP"
                          : "${authController.userName}",
                      style: TextStyle(
                        fontSize: 30.0,
                        color: AppColors.appPrimaryColor,
                      ),
                    );
                  })),
              const SizedBox(height: 10),
              Obx(() {
                return CustomText(
                  text: "${authController.usernames}",
                  color: AppColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                );
              }),
              const SizedBox(height: 5),
              Obx(() {
                return Text(
                  "${authController.userMail}",
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                  ),
                );
              })
            ],
          ),
        ),
        ListTile(
          leading: const Icon(Icons.lock, color: AppColors.appPrimaryColor),
          title: const CustomText(
            text: "Change Password",
            color: AppColors.appPrimaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          onTap: () {
            Get.to(ChangePasswordScreen());
          },
        ),
        ListTile(
          leading: const Icon(Icons.delete, color: AppColors.appPrimaryColor),
          title: const CustomText(
            text: "Delete My Account",
            color: AppColors.appPrimaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          onTap: () {
            Get.to(DeleteAccountScreen());
          },
        ),
        ListTile(
          leading: const Icon(Icons.info, color: AppColors.appPrimaryColor),
          title: const CustomText(
            text: "Disclaimer",
            color: AppColors.appPrimaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          onTap: () {
            Get.to(DisclaimerScreen());
          },
        ),
        ListTile(
          leading: Image.asset(
            AppIcons.privacypolicy,
            color: AppColors.appPrimaryColor,
            width: 25,
          ),
          //leading: const Icon(Icons., color: AppColors.appPrimaryColor),
          title: const CustomText(
            text: "Privacy Policy",
            color: AppColors.appPrimaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          onTap: () {
            Get.to(PrivacyPolicyScreen());
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout, color: AppColors.appPrimaryColor),
          title: const CustomText(
            text: "LogOut",
            color: AppColors.appPrimaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          onTap: () {
            // customDialogueBox(context,"Would you like to Log out");
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: AppColors.appPrimaryColor,
                  title: CustomText(
                    text: "Are you sure you want to logout?",
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: CustomText(
                        text: "Cancel",
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        authController.removeUserData();
                        Get.to(LoginScreen());
                      },
                      child: CustomText(
                        text: "OK",
                        color: AppColors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ],
    ),
  );
}
