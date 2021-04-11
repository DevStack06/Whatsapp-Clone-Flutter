import 'package:flutter/material.dart';

class OthersStatus extends StatelessWidget {
  const OthersStatus({Key key, this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 27,
            backgroundColor: Colors.red,
            backgroundImage: AssetImage(
              "assets/balram.jpg",
            ),
          ),
        ],
      ),
      title: Text(
        name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        "Today, 01:23",
        style: TextStyle(fontSize: 14, color: Colors.grey[900]),
      ),
    );
  }
}
