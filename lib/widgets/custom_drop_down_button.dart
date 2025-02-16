import 'package:bpro/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class CustomDropDownButton extends StatelessWidget {
  CustomDropDownButton({
    super.key,
    this.screenNumber,
    required this.text,
    this.onChanged,
    required this.items,
    required this.errorText,
    this.enableOnSelect = false,
  });

  final int? screenNumber;
  final String text;
  final String errorText;
  final Function(String?)? onChanged;
  final bool enableOnSelect;
  List<String> items;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      isExpanded: true,
      hint: const Text(
        "Select your type",
        style: TextStyle(color: AppColors.appPrimaryColor,fontWeight: FontWeight.normal),
      ),
      style: const TextStyle(
        color: AppColors.appPrimaryColor,
        fontSize: 16,
      ),
      buttonStyleData: const ButtonStyleData(
        height: 60,
      ),
      decoration: InputDecoration(
        enabled: onChanged != null ? true : false,
        fillColor: AppColors.white,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.appPrimaryColor,width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.appPrimaryColor,width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      ),
      iconStyleData: const IconStyleData(
        iconEnabledColor: AppColors.appPrimaryColor,
      ),
      dropdownStyleData: DropdownStyleData(
        maxHeight: 150,
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.appPrimaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorText;
        }
        return null;
      },
      items: [
        for (int i = 0; i < items.length; i++)
          DropdownMenuItem(
            value: items[i],
            child: Text(
              items[i],
              style: const TextStyle(
                color: AppColors.appPrimaryColor,
                fontSize: 16,
              ),
            ),
          ),
      ],
    );
  }
}
