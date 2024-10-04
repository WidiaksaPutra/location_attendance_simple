// ignore_for_file: use_build_context_synchronously, prefer_final_fields

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:input_output/riverpod/mixin/mixin_show_snack_bar.dart';
// import 'package:to_do_list/riverpord/mixin/mixin_show_snack_bar.dart';
// import 'package:to_do_list/service/api_login/interface_get_login.dart';
// import 'package:to_do_list/shared/theme_box.dart';
// import 'package:to_do_list/shared/theme_color.dart';
// import 'package:to_do_list/shared/theme_font.dart';
// import 'package:to_do_list/shared/theme_global_variabel.dart';
// import 'package:to_do_list/shared/theme_konstanta.dart';
// import 'package:to_do_list/shared/theme_text_style.dart';

// final isLoadingRiverpod = StateProvider.autoDispose<bool>((ref) => false);

// final interfaceGetLoginProvider = Provider<InterfaceGetLogin>((ref) {
//   return getItInstance<InterfaceGetLogin>();
// });

// final postLoginRiverpod = StateNotifierProvider.autoDispose<PostLogin, bool>((ref) {
//   final fetchDataPekerjaNotifier = PostLogin(ref.watch(interfaceGetLoginProvider));
//   return fetchDataPekerjaNotifier;
// });

// class PostLogin extends StateNotifier<bool> with ShowSnackBar{
//   InterfaceGetLogin _dataGetLogin = getItInstance<InterfaceGetLogin>();
//   late String _respons;
//   PostLogin(this._dataGetLogin) : super(false);

//   Future<void> postLogin({
//     required String email,
//     required String password,
//     required BuildContext context,
//   }) async{
//     if(email.isNotEmpty && password.isNotEmpty){
//       state = true;
//       _respons = await _dataGetLogin.getLogin(email: email, password: password);
//       if(_respons == "berhasil"){
//         voidShowSnackBar(
//           behavior: SnackBarBehavior.floating, 
//           borderRadius: BorderRadius.circular(ThemeBox.defaultRadius8), 
//           color: kGreenColor, 
//           context: context,
//           duration: const Duration(milliseconds: 1000),
//           vertical: ThemeBox.defaultHeightBox12,
//           content: Text(snackBarLoginBerhasil,
//             style: whiteTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont12),
//             textAlign: TextAlign.center
//           ),
//         );
//         state = false;
//       }
//       if(_respons == "gagal"){
//         voidShowSnackBar(
//           behavior: SnackBarBehavior.floating, 
//           borderRadius: BorderRadius.circular(ThemeBox.defaultRadius8), 
//           color: kRedColor,
//           context: context,
//           duration: const Duration(milliseconds: 1000),
//           vertical: ThemeBox.defaultHeightBox12,
//           content: Text(snackBarLoginSalah,
//             style: whiteTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont12),
//             textAlign: TextAlign.center
//           ),
//         );
//         state = false;
//       }
//       if(_respons == "error"){
//         voidShowSnackBar(
//           behavior: SnackBarBehavior.floating, 
//           borderRadius: BorderRadius.circular(ThemeBox.defaultRadius8), 
//           color: kRedColor,
//           context: context,
//           duration: const Duration(milliseconds: 1000),
//           vertical: ThemeBox.defaultHeightBox12,
//           content: Text(snackBarLoginGagal,
//             style: whiteTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont12),
//             textAlign: TextAlign.center
//           ),
//         );
//         state = false;
//       }
//     }
//   }
// }