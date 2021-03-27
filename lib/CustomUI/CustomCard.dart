import 'package:chatapp/Model/ChatModel.dart';
import 'package:chatapp/Model/MessgeModel.dart';
import 'package:chatapp/Screens/IndividualPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class CustomCard extends StatelessWidget {
<<<<<<< HEAD
  const CustomCard(
      {Key key,
      this.chatModel,
      this.data,
      this.sendMessage,
      this.sourceChat,
      this.socket})
      : super(key: key);
  final ChatModel chatModel;
  final List<MessageModel> data;
  final Function sendMessage;
  final ChatModel sourceChat;
  final IO.Socket socket;
=======
  const CustomCard({Key key, this.chatModel, this.sourchat}) : super(key: key);
  final ChatModel chatModel;
  final ChatModel sourchat;
>>>>>>> master

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (contex) => IndividualPage(
                      chatModel: chatModel,
<<<<<<< HEAD
                      data: data,
                      sendMessage: sendMessage,
                      sourceChat: sourceChat,
                      socket: socket,
=======
                      sourchat: sourchat,
>>>>>>> master
                    )));
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: SvgPicture.asset(
                chatModel.isGroup ? "assets/groups.svg" : "assets/person.svg",
                color: Colors.white,
                height: 36,
                width: 36,
              ),
              backgroundColor: Colors.blueGrey,
            ),
            title: Text(
              chatModel.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Row(
              children: [
                Icon(Icons.done_all),
                SizedBox(
                  width: 3,
                ),
                Text(
                  chatModel.currentMessage,
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            trailing: Text(chatModel.time),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 80),
            child: Divider(
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
