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
                  radius: 18,
                  backgroundColor: Colors.blueGrey,
                ),
              ],
            ),
          ),
          title: InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Dev Stack",
                    style: TextStyle(
                      fontSize: 19,
                      // fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "last seen today at 12:05",
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
