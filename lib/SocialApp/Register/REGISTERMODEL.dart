//for register firestore
class socialUSERModel{
  String? name;
  String? phone;
  String? email;
  String? uid;
  String? image;
  String? cover;
String? bio;
  socialUSERModel({
    this.name,
    this.phone,
    this.email,
    this.uid,
    this.image,
    this.cover,
this.bio,
  });
  socialUSERModel.fromJson(Map<String,dynamic>? json)
  {
    name=json!['name'];
    phone=json['phone'];
    email=json['email'];
    uid=json['uid'];
    cover=json['cover'];
    image=json['image'];
    bio=json['bio'];

  }

  Map<String,dynamic> toMap()
  {
    return {
      'name':name,
    'phone':phone,
  'email':email,
  'uid':uid,
      'image':image,
      'cover':cover,
'bio':bio,
  };
  }
}