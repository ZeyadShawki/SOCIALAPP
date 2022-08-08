abstract class HomeStates{}

class homeINTIALstate extends HomeStates{}
class homeCHANGEBOTTUMSTATEstate extends HomeStates{}

class homeloadinggetuserstate extends HomeStates{}
class homesuccesgetUSERstate extends HomeStates{}
class homeerrorGetUserstate extends HomeStates{
  String error;
  homeerrorGetUserstate(this.error);
}
class editprofilechangecoverphotostate extends HomeStates{}
class editprofilechangeProfilephotostate extends HomeStates{}

class UPLOADFIRESTORAGEprofileSTATE extends HomeStates{}
class ERRORUPLOADFIRESTORAGEprofileSTATE extends HomeStates{}

class UPLOADLOADINGFIRESTORAGEcoverSTATE extends HomeStates{}
class UPLOADLOADINGFIRESTORAGEprofileSTATE extends HomeStates{}


class UPLOADFIRESTORAGEcoverSTATE extends HomeStates{}
class ERRORUPLOADFIRESTORAGEcoverSTATE extends HomeStates{}

class SocialUserupdateerrorstate extends HomeStates{}

class SocialUserupdateLOADINGstate extends HomeStates{}
class homeloadingUPDATEuserstate extends HomeStates{}

//getting postimage from gallery

class successpostimagefromgallery extends HomeStates{}
//upload post image
class uploadpostimageloadingstate extends HomeStates{}
class uploadpostimagesuccessstate extends HomeStates{}
class uploadpostimageerrorstate extends HomeStates{}

// create post

class createpostloadingstate extends HomeStates{}

class createpostSUCCESSSTATE extends HomeStates{}
class createpostERRORSTATE extends HomeStates{}
//
// get post
class getpostloadingstate extends HomeStates{}

class getpostsuccessstate extends HomeStates{}
class getpostERRORstate extends HomeStates{}
// likes states
class getlikessuccessstate extends HomeStates{}
class getlikesERRORstate extends HomeStates{}


class refrshstate extends HomeStates{}
// add comment states
class commentsuccessstate extends HomeStates{}
class commentERRORstate extends HomeStates{}


class commentsuccesstate extends HomeStates{}
// get all users for chat
class loadinggetalluserstate extends HomeStates{}
class successgetalluserstate extends HomeStates{}


class errorgetalluserstate extends HomeStates{}
// chat add messege
class loadingcreatemessagestate extends HomeStates{}
class successcreatemessagestate extends HomeStates{}


class errorcreatemessagestate extends HomeStates{}
//stream of massegse
class getmassegessuccess extends HomeStates{}
