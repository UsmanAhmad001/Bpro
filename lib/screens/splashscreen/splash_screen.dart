import 'package:bpro/controller/auth_controller.dart';
import 'package:bpro/screens/auth/login_screen.dart';
import 'package:bpro/screens/bprodashboard/bpro_dashboard_screen.dart';
import 'package:bpro/utils/app_colors.dart';
import 'package:bpro/utils/app_images.dart';
import 'package:bpro/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});
  final AuthController authController = Get.put(AuthController());

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    widget.authController.getUserData().then((_) {
      Future.delayed(Duration(seconds: 3), () {
        if (widget.authController.usernames.isNotEmpty &&
            widget.authController.userPassword.isNotEmpty) {
          Get.to(BproDashboardScreen());
        } else {
          Get.to(LoginScreen());
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.background), fit: BoxFit.cover)),
      child: Center(
        child: CustomText(
          text: "BPRO",
          color: AppColors.white,
          fontSize: 60,
          fontWeight: FontWeight.bold,
        ),
      ),
    ));
  }
}
