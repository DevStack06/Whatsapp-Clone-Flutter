import 'package:chatapp/CustomUI/CustomCard.dart';
import 'package:chatapp/Model/ChatModel.dart';
import 'package:chatapp/Model/MessgeModel.dart';
import 'package:chatapp/Screens/SelectContact.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatPage extends StatefulWidget {
  ChatPage({
    Key key,
    this.chatmodel,
    this.sourceChat,
  }) : super(key: key);
  final List<ChatModel> chatmodel;
  final ChatModel sourceChat;

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  IO.Socket socket;

  Map<int, List<MessageModel>> messages = {
    1: [],
    2: [],
    3: [],
    4: [],
  };

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    connect();
  }

  void connect() {
    // MessageModel messageModel = MessageModel(sourceId: widget.sourceChat.id.toString(),targetId: );
    socket = IO.io("http://192.168.43.92:5000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect();
    socket.emit("/test", {"id": widget.sourceChat.id});
    socket.onConnect((data) {
      print("Connected");
      socket.on("message", (e) {
        print(e['message']);
        setMessage("destination", e["message"], e["sourceId"]);
        setState(() {});
      });
    });
  }

  void setMessage(String type, String message, int id) {
    MessageModel messageModel = MessageModel(type: type, message: message);
    List<MessageModel> data = messages[id];
    data.add(messageModel);
    setState(() {
      messages[id] = data;
    });
    print(messages[id].length);
    print(id);
  }

  void sendMessage(int targetId, String message) {
    setMessage("source", message, targetId);
    // MessageModel messageModel = MessageModel(type: "source", message: message);

    socket.emit("message", {
      "sourceId": widget.sourceChat.id,
      "targetId": targetId,
      "message": message
    });
  }

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
        itemCount: widget.chatmodel.length,
        itemBuilder: (contex, index) => CustomCard(
          chatModel: widget.chatmodel[index],
          sendMessage: sendMessage,
          data: messages[widget.chatmodel[index].id],
        ),
      ),
    );
  }
}
