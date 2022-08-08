import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


void navigateto(context,Widget)=>Navigator.push(context, MaterialPageRoute(builder: (context) =>Widget, ) );



void navigateandfinish(context,Widget)=>Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>Widget, ),
      (Route<dynamic> route)=> false,
);

void toast({
  required String massege,
  required toaststates state,
})=> Fluttertoast.showToast(
    msg: massege,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: choosetoaststates(state),
    textColor: Colors.white,
    fontSize: 16.0
);
enum toaststates {grey,succes,error,warning}

Color  choosetoaststates(toaststates state)
{
  Color color=  Colors.red;
  switch(state)
  {
    case toaststates.grey:color=Colors.grey;
    break;
    case toaststates.succes:color=Colors.green;
    break;
    case toaststates.warning:color=Colors.yellow;
    break;
    case toaststates.error:Colors.red;
    break;
  }

  return color;
}