import 'package:androidstudio_fles_socialapp/Shared/cachehelper.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'loginStates.dart';

class logincubit extends Cubit<loginstates> {
  logincubit() :super (loginintialstate());

  static logincubit get(context) => BlocProvider.of(context);

  void userlogin({
    required String emailcont,
    required String passwordcont,
  }) {
    emit(loginloadingstate());
FirebaseAuth.instance.signInWithEmailAndPassword(email: emailcont, password: passwordcont).
then((value) {
  print(value.user!.uid);
  print(value.user!.email);
  cachehelper.savedata(key: 'uId', value: value.user?.uid);
  cachehelper.uId=cachehelper.getdata(key: 'uId');
  print(cachehelper.uId);

  emit(loginsuccessstate());
}).catchError((error){

  emit(loginerrorstate(error: error));
  print(error.toString());
});
  }

  IconData suffixpass = Icons.visibility_outlined;
  bool ispassword = true;

  void obscurepass() {
    ispassword = !ispassword;

    suffixpass =
    ispassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(loginshowpasswordstate());
  }
}