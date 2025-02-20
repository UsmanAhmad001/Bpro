import 'package:bpro/controller/auth_controller.dart';
import 'package:bpro/controller/bpro_controller.dart';
import 'package:bpro/controller/deposite_controller.dart';
import 'package:bpro/controller/withdrawal_controller.dart';
import 'package:bpro/extensions/size_extention.dart';
import 'package:bpro/extensions/sizebox_extention.dart';
import 'package:bpro/screens/deposit/deposit_screen.dart';
import 'package:bpro/screens/faq/faq_screen.dart';
import 'package:bpro/screens/history/history_screen.dart';
import 'package:bpro/screens/webview.dart';
import 'package:bpro/screens/withdrawal/withdrawal_screen.dart';
import 'package:bpro/utils/app_colors.dart';
import 'package:bpro/utils/app_icons.dart';
import 'package:bpro/utils/app_images.dart';
import 'package:bpro/widgets/custom_appbar.dart';
import 'package:bpro/widgets/custom_drawer.dart';
import 'package:bpro/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BproDashboardScreen extends StatefulWidget {
  const BproDashboardScreen({super.key});

  @override
  State<BproDashboardScreen> createState() => _BproDashboardScreenState();
}

class _BproDashboardScreenState extends State<BproDashboardScreen> {
  final DepositeController depositeController = Get.put(DepositeController());
  final BproController bproController = Get.put(BproController());
  final AuthController authController = Get.find();
  final WithdrawalController withdrawalController =
      Get.put(WithdrawalController());

  @override
  void initState() {
    super.initState();

    bproController.userApi();
    //  authController.removeUserData();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool shouldExit = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: AppColors.appPrimaryColor,
            content: CustomText(
                text: "Are you sure you want to exit?",
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.white),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: CustomText(
                  text: "No",
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  SystemNavigator.pop();
                },
                child: CustomText(
                  text: "Yes",
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
        return shouldExit;
      },
      child: Scaffold(
        drawer: customDrawer(context),
        appBar: customAppBar("BPRO"),
        body: Obx(() {
          if (bproController.loading.value) {
            return Center(
              child:
                  CircularProgressIndicator(color: AppColors.appPrimaryColor),
            );
          } else {
            return Container(
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20,
                          top: context.heightPercentage(0.05),
                          right: 20),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: AppColors.appPrimaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, bottom: 20, top: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                      text: "Welcome to BPRO",
                                      color: AppColors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    10.height,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              depositeController.copyText(
                                                  "User Name: ${authController.usernames}",
                                                  context);
                                            },
                                            child: CustomText(
                                              text: "User Name: ",
                                              color: AppColors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 17,
                                            )),
                                        Obx(() {
                                          return CustomText(
                                            text: "${bproController.userName}",
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                          );
                                        })
                                      ],
                                    ),
                                    7.height,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              depositeController.copyText(
                                                  "Bp User Name: ${authController.bpUserName}",
                                                  context);
                                            },
                                            child: CustomText(
                                              text: "BP UserName: ",
                                              color: AppColors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                            )),
                                        Obx(() {
                                          return CustomText(
                                            text:
                                                "${bproController.bpUserName}",
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                          );
                                        })
                                      ],
                                    ),
                                    7.height,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            depositeController.copyText(
                                                "BP Password: ${bproController.bpPassword}",
                                                context);
                                          },
                                          child: CustomText(
                                            text: "BP Password:",
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Obx(() {
                                          return CustomText(
                                            text:
                                                "${bproController.bpPassword}",
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                          );
                                        })
                                      ],
                                    ),
                                    7.height,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          text: "Status:",
                                          color: AppColors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        ),
                                        Obx(() {
                                          return CustomText(
                                            text: "${bproController.status}",
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                          );
                                        })
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    10.height,
                    Expanded(
                      child: GridView(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            mainAxisExtent: 70,
                          ),
                          padding: EdgeInsets.all(16),
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(() => DepositScreen());
                                //DepositeService depositeService=DepositeService();
                                // depositeController.fetchUserBank();
                                // depositeService.fetchBank();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.darkpurple,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(AppIcons.deposit,
                                          width: 30, color: AppColors.white),
                                      10.width,
                                      CustomText(
                                          fontSize: 16,
                                          text: "Deposit",
                                          color: AppColors.white),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            if (authController.mode == "Active") ...[
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => WithdrawalScreen());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.darkpurple,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(AppIcons.widdrawl,
                                          color: AppColors.white, width: 30),
                                      10.width,
                                      CustomText(
                                          fontSize: 16,
                                          text: "Withdrawal",
                                          color: AppColors.white),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => HistoryScreen());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.darkpurple,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(AppIcons.historyIcon,
                                          width: 30, color: AppColors.white),
                                      15.width,
                                      CustomText(
                                          text: "History",
                                          fontSize: 16,
                                          color: AppColors.white),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => WebviewScreen());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.darkpurple,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(AppIcons.webview,
                                            width: 30, color: AppColors.white),
                                        10.width,
                                        CustomText(
                                            fontSize: 16,
                                            text: "Web View",
                                            color: AppColors.white),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ] else
                              SizedBox.shrink(),
                          ]),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              bproController.launchUrl("https://wa.me/",
                                  phonenumber:
                                      withdrawalController.whatsappNumber);
                            },
                            child: Image.asset(AppImages.whattasapplogo,
                                height: 35)),
                        15.width,
                        Tooltip(
                          message: "Help",
                          child: GestureDetector(
                            onTap: () {
                              Get.to(FaqScreen());
                            },
                            child: Icon(Icons.help,
                                size: 30, color: AppColors.appPrimaryColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}
