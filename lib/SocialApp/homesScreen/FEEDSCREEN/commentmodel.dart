class commentModel{
  String? comment;
  String? uid;
  String? name;
  String? image;
  commentModel({
    this.uid,
    this.comment,
    this.name,
    this.image,
});
  commentModel.fromJson(Map<String,dynamic>? json)
  {
    comment=json!['comment'];
    uid=json['commenterid'];
    name=json['name'];
    image=json['image'];
  }
  Map<String,dynamic> toMap()
  {
    return{
      'comment':comment,
      'commenterid':uid,
      'name':name,
      'image':image,
    };
  }

}