import 'package:chatapp/CustomUI/ButtonCard.dart';
import 'package:chatapp/CustomUI/ContactCard.dart';
import 'package:chatapp/Model/ChatModel.dart';
import 'package:flutter/material.dart';

class SelectContact extends StatefulWidget {
  SelectContact({Key key}) : super(key: key);

  @override
  _SelectContactState createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  List<ChatModel> chats = [
    ChatModel(
      name: "Dev Stack",
      currentMessage: "Hi Everyone",
    ),
    ChatModel(
      name: "Kishor",
      currentMessage: "Hi Kishor",
    ),
    ChatModel(
      name: "Dev Server Chat",
      currentMessage: "Hi Everyone on this group",
    ),
    ChatModel(
      name: "Collins",
      currentMessage: "Hi Dev Stack",
    ),
    ChatModel(
      name: "Friends",
      currentMessage: "Hi Buddy",
      time: "7:00",
      icon: "group.svg",
    ),
    ChatModel(
      name: "Flutter Community",
      currentMessage: "New flutter Post",
      time: "2:00",
      icon: "group.svg",
    ),
    ChatModel(
      name: "Balram Rathore",
      currentMessage: "Hi Dev Stack",
      time: "2:00",
      icon: "person.svg",
    ),
    ChatModel(
      name: "Flutter Help",
      currentMessage: "New flutter Post",
      time: "2:00",
      icon: "group.svg",
    ),
    ChatModel(
      name: "NodeJs Group",
      currentMessage: "New NodejS Post",
      time: "2:00",
      icon: "group.svg",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select contact",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "267 contacts",
              style: TextStyle(
                fontSize: 13,
              ),
            )
          ],
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                size: 26,
              ),
              onPressed: () {}),
          PopupMenuButton<String>(
            padding: EdgeInsets.all(0),
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext contesxt) {
              return [
                PopupMenuItem(
                  child: Text("View Contact"),
                  value: "View Contact",
                ),
                PopupMenuItem(
                  child: Text("Media, links, and docs"),
                  value: "Media, links, and docs",
                ),
                PopupMenuItem(
                  child: Text("Whatsapp Web"),
                  value: "Whatsapp Web",
                ),
                PopupMenuItem(
                  child: Text("Search"),
                  value: "Search",
                ),
                PopupMenuItem(
                  child: Text("Mute Notification"),
                  value: "Mute Notification",
                ),
                PopupMenuItem(
                  child: Text("Wallpaper"),
                  value: "Wallpaper",
                ),
              ];
            },
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: chats.length + 2,
          itemBuilder: (contex, index) {
            if (index == 0) {
              return ButtonCard(
                icon: Icons.group,
                name: "New group",
              );
            }
            if (index == 1) {
              return ButtonCard(
                icon: Icons.person_add,
                name: "New contact",
              );
            }
            return ContactCard(
              chatModel: chats[index - 2],
            );
          }),
    );
  }
}
