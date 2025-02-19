import 'dart:developer';
import 'package:bpro/controller/deposite_controller.dart';
import 'package:bpro/extensions/size_extention.dart';
import 'package:bpro/extensions/sizebox_extention.dart';
import 'package:bpro/screens/deposit/deposit_submit_screen.dart';
import 'package:bpro/utils/app_colors.dart';
import 'package:bpro/utils/app_images.dart';
import 'package:bpro/widgets/custom_appbar.dart';
import 'package:bpro/widgets/custom_text.dart';
import 'package:bpro/widgets/custom_textfield.dart';
import 'package:bpro/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DepositScreen extends StatelessWidget {
  DepositScreen({super.key});
  final DepositeController depositeController = Get.find();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar("Deposit"),
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
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 30),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Enter the amount",
                            color: AppColors.appPrimaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                          10.height,
                          customTextField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your amount";
                              }
                              return null;
                            },
                            onChanged: (value) {},
                            controller: depositeController.amount,
                            cursorColor: AppColors.appPrimaryColor,
                            focusedBorderColor: AppColors.appPrimaryColor,
                            bordercolor: AppColors.appPrimaryColor,
                            hintText: "Amount",
                            keyboardType: TextInputType.number,
                            hintStyle:
                                TextStyle(color: AppColors.appPrimaryColor),
                          ),
                          15.height,
                          CustomText(
                            text: "Select Account",
                            color: AppColors.appPrimaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                          5.height,
                          Obx(() {
                            log("UI Rebuild: Selected Index = ${depositeController.selectedIndex.value}");
                            return Expanded(
                              child: ListView.builder(
                                itemCount:
                                    depositeController.activeDeposite.length,
                                padding: EdgeInsets.only(top: 8, bottom: 8),
                                itemBuilder: (context, index) {
                                  bool isSelected =
                                      depositeController.selectedIndex.value ==
                                          index;

                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: GestureDetector(
                                      onTap: () {
                                        depositeController.toggleCheckbox(
                                            index,
                                            depositeController
                                                .activeDeposite[index].bankId);
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: isSelected
                                              ? AppColors.appPrimaryColor
                                              : AppColors.white,
                                          border: Border.all(
                                            color: isSelected
                                                ? AppColors.white
                                                : AppColors.appPrimaryColor,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    CustomText(
                                                      text: depositeController
                                                          .activeDeposite[index]
                                                          .name,
                                                      color: isSelected
                                                          ? AppColors.white
                                                          : AppColors
                                                              .appPrimaryColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15,
                                                    ),
                                                    CustomText(
                                                      text:
                                                          "Account ${depositeController.activeDeposite[index].acNumber}",
                                                      color: isSelected
                                                          ? AppColors.white
                                                          : AppColors
                                                              .appPrimaryColor,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 15,
                                                    ),
                                                    CustomText(
                                                      text:
                                                          "Account title # ${depositeController.activeDeposite[index].acTitle}",
                                                      color: isSelected
                                                          ? AppColors.white
                                                          : AppColors
                                                              .appPrimaryColor,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 15,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  depositeController.copyText(
                                                      depositeController
                                                          .activeDeposite[index]
                                                          .acNumber,
                                                      context);
                                                },
                                                child: Icon(
                                                  Icons.copy,
                                                  color: isSelected
                                                      ? AppColors.white
                                                      : AppColors
                                                          .appPrimaryColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          }),
                          20.height,
                          CustomButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                depositeController.depositeAmount < 500
                                    ? Get.snackbar(
                                        "Invalid Amount",
                                        "The amount must be greater than 500",
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor: AppColors.charcoalgrey,
                                        colorText: Colors.white,
                                      )
                                    : Get.to(DepositSubmitScreen());
                              }
                            },
                            height: 50,
                            width: context.screenWidth,
                            text: "Next",
                            color: AppColors.white,
                            fontSize: 15,
                            backgroundColor: AppColors.appPrimaryColor,
                            fontWeight: FontWeight.bold,
                            borderRadius: 10,
                            border: AppColors.white,
                          ),
                          20.height,
                        ],
                      ),
                    )))));
  }
}
