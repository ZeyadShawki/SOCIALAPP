
import 'package:androidstudio_fles_socialapp/Shared/cachehelper.dart';
import 'package:androidstudio_fles_socialapp/Shared/style/styles.dart';
import 'package:androidstudio_fles_socialapp/SocialApp/Login/loginCubit.dart';
import 'package:androidstudio_fles_socialapp/SocialApp/Login/loginStates.dart';
import 'package:androidstudio_fles_socialapp/SocialApp/Login/login_screen.dart';
import 'package:androidstudio_fles_socialapp/SocialApp/homesScreen/home_screen/home_Screen.dart';
import 'package:androidstudio_fles_socialapp/SocialApp/homesScreen/homecubit.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Shared/bloc_observer.dart';

void   main() {
  BlocOverrides.runZoned(
        () async{
          await WidgetsFlutterBinding.ensureInitialized();
          await Firebase.initializeApp();
      await cachehelper.init();
      Widget startwidget=loginscreen();
      print(cachehelper.getdata(key: 'uId'));
      if(cachehelper.getdata(key: 'uId')!=null)
        startwidget=Home_screen();




      runApp(MyApp(startwidget));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget{

Widget startwidget;
MyApp(this.startwidget);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext  context)=>logincubit()),
        BlocProvider(create: (BuildContext  context)=>HomelayoutCubit()..getposts()..getuser()..getallusers())

      ],
      child: BlocConsumer<logincubit,loginstates>(
listener: (context,state){},
       builder: (context,state){
         return  MaterialApp(
           debugShowCheckedModeBanner: false,
           theme: lighttheme,

           home: startwidget,
         );

       },
      ),
    );
  }
}

