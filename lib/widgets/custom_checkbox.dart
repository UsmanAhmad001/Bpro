import 'package:bpro/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final bool? initialValue; // Initial value of checkbox
  final ValueChanged<bool?>
      onChanged; // Callback to handle checkbox state changes
  final Color borderColor;
  CustomCheckbox({
    Key? key,
    this.initialValue,
    this.borderColor = AppColors.darkGrey,
    required this.onChanged,
  }) : super(key: key);

  @override
  _StatefulCheckboxState createState() => _StatefulCheckboxState();
}

class _StatefulCheckboxState extends State<CustomCheckbox> {
  bool? _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      side: BorderSide(color: widget.borderColor, width: 1.4),
      checkColor: AppColors.appPrimaryColor,
      activeColor: AppColors.white,
      value: _value,
      onChanged: (bool? newValue) {
        setState(() {
          _value = newValue;
        });
        widget.onChanged(newValue);
      },
    );
  }
}
