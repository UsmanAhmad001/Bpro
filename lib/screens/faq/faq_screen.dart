import 'package:bpro/controller/bpro_controller.dart';
import 'package:bpro/controller/faq_controller.dart';
import 'package:bpro/extensions/size_extention.dart';
import 'package:bpro/utils/app_colors.dart';
import 'package:bpro/utils/app_images.dart';
import 'package:bpro/widgets/custom_appbar.dart';
import 'package:bpro/widgets/custom_text.dart';
import 'package:bpro/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FaqScreen extends StatelessWidget {
  FaqScreen({super.key});
  final FaqController faqController = Get.put(FaqController());
  final BproController bproController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar("Help"),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppImages.background), fit: BoxFit.cover)),
          child: RefreshIndicator(
            color: AppColors.appPrimaryColor,
            backgroundColor: AppColors.white,
            onRefresh: () {
              return faqController.fetchFaqData();
            },
            child: Container(
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Obx(() {
                  if (faqController.loading.value) {
                    return Center(
                        child: CircularProgressIndicator(
                      color: AppColors.appPrimaryColor,
                    ));
                  } else if (faqController.faqList.isEmpty) {
                    return Center(
                        child: Text("No FAQs available",
                            style: TextStyle(fontSize: 18)));
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 30, left: 10, right: 10),
                            child: ListView.builder(
                              itemCount: faqController.faqList.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ExpansionTile(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      collapsedShape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      iconColor: AppColors.white,
                                      collapsedIconColor: AppColors.white,
                                      title: CustomText(
                                        text: faqController
                                            .faqList[index].description,
                                        color: AppColors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      backgroundColor:
                                          AppColors.appPrimaryColor,
                                      collapsedBackgroundColor:
                                          AppColors.appPrimaryColor,
                                      leading: Icon(
                                        Icons.info,
                                        color: AppColors.white,
                                      ),
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10, top: 10),
                                            child: faqController
                                                        .faqList[index].type ==
                                                    "link"
                                                ? CustomButton(
                                                    widget: Icon(
                                                      Icons.link,
                                                      color: AppColors.darkGrey,
                                                    ),
                                                    height: 40,
                                                    width: context
                                                        .widthPercentage(0.45),
                                                    text: "Link",
                                                    color: AppColors.darkGrey,
                                                    backgroundColor:
                                                        AppColors.white,
                                                    fontWeight: FontWeight.bold,
                                                    borderRadius: 10,
                                                    border: Colors.transparent,
                                                    onPressed: () {
                                                      bproController.launchUrl(
                                                          faqController
                                                              .faqList[index]
                                                              .subject);
                                                    },
                                                  )
                                                : CustomText(
                                                    fontWeight: FontWeight.bold,
                                                    text: faqController
                                                        .faqList[index].subject,
                                                    color: AppColors.white))
                                      ],
                                    ));
                              },
                            ),
                          ),
                        )
                      ],
                    );
                  }
                })),
          ),
        ));
  }
}
