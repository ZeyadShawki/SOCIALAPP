import 'package:androidstudio_fles_socialapp/Shared/style/styles.dart';
import 'package:androidstudio_fles_socialapp/SocialApp/homesScreen/FEEDSCREEN/commentmodel.dart';
import 'package:androidstudio_fles_socialapp/SocialApp/homesScreen/homecubit.dart';
import 'package:androidstudio_fles_socialapp/SocialApp/homesScreen/homestates.dart';
import 'package:androidstudio_fles_socialapp/SocialApp/homesScreen/post_screen/postmodel.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class feeds_screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var cubit=HomelayoutCubit.get(context);

    return BlocConsumer<HomelayoutCubit,HomeStates>(
      listener: (context,state){},
      builder: (context,state){
        return  BuildCondition(
          condition: cubit.posts!=null,
          builder: (context){
            return Scaffold(

              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [

                      ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context,index)=>buildcardSocial(context,cubit.posts[index],cubit.postsid[index],index,cubit.countcomment[index]),
                          separatorBuilder:(context,index)=> Divider(),
                          itemCount: cubit.posts.length),

                      SizedBox(height: 100),
                    ],
                  ),
                ),
              ),

            );
          },
          fallback: (context){
            return  Card(
              elevation: 10,

              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Image(
                    fit: BoxFit.cover,
                    image:
                    NetworkImage('https://img.freepik.com/free-photo/glad-european-female-has-broad-smile-wears-elegant-hat-points-with-thumb-aside-shows-direction-stranger-looks-freindly-isolated-pink-wall_273609-15243.jpg?w=826&t=st=1659457799~exp=1659458399~hmac=c0d22ad4da499ca0f046be23cc1b710d5705c96ea1920fd0fcbe12adb5a14371'),

                  ),
                  Text(
                    'communicate with your friends',
                    style: TextStyle(
                      fontSize: 20,
                    ),

                  )
                ],
              ),
            );
          },

        );
      },
    );

  }


  Widget buildcardSocial(context,postModel model, String postid,int index,int commentcount)
  {
    var commentcontroller=TextEditingController();
    final formkey = GlobalKey<FormState>();
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(model.image.toString()),
                          radius: 25,

                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              model.name.toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,

                              ),
                            ),
                            Text(
                              model.date.toString(),
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                Spacer(),
                IconButton(onPressed: (){},
                    icon: Icon(
                        Icons.more_horiz
                    )),
              ],

            ),


            Divider(),

            Text(
              model.text.toString(),
              style: TextStyle(
                  fontSize: 17,
                  height: 1.4,
                  fontWeight: FontWeight.w500
              ),
            ),

            // Wrap(
            // children: [
            // Padding(
            // padding: EdgeInsetsDirectional.only(
            // end: 5
            // ),
            //
            // child: Container(
            // height: 25,
            // child: MaterialButton(
            // minWidth: 1,
            // padding: EdgeInsets.zero,
            // onPressed: (){},
            // child:
            // Text(
            // '#software',
            // style: TextStyle(
            // color: defultcolor
            // ),
            // ),
            // ),
            //
            // ),
            // ),
            // Padding(
            // padding: EdgeInsetsDirectional.only(
            // end: 5
            // ),
            //
            // child: Container(
            // height: 25,
            // child: MaterialButton(
            // minWidth: 1,
            // padding: EdgeInsets.zero,
            // onPressed: (){},
            // child:
            // Text(
            // '#Mobile_devolpment',
            // style: TextStyle(
            // color: defultcolor
            // ),
            // ),
            // ),
            //
            // ),
            // ),
            // ],
            //
            // ),
            if(model.postimage!='')
              Card(
                child: Image(
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                  image: NetworkImage(
                      model.postimage.toString()
                  ),),
              ),

            Row(
              children: [

                Expanded(
                  child: InkWell(

                    onTap: (){},
                    child: Padding(
                      padding:  EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 10
                      ),          child: Row(
                      children: [



                        Icon(
                          Icons.favorite_border_outlined,

                          color: Colors.red,

                          size: 18,
                        ),

                        Text(

                          '  ${HomelayoutCubit.get(context).likesofpost[index]}',

                          style: TextStyle(



                              fontSize: 12,
                              fontWeight: FontWeight.w500

                          ),

                        ),

                      ],

                    ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: (){},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 10
                      ),
                      child: Row(


                        children: [



                          Icon(
                            Icons.chat_bubble_outline,

                            color: Colors.yellow,

                            size: 18,
                          ),

                          Text(

                            ' ${commentcount} comment',

                            style: TextStyle(

                                fontSize: 12,
                                fontWeight: FontWeight.w500

                            ),

                          ),

                        ],

                      ),
                    ),
                  ),
                ),

              ],
            ),
            Divider(),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(model.image.toString()),
                  radius: 15,

                ),

                Container(
                  width: 200,
                  child: TextButton(onPressed: (){

                    // showModalBottomSheet(
                    //   context: context,
                    //
                    //   isScrollControlled: true,
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.vertical(
                    //       top: Radius.circular(30),
                    //     ),
                    //   ),
                    //   backgroundColor: lighttheme.scaffoldBackgroundColor,
                    //   builder: (context){
                    //
                    //     return BuildCondition(
                    //       condition: !(commentmodel==null),
                    //       builder: (context){
                    //         return  Form(
                    //           key: formkey,
                    //
                    //           child: Column(
                    //             mainAxisAlignment: MainAxisAlignment.end,
                    //             mainAxisSize: MainAxisSize.min,
                    //             children: [
                    //
                    //               Padding(
                    //                 padding: const EdgeInsets.all(12.0),
                    //                 child: Column(
                    //                   crossAxisAlignment: CrossAxisAlignment.start,
                    //                   children: [
                    //                     Row(
                    //                       children: [
                    //                         CircleAvatar(
                    //                           backgroundImage: NetworkImage(commentmodel.image.toString()),
                    //                           radius: 20,
                    //
                    //                         ),
                    //                         SizedBox(width: 15,),
                    //                         Text(
                    //                           commentmodel.name.toString(),
                    //
                    //                           maxLines: 1,
                    //                           overflow: TextOverflow.ellipsis,
                    //                           textAlign: TextAlign.start,
                    //                           style: TextStyle(
                    //                             fontSize: 15,
                    //                             fontWeight: FontWeight.bold,
                    //
                    //                           ),
                    //                         ),
                    //
                    //                       ],),
                    //                     SizedBox(height: 10,),
                    //                     Wrap(
                    //                       children: [
                    //                         Text(
                    //                           commentmodel.comment.toString(),
                    //
                    //                           maxLines: 8,
                    //                           overflow: TextOverflow.ellipsis,
                    //                           textAlign: TextAlign.center,
                    //                           style: TextStyle(
                    //                             fontSize: 18,
                    //
                    //                           ),
                    //                         ),
                    //
                    //                       ],
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ),
                    //               Padding(
                    //                 padding: const EdgeInsets.all(12.0),
                    //                 child: Column(
                    //                   crossAxisAlignment: CrossAxisAlignment.start,
                    //                   children: [
                    //                     Row(
                    //                       children: [
                    //                         CircleAvatar(
                    //                           backgroundImage: NetworkImage(commentmodel.image.toString()),
                    //                           radius: 20,
                    //
                    //                         ),
                    //                         SizedBox(width: 15,),
                    //                         Text(
                    //                           commentmodel.name.toString(),
                    //
                    //                           maxLines: 1,
                    //                           overflow: TextOverflow.ellipsis,
                    //                           textAlign: TextAlign.start,
                    //                           style: TextStyle(
                    //                             fontSize: 15,
                    //                             fontWeight: FontWeight.bold,
                    //
                    //                           ),
                    //                         ),
                    //
                    //                       ],),
                    //                     SizedBox(height: 10,),
                    //                     Wrap(
                    //                       children: [
                    //                         Text(
                    //                           commentmodel.comment.toString(),
                    //
                    //                           maxLines: 8,
                    //                           overflow: TextOverflow.ellipsis,
                    //                           textAlign: TextAlign.center,
                    //                           style: TextStyle(
                    //                             fontSize: 18,
                    //
                    //                           ),
                    //                         ),
                    //
                    //                       ],
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ),
                    //               SizedBox(height: 20,),
                    //               Padding(
                    //                 padding:  EdgeInsets.only(
                    //                   bottom: MediaQuery.of(context).viewInsets.bottom,
                    //                 ),
                    //                 child: TextFormField(
                    //                   controller: commentcontroller,
                    //                   decoration: InputDecoration(
                    //                     border: InputBorder.none,
                    //                     hintText: 'write your comment...',
                    //                     prefixIcon: Icon(Icons.chat_bubble_outline),
                    //                     suffixIcon: IconButton(
                    //                       onPressed: (){
                    //                         if (formkey.currentState!.validate())
                    //                         {
                    //                           HomelayoutCubit.get(context).addcomment(postid, commentcontroller.text);
                    //                         }
                    //                       },
                    //                       icon: Icon(Icons.send),
                    //                     ),
                    //                   ),
                    //                   validator: (String ? value){
                    //                     if(value!.isEmpty)
                    //                       return 'comment should not be empty';
                    //                     return null;
                    //                   },
                    //                   onSaved: (value) {
                    //                     print(value);
                    //                   },
                    //                   onFieldSubmitted: (value){
                    //                     if (formkey.currentState!.validate())
                    //                     {
                    //                       HomelayoutCubit.get(context).addcomment(postid, commentcontroller.text);
                    //                     }
                    //
                    //                   },
                    //
                    //                 ),
                    //               ),
                    //
                    //             ],
                    //           ),
                    //         );
                    //       },
                    //       fallback: (context){
                    //        return SizedBox(width: 10,);
                    //       },
                    //     );
                    //   },
                    // );

                  },

                    child:  Text(
                      'Write a comment...',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),),
                ),
                Spacer(),

                InkWell(
                  onTap: (){
                    HomelayoutCubit.get(context).likepost(postid);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.favorite_border_outlined
                        ,
                        color: Colors.red,

                      ),
                      Text(
                          '  Like'
                      ),
                    ],
                  ),
                )


              ],
            )
          ],
        ),
      ),

    );
  }
}
