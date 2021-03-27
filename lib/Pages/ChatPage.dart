import 'package:chatapp/CustomUI/CustomCard.dart';
import 'package:chatapp/Model/ChatModel.dart';
import 'package:chatapp/Model/MessgeModel.dart';
import 'package:chatapp/Screens/SelectContact.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatPage extends StatefulWidget {
  ChatPage({Key key, this.chatmodels, this.sourchat}) : super(key: key);
  final List<ChatModel> chatmodels;
  final ChatModel sourchat;

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (builder) => SelectContact()));
        },
        child: Icon(
          Icons.chat,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: widget.chatmodels.length,
        itemBuilder: (contex, index) => CustomCard(
          chatModel: widget.chatmodels[index],
          sourchat: widget.sourchat,
        ),
      ),
    );
  }
}
