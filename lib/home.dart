// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_attendance/componen/componen_text_button_315x50.dart';
import 'package:mobile_attendance/componen/componen_text_form_field(label_white_16_&_text_form_and_hint_grey_14_&_radius_12_&_fill_color_white).dart';
import 'package:mobile_attendance/controller/mixin/mixin_shared_pref.dart';
import 'package:mobile_attendance/routes/route_name.dart';

final _controllerLatitudeOffice = TextEditingController();
final _controllerLongitudeOffice = TextEditingController();
final _controllerLatitudeUser = TextEditingController();
final _controllerLongitudeUser = TextEditingController();
final _latitude = StateProvider.autoDispose<double?>((ref) => 0.0);

class Home extends ConsumerWidget with SharedPref{
  Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.delayed(Duration.zero, () async{
      await sharedPref();  
      ref.read(_latitude.notifier).state = prefs.getDouble('latitude')!;
    });

    final _lat = ref.watch(_latitude)!;
    
    Widget labelEmail() => ComponenTextFormField_TextFormAndHintGrey14AndRadius12AndFillColorWhite(
      labelText: "Input Lokasi Office",
      labelStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp),
      hintText1: "latitude",
      controller1: _controllerLatitudeOffice,
      hintText2: "longitude", 
      controller2: _controllerLongitudeOffice,
    );

    Widget labelPassword() => ComponenTextFormField_TextFormAndHintGrey14AndRadius12AndFillColorWhite(
      labelText: "Input Lokasi User",
      labelStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp),
      hintText1: "latitude",
      controller1: _controllerLatitudeUser,
      hintText2: "longitude", 
      controller2: _controllerLongitudeUser,
    );

    Widget buttonMapsPost() => ComponenTextButton_315x50(
      colorButton: Colors.purple,
      child: Text("Input Base Map", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp, color: Colors.white)),
      onTap: () {
        context.go(RouteName.mapsPost);
      },
    );

    Widget buttonMapsPostClien() => ComponenTextButton_315x50(
      colorButton: Colors.purple,
      child: Text("Input Clien Map", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp, color: Colors.white)),
      onTap: () {
        context.go(RouteName.mapsPostClien);
      },
    );

    Widget buttonMapsGet() => ComponenTextButton_315x50(
      colorButton: Colors.purple,
      child: Text("Output Map", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp, color: Colors.white)),
      onTap: () {
        context.go(RouteName.mapsGet);
      },
    );
    
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 30.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // labelEmail(),
              // labelPassword(),
              // SizedBox(height: 30.h),
              buttonMapsPost(),
              SizedBox(height: 30.h),
              if(_lat != 0.0)...[
                buttonMapsPostClien(),
                SizedBox(height: 30.h),
                buttonMapsGet(),
              ]
            ],
          ),
        )
      ),
    );
  }
}