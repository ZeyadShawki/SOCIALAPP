import 'dart:io';

import 'package:androidstudio_fles_socialapp/Shared/cachehelper.dart';
import 'package:androidstudio_fles_socialapp/SocialApp/chatscreen/chat_screen.dart';
import 'package:androidstudio_fles_socialapp/SocialApp/chatscreen/messgemodel.dart';
import 'package:androidstudio_fles_socialapp/SocialApp/homesScreen/FEEDSCREEN/feedScreen.dart';
import 'package:androidstudio_fles_socialapp/SocialApp/homesScreen/Searchscreen/search_screen.dart';
import 'package:androidstudio_fles_socialapp/SocialApp/homesScreen/home_screen/home_Screen.dart';
import 'package:androidstudio_fles_socialapp/SocialApp/homesScreen/homestates.dart';
import 'package:androidstudio_fles_socialapp/SocialApp/homesScreen/post_screen/postmodel.dart';
import 'package:androidstudio_fles_socialapp/SocialApp/homesScreen/post_screen/posts_Screen.dart';
import 'package:androidstudio_fles_socialapp/SocialApp/homesScreen/settengs%20_screen/setting_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../Register/REGISTERMODEL.dart';
import 'FEEDSCREEN/commentmodel.dart';
import 'User_screen/Acount_screen.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;


class HomelayoutCubit extends Cubit<HomeStates>
{
  HomelayoutCubit() :super (homeINTIALstate());

static  HomelayoutCubit get(context)=> BlocProvider.of(context);

   socialUSERModel? model;
void getuser()
{
  emit(homeloadinggetuserstate());
  FirebaseFirestore.instance.collection('users')
  .doc(cachehelper.getdata(key: 'uId'))
  .get()
  .then((value) {
print(cachehelper.uId);

    print(value.data());

     model=socialUSERModel.fromJson(value.data());
    emit(homesuccesgetUSERstate());
  })
  .catchError((error){
    print(error.toString());
    emit(homeerrorGetUserstate(error.toString()));
  });

}

  List<String> Titles=[
    'Home',
    'Search',
    'Add Post',
    'My profile',
    'chats',
  ];

List<Widget> screens=[
  feeds_screen(),
  Searchscreen(),
  Addpostscreen(),
  Profilescreen(),
  chatscreen(),
];

int currentindex=0;
void changebottomnav(int index)
{
  currentindex=index;
  if(currentindex==4)
    getallusers();
  if(currentindex!=4)
    allusers.clear();
  if(currentindex==0)
    getposts();
  if(currentindex!=0)
 { posts.clear();
   postsid.clear();
   likesofpost.clear();
     countcomment.clear();
     comments.clear();
 }
  if(currentindex!=2) {
    postimage = null;
  }

  emit(homeCHANGEBOTTUMSTATEstate());
}
///////////////////////////////////////////////////////////////////////

  // pick image edit profile from gallery

File? coverimage;
  final ImagePicker picker = ImagePicker();

  Future<void> getcoverimage() async {
    final PickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (PickedFile != null) {
      coverimage = File(PickedFile.path);
      print(coverimage);
      emit(editprofilechangecoverphotostate());
    } else {
      print('No image Selected.');

    }
  }

  File? profileimage;

  Future<void> getprofileimage() async {
    final PickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (PickedFile != null) {
      profileimage = File(PickedFile.path);
      print(profileimage);
      emit(editprofilechangeProfilephotostate());
    } else {
      print('No image Selected.');

    }
  }
//////////////////////////////////////////////////

  //uploadeditprofile images

  String coverimageurl='';

  void uploadcoverimage()
  {
    emit(UPLOADLOADINGFIRESTORAGEcoverSTATE());
    firebase_storage.
    FirebaseStorage.
    instance.ref()
        .child
      ('users/${Uri.file(coverimage!.path)
        .pathSegments.last}').
    putFile(coverimage!).then((value)
    {
      value.ref.getDownloadURL().
      then((value)
      {
        print(value);
        coverimageurl=value;
        emit(UPLOADFIRESTORAGEcoverSTATE());
      }).
      catchError((error)
      {
        emit(ERRORUPLOADFIRESTORAGEcoverSTATE());

        print(error.toString());
      }).catchError((error){

      });

    });
  }

  String profileimageurl='';

  void uploadProfileimage()
  {
    emit(UPLOADLOADINGFIRESTORAGEprofileSTATE());
    firebase_storage.
    FirebaseStorage.
    instance.ref()
        .child
      ('users/${Uri.file(profileimage!.path)
        .pathSegments.last}').
    putFile(profileimage!).then((value)
    {
      value.ref.getDownloadURL().
      then((value)
      {
        print(value);
        profileimageurl=value;
        emit(UPLOADFIRESTORAGEprofileSTATE());
      }).
      catchError((error)
      {
        emit(ERRORUPLOADFIRESTORAGEprofileSTATE());

        print(error.toString());
      }).catchError((error){

      });

    });
  }





//////////////////////////////////////////////////////
  // gettingpostimage from gallery

  File? postimage=null;

  Future<void> getpostimage() async {
    final PickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (PickedFile != null) {
      postimage = File(PickedFile.path);
      print(postimage!.path);
      emit(successpostimagefromgallery());

    } else {
      print('No image Selected.');

    }
  }


  // postimageupload


  String postimageurl='';

