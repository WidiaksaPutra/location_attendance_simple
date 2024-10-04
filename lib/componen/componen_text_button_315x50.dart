// ignore_for_file: must_be_immutable, camel_case_types, use_super_parameters
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ComponenTextButton_315x50 extends StatelessWidget{
  Widget child;
  Color colorButton;
  VoidCallback? onTap;
  ComponenTextButton_315x50({ Key? key,
    this.onTap,
    required this.child, 
    required this.colorButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 6.h),
        decoration: BoxDecoration(
          color: colorButton,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Center(child: child)
        ),
      ),
    );
  }
}