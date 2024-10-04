// ignore_for_file: must_be_immutable, camel_case_types, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_attendance/componen/componen_basic_text_form_field.dart';

class ComponenTextFormField_TextFormAndHintGrey14AndRadius12AndFillColorWhite extends StatelessWidget { 
  int maxLines;
  String? labelText;
  bool? hiddenText, update, passwordVisible;
  TextInputType? keyboardType;
  TextStyle? labelStyle;
  String hintText1, hintText2;
  TextEditingController controller1, controller2;
  VoidCallback? onPressed;
  void Function(String)? onChanged;
  ComponenTextFormField_TextFormAndHintGrey14AndRadius12AndFillColorWhite({
    this.maxLines = 1,
    this.labelText = "",
    this.keyboardType = TextInputType.text,
    this.hiddenText = false,
    this.update = false,
    this.labelStyle,
    this.passwordVisible = false,
    this.onPressed,
    this.onChanged,
    required this.hintText1,
    required this.hintText2,
    required this.controller1,
    required this.controller2,
  });

  @override
  Widget build(BuildContext context) {
    return ComponenBasicTextFormField(
      maxLines: maxLines,
      labelText: labelText!, 
      hintText1: hintText1,
      hintText2: hintText2,
      keyboardType: keyboardType!,
      hiddenText: hiddenText!,
      labelStyle: (labelStyle != null) ? labelStyle! : const TextStyle(),
      hintStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp, color: Colors.grey),
      borderRadius: BorderRadius.circular(12.r), 
      borderSide: BorderSide.none, 
      fillColor: Color.fromARGB(255, 226, 224, 224), 
      textFormFieldStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp),
      sizeLabelToTextForm: (labelStyle != null) ? 12.sp : 0.0.sp,
      prefixPadding: EdgeInsets.symmetric(horizontal: 12.w),
      prefixHeight: 19.h,
      prefixWidth: 18.w,
      suffixPadding: EdgeInsets.symmetric(horizontal: 12.w),
      update: update!,
      onChanged: onChanged, 
      onPressed: onPressed, 
      controller1: controller1,
      controller2: controller2,
    );
  }
}