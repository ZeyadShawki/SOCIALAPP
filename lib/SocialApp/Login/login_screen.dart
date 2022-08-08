import 'package:androidstudio_fles_socialapp/SocialApp/Login/loginCubit.dart';
import 'package:androidstudio_fles_socialapp/SocialApp/Login/loginStates.dart';
import 'package:androidstudio_fles_socialapp/SocialApp/Register/Register_screen.dart';
import 'package:androidstudio_fles_socialapp/SocialApp/homesScreen/home_screen/home_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:buildcondition/buildcondition.dart';

import '../../Shared/Components/components.dart';
Widget loginscreen () {


  var emailcontroller=TextEditingController();
  var passwordcontroller=TextEditingController();
  final formkey=GlobalKey<FormState>();
  return BlocProvider(
      create: (BuildContext context)=>logincubit(),
      child: BlocConsumer<logincubit,loginstates>(
        listener: (context,state) {
          if(state is loginsuccessstate)
          {
            toast(massege: 'login succsfully', state: toaststates.succes);
                 navigateandfinish(context, Home_screen());
          }
          else  if(state is loginerrorstate)
            toast(massege: state.error.toString(), state: toaststates.error);

        },


        builder: (context,state){
          return Scaffold(
            appBar: AppBar(

            ),
            body: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Scrollbar(

                    child: Form(
                      key: formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'LOGIN',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 15,),
                          Text(
                            'Login to connect with your Freinds'
                            , style: TextStyle(
                            color: Colors.grey,
                          ),
                          ),
                          SizedBox(height: 30,),
                          TextFormField(
                            controller: emailcontroller,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email Adress',
                              prefixIcon: Icon(Icons.email),

                            ),
                            validator: (String ? value){
                              if(value!.isEmpty)
                                return 'Email should not be empty';
                              return null;
                            },
                            onSaved: (value) {
                              print(value);
                            },
                            onFieldSubmitted: (value){
                              if (formkey.currentState!.validate())
                              {
                                logincubit.get(context).userlogin(emailcont: emailcontroller.text
                                    , passwordcont: passwordcontroller.text);
                              }

                            },

                          ),
                          SizedBox(height: 15,),
                          TextFormField(
                            controller: passwordcontroller,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: IconButton(
                                  onPressed: (){
                                    logincubit.get(context).obscurepass();
                                  },
                                  icon: Icon(logincubit.get(context).suffixpass)),

                            ),

                            obscureText: logincubit.get(context).ispassword,
                            validator: (String ? value){
                              if(value!.isEmpty)
                                return 'Password should not be empty';
                              return null;
                            },

                            onSaved: (value) {
                              print(value);
                            },
                          ),
                          SizedBox(height: 15,),

                          Container(

                            width: double.infinity,
                            height: 50,
                            child: BuildCondition(

                              condition: true,
                              builder: (context)=>MaterialButton(onPressed: (){
                                if (formkey.currentState!.validate())
                                {
                                  logincubit.get(context).userlogin(emailcont: emailcontroller.text
                                      , passwordcont: passwordcontroller.text);
                                }
                              },
                                child:Text(
                                  'Login',
                                ),
                                color: Colors.blue,
                                elevation: 0,

                              ),
                              fallback:  (context) =>const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),

                          Center(
                            child:   Row(
                              children: [
                                Text('Dont\'t have an acount'),
                                SizedBox(
                                  width: 40,
                                ),

                                TextButton(onPressed: (){
                                  navigateto(context, registerscreen());
                                },

                                  child: Text(
                                      'Register now'
                                  ),)

                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      )
  );
}
Widget build(BuildContext context) {


  var emailcontroller=TextEditingController();
  var passwordcontroller=TextEditingController();
  final formkey=GlobalKey<FormState>();
  return BlocProvider(
      create: (BuildContext context)=>logincubit(),
      child: BlocConsumer<logincubit,loginstates>(
        listener: (context,state) {
          if(state is loginerrorstate)
            {
              toast(massege: state.error, state: toaststates.grey);
            }
          if(state is loginsuccessstate)
            toast(massege: 'login succefully', state: toaststates.grey);
        },


        builder: (context,state){
          return Scaffold(
            appBar: AppBar(

            ),
            body: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Scrollbar(

                    child: Form(
                      key: formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'LOGIN',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 15,),
                          Text(
                            'Login to connect with your Freinds'
                            , style: TextStyle(
                            color: Colors.grey,
                          ),
                          ),
                          SizedBox(height: 30,),
                          TextFormField(
                            controller: emailcontroller,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email Adress',
                              prefixIcon: Icon(Icons.email),

                            ),
                            validator: (String ? value){
                              if(value!.isEmpty)
                                return 'Email should not be empty';
                              return null;
                            },
                            onSaved: (value) {
                              print(value);
                            },
                            onFieldSubmitted: (value){
                              if (formkey.currentState!.validate())
                              {
                                logincubit.get(context).userlogin(emailcont: emailcontroller.text
                                    , passwordcont: passwordcontroller.text);
                              }

                            },

                          ),
                          SizedBox(height: 15,),
                          TextFormField(
                            controller: passwordcontroller,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: IconButton(
                                  onPressed: (){
                                    logincubit.get(context).obscurepass();
                                  },
                                  icon: Icon(logincubit.get(context).suffixpass)),

                            ),

                            obscureText: logincubit.get(context).ispassword,
                            validator: (String ? value){
                              if(value!.isEmpty)
                                return 'Password should not be empty';
                              return null;
                            },

                            onSaved: (value) {
                              print(value);
                            },
                          ),
                          SizedBox(height: 15,),

                          Container(

                            width: double.infinity,
                            height: 50,
                            child: BuildCondition(

                              condition: true,
                              builder: (context)=>MaterialButton(onPressed: (){
                                if (formkey.currentState!.validate())
                                {
                                  logincubit.get(context).userlogin(emailcont: emailcontroller.text
                                      , passwordcont: passwordcontroller.text);
                                }
                              },
                                child:Text(
                                  'Login',
                                ),
                                color: Colors.blue,
                                elevation: 0,

                              ),
                              fallback:  (context) =>const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),

                          Center(
                            child:   Row(
                              children: [
                                Text('Dont\'t have an acount'),
                                SizedBox(
                                  width: 40,
                                ),

                                TextButton(onPressed: (){
                                  navigateto(context, registerscreen());
                                },

                                  child: Text(
                                      'Register now'
                                  ),)

                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      )
  );
}
