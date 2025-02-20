import 'dart:developer';

import 'package:bpro/model/faq_model.dart';
import 'package:bpro/service/faq_service.dart';
import 'package:get/get.dart';

class FaqController extends GetxController {
  var faqList = <DataModel>[].obs;
  var loading = false.obs;
  @override
  void onInit() {
    super.onInit();
    fetchFaqData();
  }

  Future<void> fetchFaqData() async {
    try {
      loading(true);
      FaqService faqService = FaqService();
      var response = await faqService.faq();

      if (response != null && response.isNotEmpty) {
        faqList.clear();
        faqList.addAll(response);
        log("This CONTROLLER $faqList");
      } else {
        log("No data available");
      }
    } catch (e) {
      log("Exception $e");
    } finally {
      loading(false);
    }
  }
}
