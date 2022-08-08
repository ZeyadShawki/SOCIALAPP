
import 'package:androidstudio_fles_socialapp/Shared/cachehelper.dart';
import 'package:androidstudio_fles_socialapp/SocialApp/Register/REGISTERMODEL.dart';
import 'package:androidstudio_fles_socialapp/SocialApp/Register/RegisterStates.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '';
class REGISTERcubit extends Cubit<Registerstates> {
  REGISTERcubit() :super (Registerintialstate());

  static REGISTERcubit get(context) => BlocProvider.of(context);
  void userREGISTER({
    required String emailcont,
    required String passwordcont,
    required String phonecont,
    required String namecont,


  }) {
    emit(Registerloadingstate());
FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailcont, password: passwordcont

).then((value) {
  print(value.user!.uid);
  print(value.user!.email);

  Createuser(
    namecont: namecont,
    emailcont: emailcont,
    phonecont: phonecont,
    uid: value.user!.uid,
  );
cachehelper.savedata(key: 'uId', value: value.user?.uid);
  cachehelper.uId=cachehelper.getdata(key: 'uId');
  print(cachehelper.uId);
  emit(Registersucessstate());
}).catchError((error){
  print(error.toString());
  emit(Registererrorstate( error: error.toString()));
});

  }

  IconData suffixpass = Icons.visibility_outlined;
  bool ispassword = true;

  void obscurepass() {
    ispassword = !ispassword;

    suffixpass =
    ispassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(registerpasswordstate());
  }



  void Createuser(
  {
    required String emailcont,
    required String phonecont,
    required String uid,
    required String namecont,

  }
      )
  {
    socialUSERModel  model=socialUSERModel(
      name: namecont,
      email: emailcont,
      phone: phonecont,
      uid: uid,
      bio: 'write your bio...',
      cover: 'https://img.freepik.com/premium-photo/ripe-bananas-isolated-white-background_434193-6188.jpg',
      image: 'https://img.freepik.com/free-photo/young-attractive-handsome-guy-feels-delighted-gladden-amazed_295783-535.jpg?size=626&ext=jpg&ga=GA1.2.704031125.1659457029',
    );


FirebaseFirestore.instance.collection('users')
    .doc(uid)
    .set(model.toMap()).then((value) {
      print(model);
})
    .catchError((error){
      print(error.toString());
      Createusererrorstate(error: error.toString());
});
  }

}