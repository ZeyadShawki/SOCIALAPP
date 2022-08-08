import 'dart:io';

import 'package:androidstudio_fles_socialapp/SocialApp/homesScreen/homecubit.dart';
import 'package:androidstudio_fles_socialapp/SocialApp/homesScreen/homestates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Shared/style/styles.dart';

class Edit_profilescreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var model=HomelayoutCubit.get(context).model;
   var namecontroller=TextEditingController();
namecontroller.text=(model!.name)!;


    var biocontroller=TextEditingController();
    biocontroller.text=(model.bio)!;

    var phonecontroller=TextEditingController();
    phonecontroller.text=(model.phone)!;




    return BlocConsumer<HomelayoutCubit,HomeStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
            actions: [
MaterialButton(onPressed: (){
  HomelayoutCubit.get(context).
  updateuser(
      namecont: namecontroller.text,
      bio: biocontroller.text,
      phonecont: phonecontroller.text,
    coverimage: HomelayoutCubit.get(context).coverimageurl,
       profileimage: HomelayoutCubit.get(context).profileimageurl,
  );
  HomelayoutCubit.get(context).profileimage=null;
  HomelayoutCubit.get(context).coverimage=null;
HomelayoutCubit.get(context).profileimageurl='';
  HomelayoutCubit.get(context).coverimageurl='';
if(state is homesuccesgetUSERstate)
  Navigator.pop(context);
}

    , child: Text(
      'Update',
    style: TextStyle(
      color: defultcolor,
    ),

    ),
color: lighttheme.scaffoldBackgroundColor,
elevation: 0,
),
            ],
            title: Text(
                'Edit profile'
            ),

          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  if(state is homeloadingUPDATEuserstate )
                  LinearProgressIndicator(),
                  SizedBox(height: 10,),
                  Container(
                    height: 250,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Align(


                          child: Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              Container(
                                height: 190,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),

                                )
                                ,child: Image(
                                fit: BoxFit.cover,

                               image: HomelayoutCubit.get(context).coverimage==null? NetworkImage('${model.cover}') :FileImage((HomelayoutCubit.get(context).coverimage)!) as ImageProvider ,


                              ),

                              ),
                              CircleAvatar(
                                child: IconButton
                                  (onPressed: (){
                                    HomelayoutCubit.get(context).getcoverimage();


                                },
                                    icon: Icon(
                                      Icons.add_a_photo_outlined
                                    )),
                              )
                            ],
                          ),
                          alignment: Alignment.topCenter,
                        ),
                        SizedBox(height: 30,),
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 75,
                              backgroundColor: lighttheme.scaffoldBackgroundColor,
                              child: CircleAvatar(

                                backgroundImage: HomelayoutCubit.get(context).profileimage==null?  NetworkImage('${model.image}'):FileImage((HomelayoutCubit.get(context).profileimage)!) as ImageProvider ,

                                radius: 70,
                              ),
                            ),
                            CircleAvatar(
                              child: IconButton(onPressed: (){
HomelayoutCubit.get(context).getprofileimage();

                              },
                                  icon: Icon(
                                      Icons.add_a_photo_outlined
                                  )),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),

                  Row(
                    children: [
                      if(HomelayoutCubit.get(context).coverimage!=null)
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              child: MaterialButton(onPressed: (){
                                HomelayoutCubit.get(context).uploadcoverimage();

                              },
                              child: Text(
                                'upload cover'
                              ),
                                color: defultcolor,
                              ),
                            ),
                            if(state is UPLOADLOADINGFIRESTORAGEcoverSTATE)
                              LinearProgressIndicator(),
                          ],
                        ),
                      ),

                      SizedBox(width: 10,),
                      if(HomelayoutCubit.get(context).profileimage!=null)
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              child: MaterialButton(onPressed: (){
                                HomelayoutCubit.get(context).uploadProfileimage();

                              },
                                child: Text(
                                    'upload profile'
                                ),
                                color: defultcolor,
                              ),
                            ),
                            if(state is UPLOADLOADINGFIRESTORAGEprofileSTATE)
                              LinearProgressIndicator(),
                          ],
                        ),
                      ),

                    ],
                  ),

                  SizedBox(height: 10,),
                  TextFormField(
                    controller: namecontroller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                      prefixIcon: Icon(Icons.person),

                    ),
                    validator: (String ? value){
                      if(value!.isEmpty)
                        return 'name should not be empty';
                      return null;
                    },
                    onSaved: (value) {
                      print(value);
                    },




                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    controller: biocontroller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'bio',
                      prefixIcon: Icon(Icons.info_outline),

                    ),
                    validator: (String ? value){
                      if(value!.isEmpty)
                        return 'bio should not be empty';
                      return null;
                    },
                    onSaved: (value) {
                      print(value);
                    },




                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    controller: phonecontroller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'phone',
                      prefixIcon: Icon(Icons.phone),

                    ),
                    validator: (String ? value){
                      if(value!.isEmpty)
                        return 'phone should not be empty';
                      return null;
                    },
                    onSaved: (value) {
                      print(value);
                    },




                  ),

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
