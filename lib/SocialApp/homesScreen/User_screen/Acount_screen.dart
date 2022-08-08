import 'package:androidstudio_fles_socialapp/Shared/Components/components.dart';
import 'package:androidstudio_fles_socialapp/Shared/style/styles.dart';
import 'package:androidstudio_fles_socialapp/SocialApp/Register/RegisterCubit.dart';
import 'package:androidstudio_fles_socialapp/SocialApp/Register/RegisterStates.dart';
import 'package:androidstudio_fles_socialapp/SocialApp/homesScreen/User_screen/editprofilescreen.dart';
import 'package:androidstudio_fles_socialapp/SocialApp/homesScreen/homecubit.dart';
import 'package:androidstudio_fles_socialapp/SocialApp/homesScreen/homestates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Register/REGISTERMODEL.dart';

class Profilescreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomelayoutCubit,HomeStates>(
      listener: (context , state){

      },
      builder: (context , state){
         var model=HomelayoutCubit.get(context).model;
print(model!.image);

        return Scaffold(
            body:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: 250,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Align(

                          child: Container(
                            height: 190,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),

                            )
                            ,child: Image(
                            fit: BoxFit.cover,
                            image:NetworkImage(
                                         '${model!.cover}',
                                ),

                          ),

                          ),
                          alignment: Alignment.topCenter,
                        ),
                        SizedBox(height: 30,),
                        CircleAvatar(
                          radius: 75,
                          backgroundColor: lighttheme.scaffoldBackgroundColor,
                          child: CircleAvatar(

                            backgroundImage: NetworkImage(
                              '${model.image}',
                            ),
                            radius: 70,
                          ),
                        ),

                      ],
                    ),
                  ),
                  Text(
                    model!.name.toString(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    '${model.bio}',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 25,),

                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          child: Column(
                            children: [
                              Text(
                                '100k',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'posts',
                                style: TextStyle(
                                    color: Colors.grey
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          child: Column(
                            children: [
                              Text(
                                '100k',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Photos',
                                style: TextStyle(
                                    color: Colors.grey
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          child: Column(
                            children: [
                              Text(
                                '100k',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Followers',
                                style: TextStyle(
                                    color: Colors.grey
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          child: Column(
                            children: [
                              Text(
                                '100k',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Following',
                                style: TextStyle(
                                    color: Colors.grey
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(onPressed: (){},


                          child: Text(
                            'Add photos'
                            ,style: TextStyle(
                            color:defultcolor,

                          ),
                          ),

                        ),
                      ),
                      SizedBox(width: 5,),
                      OutlinedButton(onPressed: (){
                        HomelayoutCubit.get(context).profileimage=null;
                        HomelayoutCubit.get(context).coverimage=null;
                        HomelayoutCubit.get(context).profileimageurl='';
                        HomelayoutCubit.get(context).coverimageurl='';

                        navigateto(context, Edit_profilescreen());
                      },
                        child: Icon(
                            Icons.mode_edit_outlined
                          ))
                    ],
                  )
                ],
              ),
            )
        );
      },
    );

  }
}
