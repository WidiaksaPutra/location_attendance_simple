// ignore_for_file: must_be_immutable, use_super_parameters
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_attendance/controller/mixin/mixin_shared_pref.dart';

class ComponenBasicTextFormField extends StatelessWidget with SharedPref{
  String labelText, hintText1, hintText2;
  bool update, hiddenText;
  TextInputType keyboardType;
  TextStyle labelStyle, textFormFieldStyle, hintStyle;
  double sizeLabelToTextForm, prefixHeight, prefixWidth;
  Color fillColor;
  BorderRadius borderRadius;
  BorderSide borderSide;
  EdgeInsetsGeometry prefixPadding, suffixPadding;
  void Function(String)? onChanged;
  VoidCallback? onPressed;
  int maxLines;
  TextEditingController controller1, controller2;
  ComponenBasicTextFormField({ Key? key,
    this.maxLines = 1,
    this.onChanged,
    this.onPressed,
    required this.labelText, 
    required this.hintText1,
    required this.hintText2, 
    required this.hiddenText,
    required this.keyboardType, 
    required this.update,
    required this.labelStyle,
    required this.sizeLabelToTextForm,
    required this.textFormFieldStyle,
    required this.hintStyle,
    required this.fillColor,
    required this.borderRadius,
    required this.borderSide,
    required this.prefixPadding,
    required this.prefixHeight,
    required this.prefixWidth,
    required this.suffixPadding,
    required this.controller1,
    required this.controller2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    sharedPref();
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: labelStyle),
        SizedBox(height: sizeLabelToTextForm),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: controller1,
                maxLines: maxLines,
                keyboardType: keyboardType,
                obscureText: hiddenText,//untuk mengatur hidden text
                style: textFormFieldStyle,
                onChanged: onChanged,
                decoration: InputDecoration(
                  hintText: hintText1,
                  hintStyle: hintStyle,
                  filled: true,//untuk menerangkan fillColor
                  fillColor: fillColor,
                  border: OutlineInputBorder(
                    borderRadius: borderRadius,
                    borderSide: borderSide,
                  ),
                ),
              ),
            ),
            SizedBox(width: 20.h),
            Expanded(
              child: TextFormField(
                controller: controller2,
                maxLines: maxLines,
                keyboardType: keyboardType,
                obscureText: hiddenText,//untuk mengatur hidden text
                style: textFormFieldStyle,
                onChanged: onChanged,
                decoration: InputDecoration(
                  hintText: hintText2,
                  hintStyle: hintStyle,
                  filled: true,//untuk menerangkan fillColor
                  fillColor: fillColor,
                  border: OutlineInputBorder(
                    borderRadius: borderRadius,
                    borderSide: borderSide,
                  ),
                ),
              ),
            ),
          ],
        ),
      ]
    );
  }
}



// TextEditingController controller = TextEditingController();
    // if(update == true){
      // controller.text = hintText.toString();
    // }