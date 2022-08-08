import 'package:androidstudio_fles_socialapp/Shared/Components/components.dart';
import 'package:androidstudio_fles_socialapp/Shared/style/styles.dart';
import 'package:androidstudio_fles_socialapp/SocialApp/chatscreen/chat_screen.dart';
import 'package:androidstudio_fles_socialapp/SocialApp/homesScreen/homecubit.dart';
import 'package:androidstudio_fles_socialapp/SocialApp/homesScreen/homestates.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home_screen extends StatelessWidget {

  final items=<Widget>[
    Icon(Icons.home,size: 30,color: Colors.white,),
    Icon(Icons.search,size: 30,color: Colors.white,),
    Icon(Icons.add,size: 30,color: Colors.white,),
    Icon(Icons.account_circle_rounded,size: 30,color: Colors.white,),
    Icon(Icons.chat,size: 30,color: Colors.white,),

  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomelayoutCubit,HomeStates>
      (
      listener: (context,state){},
      builder: (context,state){
        return  Scaffold(
          extendBody: true,
            appBar: AppBar(
              title: Text(
                 HomelayoutCubit.get(context).Titles[HomelayoutCubit.get(context).currentindex],
                style:TextStyle(
                  color: defultcolor,
                )

              ),
              actions: [
                IconButton(onPressed:(){


                }
                    , icon:
                    Icon(
                      Icons.notifications,
                      color: defultcolor,
                    ),


                ),
                IconButton(onPressed:(){
                  navigateto(context, chatscreen());
                }
                  , icon:
                  Icon(
                      Icons.chat
                          ,color: defultcolor,
                  ),


                ),

              ],
            ),
            body: HomelayoutCubit.get(context).screens[HomelayoutCubit.get(context).currentindex],

            bottomNavigationBar:
            CurvedNavigationBar(
              items: items,
              onTap: (index){
                HomelayoutCubit.get(context).changebottomnav(index);
              },
              backgroundColor: Colors.transparent,
              buttonBackgroundColor: defultcolor,
animationCurve: Curves.easeInOutQuint,
              animationDuration: Duration(milliseconds: 700),
              color: defultcolor,
              index: HomelayoutCubit.get(context).currentindex,
            )
        );
      },

    );
  }
}
