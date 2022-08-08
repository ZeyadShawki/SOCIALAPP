class messageModel{
  String? senderid;
  String? reciverid;
  String? datetime;
  String? text;

  messageModel({
    this.senderid,
    this.reciverid,
    this.datetime,
    this.text,
  });
  messageModel.fromJson(Map<String,dynamic>? json)
  {
    senderid = json!['senderid'];
    reciverid = json['reciverid'];
    datetime = json['datetime'];
    text = json['text'];
  }

  Map<String,dynamic> toMap()
  {
    return {
      'senderid':senderid,
      'reciverid':reciverid,
      'datetime':datetime,
      'text':text,
    };
  }
}