  void uploadpostimage(
  {
  required text,
    required date,

}
      )
  {
    emit(uploadpostimageloadingstate());

    firebase_storage.
    FirebaseStorage.
    instance.ref()
        .child
      ('posts/${Uri.file(postimage!.path)
        .pathSegments.last}').
    putFile(postimage!).then((value)
    {
          value.ref.getDownloadURL().
          then((value)
          {
            print(value);
            postimageurl=value;
     createnewpost(text: text,
         date: date,
         postimage: value,
     );
     emit(createpostSUCCESSSTATE());
          }).
          catchError((error)
          {
            emit(createpostERRORSTATE());

            print(error.toString());
          }).catchError((error){

          });
          
    });
  }
  // create post with image or not if image go to upload image fun no image go to create post fun

  void createnewpost({
    required text,
    required date,
    String? postimage,
  })
  {
    emit(createpostloadingstate());

    postModel  postmodel=postModel(
      name: model!.name,
      date: date,
      postimage: postimage==null?'':postimage,
      image:  model!.image,
      uid: model!.uid,
      text: text,

    );


    FirebaseFirestore.instance.collection('posts')
        .add(postmodel.toMap()).
    then((value) {
emit(createpostSUCCESSSTATE());

    }).
    catchError((error){
      emit(SocialUserupdateerrorstate());
    });


  }



//////////////////////////////////////////////////////////

//update user


  void updateuser({
    required namecont,
    required bio,
    required phonecont,
         coverimage,
         profileimage,
})
{
  emit(homeloadingUPDATEuserstate());

  socialUSERModel  usermodel=socialUSERModel(
    name: namecont,
    phone: phonecont,
    bio: bio,
    email: model!.email,
    cover:  coverimage==''? model!.cover:coverimage,
    image:  profileimage==''? model!.image:profileimage,
    uid: model!.uid,
  );


  FirebaseFirestore.instance.collection('users')
      .doc(cachehelper.getdata(key: 'uId')).update(usermodel.toMap()).
  then((value) {
    getuser();

  }).
  catchError((error){
    emit(SocialUserupdateerrorstate());
  });


}
////////////////////////////////////////////////////////

// get posts

List <postModel> posts=[];
  List<String> postsid=[];
  List<int>likesofpost=[];
late  List<commentModel>comments=[];

  List<int>countcomment=[];
bool flagcommentlength=true;

  void getposts()
  {emit(getpostloadingstate());

    FirebaseFirestore.instance.collection('posts')
    .get().then((value) {

       value.docs.forEach((element) {
         element.reference.collection('comments').get().then((value) {
           countcomment.add(value.docs.length);
              value.docs.forEach((element) {

                comments.add(commentModel.fromJson(element.data()));

              });})
         .catchError((error)
         {
           print(error.toString());
         }
         );
         element.reference.collection('likes').get().then((value)
         {

           likesofpost.add(value.docs.length);
           postsid.add(element.id);

           posts.add(postModel.fromJson(element.data()));

           emit(getpostsuccessstate());
         }).catchError((error){
               print(error.toString());
         });

       });


    })
        .catchError((error){
       print(error.toString());
       emit(getpostERRORstate());
    });
  }
  ///////////////////////////////////////////////////////////////
  // likes post
void likepost(postId)
{
  FirebaseFirestore.instance.collection('posts')
      .doc(postId).collection('likes')
      .doc(model!.uid)
      .set({
    'like':true
  })
      .then((value) {
    emit(getlikessuccessstate());

  })
      .catchError((error){
        print(error.toString());
        emit(getlikesERRORstate());
  });}
  void addcomment(postId,comment)
  {
    FirebaseFirestore.instance.collection('posts')
        .doc(postId).collection('comments')
        .doc()
        .set({
      'comment':comment,
      'commenterid':model!.uid,
      'image':model!.image,
      'name':model!.name,
    }).then((value) {
      emit(commentsuccessstate());
    }).catchError((error){
      print(error.toString());
      emit(commentERRORstate());
    });
  }

List<socialUSERModel> allusers=[];

  void getallusers()
  {
    emit(loadinggetalluserstate());
    FirebaseFirestore.instance.collection('users')
        .get().then((value) {
          value.docs.forEach((element) {
            if(element.data()['uid']!=model!.uid)
            allusers.add(socialUSERModel.fromJson(element.data()));
            emit(successgetalluserstate());
          });
print(allusers.length);

    }).catchError((error){
      print(error.toString());
      emit(errorgetalluserstate());

    });}


    void sendmessege
    ({required String reciverid,
      required String datetime,
      required String text,
    }){
         messageModel chatmodel=messageModel(
           text: text,
           reciverid: reciverid,
           senderid: model!.uid,
           datetime: datetime
         );
      
FirebaseFirestore.instance.collection('users')
         .doc(model!.uid)
         .collection('chats')
         .doc(reciverid)
         .collection('messages')
         .add(chatmodel.toMap())
         .then((value) {
}).catchError((error){
  print(error.toString());





});
// set reciverchat
         FirebaseFirestore.instance.collection('users')
             .doc(reciverid)
             .collection('chats')
             .doc(model!.uid)
             .collection('messages')
             .add(chatmodel.toMap())
             .then((value) {
           emit(successcreatemessagestate());
         }).catchError((error){
           emit(errorcreatemessagestate());
           print(error.toString());


         } );



  }

  List<messageModel> messges=[];


void getmesseges({
  required String reciverid
})
{
  FirebaseFirestore.instance.collection('users')
      .doc(model!.uid)
      .collection('chats')
      .doc(reciverid)
      .collection('messages')
      .orderBy('datetime')
      .snapshots()
      .listen((event) {
    messges=[];

    event.docs.forEach((element) {
    messges.add(messageModel.fromJson(element.data()));
    print('//////////');
    print(messges[0].text);
    });
    emit(getmassegessuccess());
  });

}









}