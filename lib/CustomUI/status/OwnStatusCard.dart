import 'package:flutter/material.dart';

class OwnStatus extends StatelessWidget {
  const OwnStatus({Key key}) : super(key: key);

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
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Colors.greenAccent[700],
              child: Icon(
                Icons.add,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      title: Text(
        "My status",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      subtitle: Text(
        "Tap to add status update",
        style: TextStyle(fontSize: 13, color: Colors.grey[900]),
      ),
    );
  }
}
