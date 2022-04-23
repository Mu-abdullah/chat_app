import 'package:chat_app/constants/const.dart';
import 'package:chat_app/deta/models/messages_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../widgets/chat_bubble.dart';
import '../../widgets/textfeild.dart';

class Home extends StatelessWidget {
  Home({
    Key? key,
  }) : super(key: key);
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessages);
  var controller = TextEditingController();

  final Stream<DocumentSnapshot<Map<String, dynamic>>> message =
      FirebaseFirestore.instance
          .collection(kMessages)
          .doc(kMessages)
          .snapshots();
  final Stream<DocumentSnapshot<Map<String, dynamic>>> time =
  FirebaseFirestore.instance
      .collection(kMessages)
      .doc(kCreatedAt)
      .snapshots();

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: StreamBuilder<QuerySnapshot>(
            stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Image.asset("assets/images/error.gif");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: kPrimaryColor,
                  ),
                );
              }
              if (snapshot.hasData) {
                List<MessagesModel> messagesList = [];
                for (int i = 0; i < snapshot.data!.docs.length; i++) {
                  messagesList
                      .add(MessagesModel.fromJson(snapshot.data!.docs[i]));
                }
                return Scaffold(
                  appBar: AppBar(
                    backgroundColor: kPrimaryColor,
                  ),
                  body: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          reverse: true,
                          controller: _scrollController,
                          itemCount: messagesList.length,
                          itemBuilder: (context, index) => ChatBubble(
                            message: messagesList[index],
                            createdAt: messagesList[index],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 8),
                        child: defaultFormField(context,
                            type: TextInputType.multiline,
                            prefix: Icons.message,
                            label: "Type your message",
                            isPassword: false,
                            suffix: IconButton(
                                onPressed: () {
                                  if(controller.text.isNotEmpty){
                                    messages.add({
                                      kMessages: controller.text,
                                      kCreatedAt: DateTime.now(),
                                    });
                                    controller.clear();

                                    _scrollController.animateTo(
                                      0.0,
                                      curve: Curves.easeOut,
                                      duration: const Duration(milliseconds: 300),
                                    );
                                  }else{
                                    _scrollController.animateTo(
                                      0.0,
                                      curve: Curves.easeOut,
                                      duration: const Duration(milliseconds: 300),
                                    );
                                  }

                                },
                                icon:const Icon(
                                  Icons.send,
                                  color: kPrimaryColor,
                                )),
                            controller: controller,
                            onSubmit: (data) {
                              messages.add({
                                kMessages: data,
                                kCreatedAt: DateTime.now(),
                              });
                              controller.clear();

                              _scrollController.animateTo(
                                0.0,
                                curve: Curves.easeOut,
                                duration: const Duration(milliseconds: 300),
                              );
                            }),
                      )
                    ],
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(
                  color: kPrimaryColor,
                ),
              );
            }));
  }
}
