import 'package:bpro/screens/changepassword/change_password_screen.dart';
import 'package:bpro/screens/deleteaccount/delete_account_screen.dart';
import 'package:bpro/utils/app_colors.dart';
import 'package:bpro/utils/app_icons.dart';
import 'package:bpro/widgets/custom_dialogue_box.dart';
import 'package:bpro/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget customDrawer(BuildContext context) {
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
                child: Text(
                  "SU",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: AppColors.appPrimaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              CustomText(
                text: "Syed Usman Ahmad",
                color: AppColors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 5),
              Text(
                "usman@gmail.com",
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 14,
                ),
              ),
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
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Image.asset(AppIcons.privacypolicy,color: AppColors.appPrimaryColor,width: 25,),
          //leading: const Icon(Icons., color: AppColors.appPrimaryColor),
          title: const CustomText(
            text: "Privacy Policy",
            color: AppColors.appPrimaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          onTap: () {
            Navigator.pop(context);
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
            customDialogueBox(context,"Would you like to Log out");
          },
        ),
      ],
    ),
  );
}
