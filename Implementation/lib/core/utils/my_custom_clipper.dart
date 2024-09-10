import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyCustomClipper extends CustomClipper<Path> {
  final double top;
  final double left;

  MyCustomClipper({super.reclip, required this.top, required this.left});

  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(0, top / 2);
    path.lineTo(0, top);
    path.lineTo(left, top);
    path.lineTo(left, top / 2);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}


// import 'package:flutter/material.dart';

// class MyCustomPainter extends CustomPainter {
//   final Color color;

//   MyCustomPainter({super.repaint, required this.color});

//   @override
//   void paint(Canvas canvas, Size size) {
//     Size center = size / 2;
//     canvas.drawArc(
//       Rect.fromCenter(
//           center: Offset(center.width, center.height),
//           height: size.height,
//           width: size.width),
//       3.14,
//       3.14,
//       false,
//       Paint()..color = color,
//     );
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }
