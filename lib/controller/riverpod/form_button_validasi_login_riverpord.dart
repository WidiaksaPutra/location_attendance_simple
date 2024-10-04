import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_attendance/controller/riverpod/interfaces/interface_form_button_validasi_login_riverpord.dart';
final formButtonValidasiLoginRiverpod = StateNotifierProvider.autoDispose<FormButtonValidasiLoginRiverpord, bool>((ref) => FormButtonValidasiLoginRiverpord(ref));

class FormButtonValidasiLoginRiverpord extends StateNotifier<bool> implements InterfaceFormButtonValidasiLoginRiverpord{
  late bool _email = false;
  late bool _password = false;
  FormButtonValidasiLoginRiverpord(ref) : super(false);
  
  @override
  void buttonValidasiLogin({required String email, required String password}) {
    if(email.isEmpty && password.isEmpty){
      _email = true;
      _password = true;
    }
    else if(email.isEmpty && password.isNotEmpty){
      _email = true;
      _password = false;
    }
    else if(password.isEmpty && email.isNotEmpty){
      _email = false;
      _password = true;
    }
  }
  
  @override
  bool get email => _email;
  
  @override
  bool get password => _password;
  
}