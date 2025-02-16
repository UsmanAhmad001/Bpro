import 'package:bpro/controller/withdrawal_controller.dart';
import 'package:bpro/extensions/size_extention.dart';
import 'package:bpro/extensions/sizebox_extention.dart';
import 'package:bpro/utils/app_colors.dart';
import 'package:bpro/utils/app_images.dart';
import 'package:bpro/widgets/custom_appbar.dart';
import 'package:bpro/widgets/custom_drop_down_button.dart';
import 'package:bpro/widgets/custom_text.dart';
import 'package:bpro/widgets/custom_textfield.dart';
import 'package:bpro/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WithdrawalScreen extends StatelessWidget {
  WithdrawalScreen({super.key});
  final WithdrawalController withdrawalController =
      Get.put(WithdrawalController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: customAppBar("Withdrawal"),
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
              if (withdrawalController.loading.value) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.appPrimaryColor,
                  ),
                );
              } else {
                return SingleChildScrollView(
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
                              return "Please enter your ammount";
                            }
                            return null;
                          },
                          controller: withdrawalController.amount,
                          backgroundColor: AppColors.transparent,
                          cursorColor: AppColors.appPrimaryColor,
                          focusedBorderColor: AppColors.appPrimaryColor,
                          bordercolor: AppColors.appPrimaryColor,
                          hintText: "Amount",
                          keyboardType: TextInputType.number,
                          hintStyle:
                              TextStyle(color: AppColors.appPrimaryColor),
                        ),
                        10.height,
                        CustomText(
                          text: "Select Option",
                          color: AppColors.warmorange,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                        10.height,
                        CustomDropDownButton(
                          enableOnSelect: true,
                          errorText: "Please Select Bank Type",
                          items: withdrawalController.payments,
                          onChanged: (value) {
                            withdrawalController.updatedText(value!);
                          },
                          text: "Tax Info",
                        ),
                        20.height,
                        CustomText(
                          text:
                              "Enter your Account Number and Account Name below",
                          color: AppColors.appPrimaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                        10.height,
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your Account Title and Account Number";
                            }
                            return null;
                          },
                          controller: withdrawalController.description,
                          cursorColor: AppColors.appPrimaryColor,
                          maxLines: 5,
                          decoration: InputDecoration(
                            hintText: 'Account Name and Account Number',
                            hintStyle:
                                TextStyle(color: AppColors.appPrimaryColor),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.appPrimaryColor),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            contentPadding: EdgeInsets.all(16),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: AppColors.appPrimaryColor,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: AppColors.appPrimaryColor,
                                width: 2.0,
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.newline,
                        ),
                        20.height,
                        Obx(() {
                          return withdrawalController.showButton.value
                              ? CustomButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      withdrawalController.widthdrawal(context);
                                    }
                                  },
                                  height: 50,
                                  width: context.screenWidth,
                                  text: "Submit",
                                  color: AppColors.white,
                                  fontSize: 16,
                                  backgroundColor: AppColors.appPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                  borderRadius: 10,
                                  border: AppColors.appPrimaryColor,
                                )
                              : Center(child: CustomText(text: "Widthdrw is not available at this time",color:AppColors.charcoalgrey ,fontSize: 17,fontWeight: FontWeight.bold,));
                        }),
                        20.height,
                      ],
                    ),
                  ),
                );
              }
            }),
          ),
        ),
      ),
    );
  }
}
