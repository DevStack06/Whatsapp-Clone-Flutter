import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("tapped");
      },
      child: Column(
        children: [
          ListTile(
            // contentPadding: EdgeInsets.only(left: 18, right: 18, top: 8),
            leading: CircleAvatar(
              radius: 30,
              // backgroundColor: Colors.,
              // child: Icon(Icons.group),
            ),
            title: Text(
              "Dev Stack",
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
                  "Hi Dev Stack",
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            trailing: Text("18:04"),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 80,
              right: 15,
              // top: 0,
            ),
            child: Divider(
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
