import 'dart:math';

import 'package:flutter/material.dart';

class OthersStatus extends StatelessWidget {
  const OthersStatus(
      {Key key, this.name, this.seen, this.statusNum, this.imageName})
      : super(key: key);
  final String name;
  final bool seen;
  final int statusNum;
  final String imageName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: [
          CustomPaint(
            painter: StatusBorderPainter(isSeen: !seen, statusNum: statusNum),
            child: CircleAvatar(
              radius: 26,
              backgroundColor: Colors.red,
              backgroundImage: AssetImage(imageName),
            ),
          ),
        ],
      ),
      title: Text(
        name,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 15,
          color: Colors.black,
        ),
      ),
      subtitle: Text(
        "Today, 01:23",
        style: TextStyle(fontSize: 14, color: Colors.grey[900]),
      ),
    );
  }
}

degreeToRad(double degree) {
  return degree * pi / 180;
}

class StatusBorderPainter extends CustomPainter {
  bool isSeen;
  int statusNum;

  StatusBorderPainter({this.isSeen, this.statusNum});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 6.0
      ..color = isSeen ? Colors.grey : Color(0xff21bfa6)
      ..style = PaintingStyle.stroke;
    drawArc(canvas, paint, size, statusNum);
  }

  void drawArc(Canvas canvas, Paint paint, Size size, int count) {
    if (count == 1) {
      canvas.drawArc(new Rect.fromLTWH(0.0, 0.0, size.width, size.height),
          degreeToRad(0), degreeToRad(360), false, paint);
    } else {
      double degree = -90;
      double arc = 360 / count;
      for (int i = 0; i < count; i++) {
        canvas.drawArc(new Rect.fromLTWH(0.0, 0.0, size.width, size.height),
            degreeToRad(degree + 4), degreeToRad(arc - 8), false, paint);
        degree += arc;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
