import 'package:androidstudio_fles_socialapp/Shared/Components/components.dart';
import 'package:androidstudio_fles_socialapp/Shared/style/styles.dart';
import 'package:androidstudio_fles_socialapp/SocialApp/homesScreen/homecubit.dart';
import 'package:androidstudio_fles_socialapp/SocialApp/homesScreen/homestates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class Addpostscreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var cubit=HomelayoutCubit.get(context);
    var postcontroller=TextEditingController();
    final formkey = GlobalKey<FormState>();
    return BlocConsumer<HomelayoutCubit,HomeStates>(
      listener: (context,state){},
      builder: (context,state){
        return Form(
          key: formkey,
          child: Scaffold(
            body:
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    if(state is uploadpostimageloadingstate || state is createpostloadingstate  )
                    LinearProgressIndicator(),

                    SizedBox(height: 10,),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage((cubit.model!.image)!),
                          radius: 35,

                        ),
                        SizedBox(width: 10,),
                        Text(
                          'Zeyad shawki',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,

                          ),
                        ),
                        Spacer(),
                        TextButton(onPressed: (){
                           if(!(formkey.currentState!.validate())&&cubit.postimage==null)
                             {
                               toast(massege: 'add text or image to post', state: toaststates.error);
                            }
                           else if(postcontroller.text!=null||cubit.postimage!=null)
                             {
                               DateTime now = DateTime.now();
                               String formattedDate = DateFormat('hh:mm a  EEE d MMM').format(now);
                               if(cubit.postimage==null)
                               {
                                 cubit.createnewpost(
                                     text: postcontroller.text,
                                     date: formattedDate);

                               }
                               else {
                                 cubit.uploadpostimage(
                                     text: postcontroller.text,
                                     date: formattedDate
                                 );
                               }
                             }

                        },
                            child: Text('post'
                            ,style:TextStyle(
                                fontSize: 20,
                              ),
                            ))
                      ],),
                    SizedBox(height: 15,),

                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 200,
                          child: TextFormField(
                            controller: postcontroller,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Whats in your mind...',


                            ),
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                            validator: (String ? value){
                              if(value!.isEmpty && cubit.postimage==null)
                                return 'post should not be empty';
                              return null;
                            },
                            onSaved: (value) {
                              print(value);
                            },


                          ),
                        ),
                        if(cubit.postimage!=null)
                        Container(
                          height: 300,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),

                          )
                          ,child: Image(
                          fit: BoxFit.cover,

                          image: FileImage((HomelayoutCubit.get(context).postimage)!) as ImageProvider ,


                        ),

                        ),
                        if(cubit.postimage==null)
                          SizedBox(height: 300,),

                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          TextButton(onPressed: (){
                            cubit.getpostimage();
                          },
                              child: Row(
                                children: [
                                  Icon(Icons.photo),
                                  Text('add photo'),
                                ],
                              )

                          ),
                          Spacer(),
                          TextButton(onPressed: (){},
                              child: Row(
                                children: [

                                  Text('# Tags'),
                                ],
                              )

                          ),
                        ],
                      ),
                    )

                  ],
                ),
              ),
            ),
          ),
        );
      },
    );

  }
}
