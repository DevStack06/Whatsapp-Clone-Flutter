import 'package:chatapp/CustomUI/CustomCard.dart';
import 'package:chatapp/Model/ChatModel.dart';
import 'package:chatapp/Screens/SelectContact.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
      name: "Dev Stack",
      isGroup: false,
      currentMessage: "Hi Everyone",
      time: "4:00",
      icon: "person.svg",
    ),
    ChatModel(
      name: "Kishor",
      isGroup: false,
      currentMessage: "Hi Kishor",
      time: "13:00",
      icon: "person.svg",
    ),
    ChatModel(
      name: "Dev Server Chat",
      isGroup: true,
      currentMessage: "Hi Everyone on this group",
      time: "18:00",
      icon: "group.svg",
    ),
    ChatModel(
      name: "Collins",
      isGroup: false,
      currentMessage: "Hi Dev Stack",
      time: "8:00",
      icon: "person.svg",
    ),
    ChatModel(
      name: "Friends",
      isGroup: true,
      currentMessage: "Hi Buddy",
      time: "7:00",
      icon: "group.svg",
    ),
    ChatModel(
      name: "Flutter Community",
      isGroup: true,
      currentMessage: "New flutter Post",
      time: "2:00",
      icon: "group.svg",
    ),
    ChatModel(
      name: "Balram Rathore",
      isGroup: false,
      currentMessage: "Hi Dev Stack",
      time: "2:00",
      icon: "person.svg",
    ),
    ChatModel(
      name: "Flutter Help",
      isGroup: true,
      currentMessage: "New flutter Post",
      time: "2:00",
      icon: "group.svg",
    ),
    ChatModel(
      name: "NodeJs Group",
      isGroup: true,
      currentMessage: "New NodejS Post",
      time: "2:00",
      icon: "group.svg",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (builder) => SelectContact()));
        },
        child: Icon(Icons.chat),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (contex, index) => CustomCard(
          chatModel: chats[index],
        ),
      ),
    );
  }
}
