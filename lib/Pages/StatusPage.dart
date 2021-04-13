import 'package:chatapp/CustomUI/status/OtherStatusCard.dart';
import 'package:chatapp/CustomUI/status/OwnStatusCard.dart';
import 'package:flutter/material.dart';

class StatusPage extends StatefulWidget {
  StatusPage({Key key}) : super(key: key);

  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xfffafafa),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 48,
            child: FloatingActionButton(
              backgroundColor: Colors.blueGrey[100],
              elevation: 8,
              onPressed: () {},
              child: Icon(
                Icons.edit,
                color: Colors.blueGrey[900],
              ),
            ),
          ),
          SizedBox(
            height: 13,
          ),
          FloatingActionButton(
            backgroundColor: Colors.greenAccent[700],
            elevation: 5,
            onPressed: () {},
            child: Icon(
              Icons.camera_alt,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            OwnStatus(),
            Container(
              height: 33,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey[300],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
                child: Text(
                  "Recent updates",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
              ),
            ),
            OthersStatus(
              name: "Balram Rathore",
              seen: true,
              statusNum: 1,
              imageName: "assets/2.jpeg",
            ),
            OthersStatus(
              name: "Kishor Kumar",
              seen: true,
              statusNum: 2,
              imageName: "assets/1.jpg",
            ),
            OthersStatus(
              name: " Saket Sinha",
              seen: true,
              statusNum: 3,
              imageName: "assets/3.jpg",
            ),
            OthersStatus(
              name: "Bhanudev Som",
              seen: true,
              statusNum: 1,
              imageName: "assets/1.png",
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 33,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey[300],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
                child: Text(
                  "Viewed updates",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
              ),
            ),
            OthersStatus(
              name: "Balram Rathore",
              seen: false,
              statusNum: 5,
              imageName: "assets/2.jpeg",
            ),
            OthersStatus(
              name: "Kishor Kumar",
              seen: false,
              statusNum: 3,
              imageName: "assets/3.jpg",
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
