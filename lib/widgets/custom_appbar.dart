import 'package:bpro/utils/app_images.dart';
import 'package:bpro/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

PreferredSizeWidget customAppBar(String title) {
  return PreferredSize(
    preferredSize: Size.fromHeight(70),
    child: AppBar(
      iconTheme: IconThemeData(
        color: AppColors.white,
      ),
      backgroundColor: Colors.transparent,
      title: CustomText(
        text: title,
        color: AppColors.white,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: true,
      flexibleSpace: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.background),
            fit: BoxFit.cover,
          ),
          
        ),
      ),
    ),
  );
}
