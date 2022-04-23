import 'package:chat_app/constants/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessagesModel {
 final String message;
 final Timestamp createdAt;

  MessagesModel(this.message, this.createdAt);

  factory MessagesModel.fromJson(json) {
    return MessagesModel(json[kMessages],json[kCreatedAt]);
  }
}
