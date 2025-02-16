import 'package:bpro/controller/history_transaction_controller.dart';
import 'package:bpro/extensions/sizebox_extention.dart';
import 'package:bpro/utils/app_colors.dart';
import 'package:bpro/utils/app_images.dart';
import 'package:bpro/widgets/custom_appbar.dart';
import 'package:bpro/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({super.key});
  final HistoryTransactionController historyTransactionController =
      Get.put(HistoryTransactionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("History"),
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
          child: RefreshIndicator(
            color: AppColors.appPrimaryColor,
            backgroundColor: AppColors.white,
            onRefresh: () {
              return historyTransactionController.fetchHistoryTransaction();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Obx(() {
                    if (historyTransactionController.loading.value) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColors.appPrimaryColor,
                        ),
                      );
                    }

                    return Padding(
                      padding: const EdgeInsets.only(top: 35),
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        itemCount:
                            historyTransactionController.transactions.length,
                        itemBuilder: (context, index) {
                          var transactions =
                              historyTransactionController.transactions[index];
                          return Container(
                            margin: EdgeInsets.only(bottom: 16),
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: transactions.bankType.toString()=="1"
                                        ? "Bank"
                                        :transactions.bankType.toString()=="2"
                                        ?"Jazz Cash"
                                        :"Easy Paisa"

                                        ,
                                        color: AppColors.darkGrey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      4.height,
                                      CustomText(
                                        text: transactions.description.toString(),
                                        color: AppColors.darkGrey,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      CustomText(
                                        text: transactions.type,
                                        color: AppColors.darkGrey,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    CustomText(
                                      text: transactions.status.toString(),
                                      color: transactions.status == "Approved"
                                          ? AppColors.green
                                          : transactions.status == "Pending"
                                              ? AppColors.appPrimaryColor
                                              : AppColors.charcoalgrey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    50.height,
                                    CustomText(
                                      text: "Rs.${transactions.amount}",
                                      color: AppColors.darkGrey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
