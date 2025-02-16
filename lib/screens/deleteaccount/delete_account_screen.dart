import 'package:bpro/extensions/size_extention.dart';
import 'package:bpro/extensions/sizebox_extention.dart';
import 'package:bpro/utils/app_colors.dart';
import 'package:bpro/utils/app_images.dart';
import 'package:bpro/widgets/custom_appbar.dart';
import 'package:bpro/widgets/custom_text.dart';
import 'package:bpro/widgets/custom_textfield.dart';
import 'package:bpro/widgets/custombutton.dart';
import 'package:flutter/material.dart';

class DeleteAccountScreen extends StatelessWidget {
  const DeleteAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Delete Account"),
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
            padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text:
                      "Confirm your account details to proceed with deletion. This action cannot be undon.",
                  color: AppColors.appPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
                10.height,
                CustomText(
                  text:
                      "Warning: Deleting your account will remove all your data!",
                  color: AppColors.charcoalgrey,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                
                20.height,
                customTextField(
                  
                    bordercolor: AppColors.appPrimaryColor,
                    focusedBorderColor: AppColors.appPrimaryColor,
                    // prefixIcon: Icon(
                    //   Icons.lock,
                    //   size: 25,
                    //   color: AppColors.appPrimaryColor,
                    // ),
                    hintText: "Reson for deleting account",
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
                    hintText: "Enter your password",
                    hintStyle: TextStyle(color: AppColors.appPrimaryColor)),
                20.height,
                CustomButton(
                  height: 50,
                  width: context.screenWidth,
                  text: "Delete Account",
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
