abstract class Registerstates{}
class Registerintialstate extends Registerstates{}
class Registerloadingstate extends Registerstates{}
class Registersucessstate extends Registerstates{}
class Registererrorstate extends Registerstates{
  final String error;
  Registererrorstate({required this.error});
}
class registerpasswordstate extends Registerstates{}


class Createuserloadingstate extends Registerstates{}
class Createusersucessstate extends Registerstates{}
class Createusererrorstate extends Registerstates{
  final String error;
Createusererrorstate({required this.error});
}