import 'package:androidstudio_fles_socialapp/Shared/style/styles.dart';
import 'package:androidstudio_fles_socialapp/SocialApp/Register/REGISTERMODEL.dart';
import 'package:androidstudio_fles_socialapp/SocialApp/chatscreen/messgemodel.dart';
import 'package:androidstudio_fles_socialapp/SocialApp/homesScreen/homecubit.dart';
import 'package:androidstudio_fles_socialapp/SocialApp/homesScreen/homestates.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class chatmassegesui extends StatelessWidget {
  late socialUSERModel user;
  var textcontroller=TextEditingController();
  final formkey = GlobalKey<FormState>();

  chatmassegesui({
    required this.user
  });
  @override
  Widget build(BuildContext context) {
    return Builder(

      builder: (context) {
        HomelayoutCubit.get(context).getmesseges(reciverid: user.uid.toString());

        return BlocConsumer<HomelayoutCubit,HomeStates>(
          listener: (context,state){},
          builder: (context,state){
            return Scaffold(
              appBar: AppBar(
                titleSpacing: 0,
                title:   Row(
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
              ),
              body: BuildCondition(
                condition: true,
                builder: (context)=> Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(

                    children: [



                      Expanded(

                        child: SingleChildScrollView(

                          physics: BouncingScrollPhysics(),

                          child: Container(

                            height: 680,
                            child: ListView.separated(
                               shrinkWrap: true,
                                itemBuilder: (context,index){
                              var messages=HomelayoutCubit.get(context).messges[index];
                              if(HomelayoutCubit.get(context).model!.uid==messages.senderid)
                               return buildmymassege(messages);
                              return buildothermassege(messages);
                            },
                                separatorBuilder: (context,index)=>SizedBox(height: 10,),

                                itemCount:  HomelayoutCubit.get(context).messges.length),
                          ),
                        ),
                      ),
                         Container(
                           child: Form(

                             key: formkey,
                             child: Container(
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadiusDirectional.circular(30),
                                 color: defultcolor.withOpacity(.1),
                               ),
                               clipBehavior: Clip.antiAliasWithSaveLayer,
                               child: TextFormField(
                                 controller: textcontroller,
                                 decoration: InputDecoration(
                                   border: InputBorder.none,
                                   hintText: 'write your message...',
                                   prefixIcon: Icon(Icons.chat_bubble_outline),
                                   suffixIcon: IconButton(
                                     onPressed: (){
                                       if (formkey.currentState!.validate())
                                       {
                                         HomelayoutCubit.get(context).sendmessege(
                                             reciverid: user.uid.toString(),
                                             datetime: DateTime.now().toString(),
                                             text: textcontroller.text);
                                         textcontroller.clear();

                                       }
                                     },
                                     icon: Icon(Icons.send),
                                   ),
                                 ),
                                 validator: (String ? value){
                                   if(value!.isEmpty)
                                     return 'comment should not be empty';
                                   return null;
                                 },
                                 onSaved: (value) {
                                   print(value);
                                 },
                                 onFieldSubmitted: (value){
                                   if (formkey.currentState!.validate())
                                   {
                                     HomelayoutCubit.get(context).sendmessege(
                                         reciverid: user.uid.toString(),
                                         datetime: DateTime.now().toString(),
                                         text: textcontroller.text);
                                     textcontroller.clear();
                                   }

                                 },

                               ),
                             ),
                           ),
                         ),
                    ],
                  ),

                ),
                fallback: (context)=>Center(child: CircularProgressIndicator(),),

              ),


            );
          },
        );
      }
    );
  }

  Widget buildothermassege(messageModel massege)=> Align(
    alignment: AlignmentDirectional.centerStart,
    child: Container(

      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadiusDirectional.only(
          topEnd: Radius.circular(10),
          topStart: Radius.circular(10),
          bottomEnd: Radius.circular(10),


        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              textAlign: TextAlign.start,
              massege.text.toString()
          ),
          Text(

              massege.datetime.toString(),

            style: TextStyle(
              color: Colors.grey
                  ,fontSize: 10,

            ),
          ),
        ],
      ),
    ),
  );
  Widget buildmymassege(messageModel massege)=> Align(
    alignment: AlignmentDirectional.centerEnd,
    child: Container(

      decoration: BoxDecoration(
        color: defultcolor.withOpacity(.2),
        borderRadius: BorderRadiusDirectional.only(
          topEnd: Radius.circular(10),
          topStart: Radius.circular(10),
          bottomStart: Radius.circular(10),


        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              massege.text.toString()
          ),
          Text(

            massege.datetime.toString(),

            style: TextStyle(
              color: Colors.grey
              ,fontSize: 10,

            ),
          ),
        ],
      ),
    ),
  );

}
