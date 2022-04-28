import 'package:chat_app/constants/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessagesModel {
 final String message;
 final Timestamp createdAt;
 final String Id;

  MessagesModel(this.message, this.createdAt,this.Id);

  factory MessagesModel.fromJson(json) {
    return MessagesModel(json[kMessages],json[kCreatedAt],json[kId]);
  }
}
