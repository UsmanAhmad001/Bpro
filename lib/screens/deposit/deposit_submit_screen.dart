import 'package:bpro/controller/deposite_controller.dart';
import 'package:bpro/extensions/size_extention.dart';
import 'package:bpro/extensions/sizebox_extention.dart';
import 'package:bpro/utils/app_colors.dart';
import 'package:bpro/utils/app_icons.dart';
import 'package:bpro/utils/app_images.dart';
import 'package:bpro/widgets/custom_appbar.dart';
import 'package:bpro/widgets/custom_text.dart';
import 'package:bpro/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DepositSubmitScreen extends StatelessWidget {
  DepositSubmitScreen({super.key});
  final DepositeController depositeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar("Deposit"),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    AppImages.background,
                  ),
                  fit: BoxFit.cover)),
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Padding(
              padding: const EdgeInsets.only(top: 50,left: 10,right: 10),
              child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.appPrimaryColor,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      width: double.infinity,
                      height: context.heightPercentage(0.25),
                      child: Obx(() {
                        return depositeController.imageFile.value != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.file(
                                  depositeController.imageFile.value!,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              )
                            : Stack(
                                children: [
                                  Center(
                                    child: CustomText(
                                      text: "Upload Image",
                                      color: AppColors.appPrimaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 10,
                                    right: 10,
                                    child: GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                          backgroundColor:
                                              AppColors.appPrimaryColor,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20, top: 20),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Center(
                                                    child: CustomText(
                                                      text: "Choose an Option",
                                                      color: AppColors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  30.height,
                                                  Row(
                                                    children: [
                                                      Image.asset(
                                                        AppIcons.gallery,
                                                        height: 25,
                                                      ),
                                                      10.width,
                                                      GestureDetector(
                                                        onTap: () {
                                                          depositeController
                                                              .imageImageFromGallery();
                                                          Get.back();
                                                        },
                                                        child: CustomText(
                                                          text: "Gallery",
                                                          color:
                                                              AppColors.white,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  20.height,
                                                  Row(children: [
                                                    Image.asset(
                                                      AppIcons.whitebgcamera,
                                                      height: 25,
                                                    ),
                                                    10.width,
                                                    GestureDetector(
                                                      onTap: () {
                                                        depositeController
                                                            .imageImageFromCamera();
                                                        Get.back();
                                                      },
                                                      child: CustomText(
                                                        text: "Camera",
                                                        color: AppColors.white,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    )
                                                  ]),
                                                  30.height,
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.transparent,
                                            border: Border.all(
                                                color:
                                                    AppColors.appPrimaryColor,
                                                width: 2)),
                                        child: Center(
                                          child: Image.asset(
                                            AppIcons.camera,
                                            height: 25,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                      })),
                  20.height,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "1. Send payment to the account above",
                          color: AppColors.charcoalgrey,
                          fontWeight: FontWeight.w500,
                        ),
                        CustomText(
                          text: "2. Upload payment proof and submit",
                          color: AppColors.charcoalgrey,
                          fontWeight: FontWeight.w500,
                        ),
                        CustomText(
                          text: "3. Payment will be approved within 30 minutes.",
                          color: AppColors.charcoalgrey,
                          fontWeight: FontWeight.w500,
                        ),
                        CustomText(
                          text:
                              "4. Enter the exact amount to avoid payment delays.",
                          color: AppColors.charcoalgrey,
                          fontWeight: FontWeight.w500,
                        ),
                        20.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomText(
                              text: "اوپر دیے گئے اکاؤنٹ پر ادائیگی بھیجیں",
                              color: AppColors.charcoalgrey,
                              fontWeight: FontWeight.w600,
                            ),
                            CustomText(
                              text: " 1.",
                              color: AppColors.charcoalgrey,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomText(
                              text: "ادائیگی کا ثبوت اپ لوڈ کریں اور جمع کروائیں",
                              color: AppColors.charcoalgrey,
                              fontWeight: FontWeight.w600,
                            ),
                            CustomText(
                              text: " 2.",
                              color: AppColors.charcoalgrey,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomText(
                              text: "ادائیگی کی منظوری 30 منٹ میں دی جائے گی",
                              color: AppColors.charcoalgrey,
                              fontWeight: FontWeight.w600,
                            ),
                            CustomText(
                              text: " 3.",
                              color: AppColors.charcoalgrey,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomText(
                              text:
                                  "ادائیگی میں تاخیر سے بچنے کے لیے درست رقم درج کریں",
                              color: AppColors.charcoalgrey,
                              fontWeight: FontWeight.w600,
                            ),
                            CustomText(
                              text: " 4.",
                              color: AppColors.charcoalgrey,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  CustomButton(
                    onPressed: () {
                      depositeController.uploadImage(context);
                      //   Get.to(DepositSubmitScreen());
                    },
                    height: 50,
                    width: context.screenWidth,
                    text: "Submit",
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
            ),
          ),
        ));
  }
}
