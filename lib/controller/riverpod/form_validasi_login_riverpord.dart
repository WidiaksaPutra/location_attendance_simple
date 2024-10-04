import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_attendance/controller/riverpod/interfaces/interface_form_validasi_login_riverpord.dart';

final formLoginRiverpod = StateNotifierProvider.autoDispose<FormValidasiLoginRiverpord, bool>((ref) => FormValidasiLoginRiverpord(ref));

class FormValidasiLoginRiverpord extends StateNotifier<bool> implements InterfaceFormValidasiLoginRiverpord{
  late bool _email = false;
  late bool _password = false;
  FormValidasiLoginRiverpord(ref) : super(false);
  

  @override
  void emailValidasiEmpty(String email) {
    if(email.isEmpty){
      _email = true;
    }else{
      _email = false;
    }
  }

  @override
  void passwordValidasiEmpty(String password) {
    if(password.isEmpty){
      _password = true;
    }else{
      _password = false;
    }
  }
  
  @override
  bool get email => _email;
  
  @override
  bool get password => _password;
}