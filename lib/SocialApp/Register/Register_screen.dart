import 'package:androidstudio_fles_socialapp/Shared/Components/components.dart';
import 'package:androidstudio_fles_socialapp/SocialApp/Register/RegisterStates.dart';
import 'package:androidstudio_fles_socialapp/SocialApp/homesScreen/home_screen/home_Screen.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'RegisterCubit.dart';

class registerscreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    var emailcontroller=TextEditingController();
    var passwordcontroller=TextEditingController();
    var namecontroller=TextEditingController();

    var phonecontroller=TextEditingController();


    final formkey=GlobalKey<FormState>();
    return BlocProvider(
        create: (BuildContext context)=>REGISTERcubit(),
        child: BlocConsumer<REGISTERcubit,Registerstates>(
          listener: (context,state) {
           if(state is Registersucessstate)
            navigateandfinish(context, Home_screen());
           if(state is Registererrorstate)
             toast(massege: state.error.toString(), state: toaststates.grey);
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
                              'Register',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 15,),
                            Text(
                              'Register to know our latest hot offers'
                              , style: TextStyle(
                              color: Colors.grey,
                            ),
                            ),
                            SizedBox(height: 30,),
                            TextFormField(
                              controller: namecontroller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'name',
                                prefixIcon: Icon(Icons.person),

                              ),

                              validator: (String ? value){
                                if(value!.isEmpty)
                                  return 'Name should not be empty';
                                return null;
                              },

                              onSaved: (value) {
                                print(value);
                              },
                            ),
                            SizedBox(height: 15,),

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
                                  REGISTERcubit.get(context).userREGISTER(emailcont: emailcontroller.text
                                    , passwordcont: passwordcontroller.text,
                                    namecont:namecontroller.text,
                                    phonecont:passwordcontroller.text,

                                  );
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
                                      REGISTERcubit.get(context).obscurepass();
                                    },
                                    icon: Icon(REGISTERcubit.get(context).suffixpass)),

                              ),

                              obscureText: REGISTERcubit.get(context).ispassword,
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
                            SizedBox(height: 15,),
                            Container(

                              width: double.infinity,
                              height: 50,
                              child: BuildCondition(

                                condition: state is! Registersucessstate,
                                builder: (context)=>MaterialButton(onPressed: (){
                                  if (formkey.currentState!.validate())
                                  {
                                    REGISTERcubit.get(context).userREGISTER(emailcont: emailcontroller.text
                                      , passwordcont: passwordcontroller.text
                                      ,namecont: namecontroller.text,
                                      phonecont: phonecontroller.text,
                                    );
                                  }

                                },

                                  child:Text(
                                    'Register',
                                  ),
                                  color: Colors.blue,
                                  elevation: 0,

                                ),
                                fallback: (context) => const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.blue,
                                  ),
                                )
                              ),
                            ),



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
}