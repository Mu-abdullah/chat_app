import 'package:chat_app/deta/models/messages_models.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constants/const.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    Key? key,
    required this.message, required this.createdAt,
  }) : super(key: key);

  final MessagesModel message;
  final MessagesModel createdAt;

  @override
  Widget build(BuildContext context) {

    ModalRoute.of(context)!.settings.arguments;

    var time = message.createdAt.toDate();
    DateFormat.yMMMd().add_jm().format(time);
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Container(
          decoration: const BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height*.01,),
                        Text(DateFormat.jm().format(time).toString(),style: TextStyle(
                            color: Colors.white,
                            fontSize: 12
                        ),),
                      ],
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*.01,),
                    Text(
                      message.message,
                      maxLines: 10,
                      style: const TextStyle(color: Colors.white, fontSize: 21),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}


class ChatBubbleForFriend extends StatelessWidget {
  const ChatBubbleForFriend({
    Key? key,
    required this.message, required this.createdAt,
  }) : super(key: key);

  final MessagesModel message;
  final MessagesModel createdAt;

  @override
  Widget build(BuildContext context) {

    var time = message.createdAt.toDate();
    DateFormat.yMMMd().add_jm().format(time);
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Container(
          decoration: const BoxDecoration(
              color: kSecondColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      message.message,
                      maxLines: 10,
                      style: const TextStyle(color: Colors.white, fontSize: 21),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*.01,),
                    Column(mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height*.01,),
                        Text(DateFormat.jm().format(time).toString(),style: TextStyle(
                            color: Colors.white,
                            fontSize: 12
                        ),),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
