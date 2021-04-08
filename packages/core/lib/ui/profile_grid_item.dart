import 'package:flutter/material.dart';
import '../models/app_models/profile.dart';

class ProfileGridItem extends StatelessWidget {
  const ProfileGridItem(
      {Key? key, required this.profile, required this.selected, this.onPressed})
      : super(key: key);
  final Profile profile;
  final bool selected;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: ProfileFaceBox(selected: selected),
          ),
          const SizedBox(height: 8.0),
          Text(profile.name),
        ],
      ),
    );
  }
}

class ProfileFaceBox extends StatelessWidget {
  const ProfileFaceBox({Key? key, required this.selected}) : super(key: key);
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(painter: FaceOutlinePainter(selected)),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.indigo,
            Colors.indigo[700]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}

class FaceOutlinePainter extends CustomPainter {
  FaceOutlinePainter(this.selected);
  final bool selected;

  @override
  void paint(Canvas canvas, Size size) {
    // Define a paint object
    final fillPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white;

    final eyeWidth = 0.1 * size.width;
    final eyeHeight = 0.1 * size.height;
    // Left eye
    canvas.drawOval(
      Rect.fromLTWH(0.2 * size.width, 0.3 * size.height, eyeWidth, eyeHeight),
      fillPaint,
    );
    // Right eye
    canvas.drawOval(
      Rect.fromLTWH(0.7 * size.width, 0.3 * size.height, eyeWidth, eyeHeight),
      fillPaint,
    );

    final strokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0
      ..color = Colors.white;
    // Mouth
    final mouth = Path();
    mouth.moveTo(size.width * 0.3, size.height * 0.6);
    mouth.arcToPoint(
      Offset(size.width * 0.7, size.height * 0.6),
      radius: Radius.circular(50),
      clockwise: false,
    );

    canvas.drawPath(mouth, strokePaint);

    if (selected)
      canvas.drawRect(
          Rect.fromLTWH(2, 2, size.width - 4, size.height - 4), strokePaint);
  }

  @override
  bool shouldRepaint(FaceOutlinePainter oldDelegate) => true;
}
