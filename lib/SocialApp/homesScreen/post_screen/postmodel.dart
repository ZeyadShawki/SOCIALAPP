class postModel{
  String? name;
  String? uid;
  String? image;
  String? date;
  String? postimage;
  String? text;

  postModel({
    this.name,
    this.uid,
    this.image,
    this.date,
    this.postimage,
       this.text,
  });
  postModel.fromJson(Map<String,dynamic>? json)
  {
    name=json!['name'];
    uid=json['uid'];
    image=json['image'];
    date=json['date'];
    postimage=json['postimage'];
    text=json['text'];

  }

  Map<String,dynamic> toMap()
  {
    return {
      'name':name,
      'uid':uid,
      'image':image,
      'postimage':postimage,
      'date':date,
        'text':text,
    };
  }
}