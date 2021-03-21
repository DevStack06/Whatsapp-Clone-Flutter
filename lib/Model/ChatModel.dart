import 'package:chatapp/Model/MessgeModel.dart';

class ChatModel {
  String name;
  String icon;
  bool isGroup;
  String time;
  String currentMessage;
  String status;
  bool select = false;
  int id;
  List<MessageModel> messges;
  ChatModel({
    this.name,
    this.icon,
    this.isGroup,
    this.time,
    this.currentMessage,
    this.status,
    this.select = false,
    this.id,
    this.messges,
  });
}
