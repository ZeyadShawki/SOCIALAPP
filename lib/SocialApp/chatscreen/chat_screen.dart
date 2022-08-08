
import 'package:androidstudio_fles_socialapp/Shared/Components/components.dart';
import 'package:androidstudio_fles_socialapp/SocialApp/Register/REGISTERMODEL.dart';
import 'package:androidstudio_fles_socialapp/SocialApp/chatscreen/chatmasseges.dart';
import 'package:androidstudio_fles_socialapp/SocialApp/homesScreen/homecubit.dart';
import 'package:androidstudio_fles_socialapp/SocialApp/homesScreen/homestates.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class chatscreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomelayoutCubit,HomeStates>(
      listener: (conext,state){},
      builder: (conext,state){
        return Scaffold(

          body:  Padding(
            padding: const EdgeInsets.all(20.0),
            child: BuildCondition(
              condition: HomelayoutCubit.get(context).allusers.length>0,
              builder: (context)=>ListView.separated(
                physics: BouncingScrollPhysics(),
                  itemBuilder: (context,index)=>buildchatitems(HomelayoutCubit.get(context).allusers[index],context),
                  separatorBuilder:(context,index)=> Divider(),
                  itemCount:  HomelayoutCubit.get(context).allusers.length),
              fallback: (context)=>Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        );
      },
    );
  }


  Widget buildchatitems(socialUSERModel user,context)=> InkWell(
    child: Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(
          user.image.toString()
          ),
          radius: 25,

        ),
        SizedBox(width: 10,),
        Text(
          user.name.toString()
          ,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,

          ),
        ),


      ],),
    onTap: (){
      navigateto(context, chatmassegesui(
        user: user,
      ));
    },
  );

}
