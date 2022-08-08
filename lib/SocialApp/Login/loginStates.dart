abstract class loginstates{}
class loginintialstate extends loginstates{}

class loginloadingstate extends loginstates{}
class loginsuccessstate extends loginstates{}
class loginerrorstate extends loginstates{
  String error;

  loginerrorstate({required this.error});

}
class loginshowpasswordstate extends loginstates{}