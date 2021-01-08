import 'package:flutter/material.dart';

class IndividualPage extends StatefulWidget {
  IndividualPage({Key key}) : super(key: key);

  @override
  _IndividualPageState createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          titleSpacing: 0,
          leadingWidth: 70,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_back,
                  size: 24,
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.blueGrey,
                ),
              ],
            ),
          ),
          title: InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Dev Stack",
                    style: TextStyle(
                      fontSize: 18.5,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    "last seen today at 12:05",
                    style: TextStyle(
                      fontSize: 13,
                      // fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            IconButton(icon: Icon(Icons.videocam), onPressed: () {}),
            IconButton(icon: Icon(Icons.call), onPressed: () {}),
            PopupMenuButton<String>(
              onSelected: (value) {
                print(value);
              },
              itemBuilder: (BuildContext contesxt) {
                return [
                  PopupMenuItem(
                    child: Text("New group"),
                    value: "New group",
                  ),
                  PopupMenuItem(
                    child: Text("New broadcast"),
                    value: "New broadcast",
                  ),
                  PopupMenuItem(
                    child: Text("Whatsapp Web"),
                    value: "Whatsapp Web",
                  ),
                  PopupMenuItem(
                    child: Text("Starred messages"),
                    value: "Starred messages",
                  ),
                  PopupMenuItem(
                    child: Text("Settings"),
                    value: "Settings",
                  ),
                ];
              },
            ),
          ],
        ),
      ),
    );
  }
}
