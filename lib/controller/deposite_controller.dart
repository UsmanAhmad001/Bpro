import 'dart:developer';
import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bpro/controller/auth_controller.dart';
import 'package:bpro/screens/bprodashboard/bpro_dashboard_screen.dart';
import 'package:http/http.dart' as http;
import 'package:bpro/config/config.dart';
import 'package:bpro/model/deposite_model.dart';
import 'package:bpro/service/deposite_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DepositeController extends GetxController {
  AuthController authController = Get.find();
  var loading = false.obs;
  var amount = TextEditingController();
  ImagePicker imagePicker = ImagePicker();
  var activeDeposite = <Deposite>[].obs;

  var imageFile = Rxn<File>();

  @override
  void onInit() {
    fetchUserBank();
    super.onInit();
  }

  var selectedIndex = (-1).obs;

  var selectedBankId = RxnString();
// var isButtonEnabled = false.obs;
// var depositeAmount=0.obs;

//   void validateAmount(String value) {
//     if (value.isNotEmpty) {
//       depositeAmount.value = int.parse(value);
//       isButtonEnabled.value = depositeAmount.value >= 500;
//     } else {
//       isButtonEnabled.value = false;
//     }
//   }
  int get depositeAmount => int.tryParse(amount.text.trim()) ?? 0;

  void toggleCheckbox(int index, String bankId) {
    if (selectedIndex.value == index) {
      selectedIndex.value = -1;
      selectedBankId.value = null;
    } else {
      selectedIndex.value = index;
      selectedBankId.value = bankId;
      log("THE BANK ID $selectedBankId");
    }
  }

  Future imageImageFromGallery() async {
    try {
      var pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        imageFile.value = File(pickedFile.path);
      }
    } catch (e) {
      log("Error in Image from Gallery $e");
    }
  }

  Future imageImageFromCamera() async {
    try {
      var pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        imageFile.value = File(pickedFile.path);
      }
    } catch (e) {
      log("Error in Image from Camera $e");
    }
  }

  Future copyText(String text, BuildContext context) async {
    if (text.isNotEmpty) {
      try {
        await Clipboard.setData(ClipboardData(text: text));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Copied to Clipboard!')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to copy to clipboard.')));
      }
    }
  }

  Future fetchUserBank() async {
    try {
      DepositeService depositeService = DepositeService();
      var response = await depositeService.fetchBank();
      log("message");

      if (response.isNotEmpty) {
        activeDeposite.clear();
        activeDeposite.addAll(response);
      }
    } catch (e) {
      log("There is an error to fetch the Actve Deposite data: $e");
    }
  }

  Future uploadImage(BuildContext context) async {
    try {
      loading(true);
      DateTime now = DateTime.now();
      String time = "${now.hour}:${now.minute}:${now.second}";
      log("This is time $time");
      var url = Uri.parse("${Config.baseUrl}deposit");
      log("$url");
      //  log("DEPOSITE CONTROLLER TOKEN ${authController.userid}");
      var request = http.MultipartRequest(
        "POST",
        url,
      )
        ..files.add(await http.MultipartFile.fromPath(
          'file',
          imageFile.value!.path,
        ))
        ..fields['bank_id'] = selectedBankId.value.toString()
        ..fields['user_id'] = authController.userkey.toString()
        ..fields["amount"] = depositeAmount.toString()
        ..fields["time"] = time
        ..headers['Authorization'] = 'Bearer ${authController.sessionkey}';
      log("$authController.userkey");

      log("$selectedBankId");
      var client = http.Client();
      var response = await client.send(request);
      log("STATUS CODE ${response.statusCode}");

      if (response.statusCode == 200) {
        imageFile.value = null;
        amount.clear();
        // selectedIndex.value = -1;
        // selectedBankId.value = null;
        log("Image UPLOAD");

        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          headerAnimationLoop: true,
          animType: AnimType.scale,
          title: 'Success',
          desc: 'Image uploaded successfully!',
          btnOkOnPress: () {
            Get.to(BproDashboardScreen());
          },
        ).show();
      } else {
        log("FAILED UPLOAD");
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          headerAnimationLoop: true,
          animType: AnimType.scale,
          title: 'Error',
          desc: 'Failed to upload image.',
          btnOkOnPress: () {},
        ).show();
      }

      client.close();
    } catch (e) {
      log("Exception: $e");
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        headerAnimationLoop: true,
        animType: AnimType.scale,
        title: 'Exception',
        desc: 'An error occurred: $e',
        btnOkOnPress: () {},
      ).show();
    } finally {
      loading(false);
    }
  }
}
