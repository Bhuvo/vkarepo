import 'package:flutter/material.dart';
import 'package:map/map.dart';
import 'package:latlng/latlng.dart';

class PolylinePainter extends CustomPainter {
  final PolyLine line;

  PolylinePainter({required this.transformer, required this.line,});

  final MapTransformer transformer;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..strokeWidth = line.strokeWidth;

      paint.color = line.color;

      for (int i = 0; i < line.points.length - 1; i++) {
        final p1 = transformer.toOffset(line.points[i]);
        final p2 = transformer.toOffset(line.points[i + 1]);

        if (line.dash) {
          final dir = (p2 - p1);

          final dist = dir.distance;
          final dirn = dir / dist;

          final count = (dist / (16) * line.strokeWidth).ceil();
          final step = dist / count;

          for (int i = 0; i < count; i++) {
            final c = p1 + dirn * (step * i.toDouble());
            canvas.drawCircle(c, line.strokeWidth, paint);
          }
        } else if(line.curved){
          final path = Path();
          paint.style = PaintingStyle.stroke;
          path.moveTo(p1.dx, p1.dy);
          final p3 = Offset((p1.dx + p2.dx) * 0.5, (p1.dy + p2.dy) * 0.5);
          path.quadraticBezierTo(p3.dx * 0.75, p3.dy * 0.5, p2.dx, p2.dy);
          canvas.drawPath(path, paint);
        } else{
          canvas.drawLine(p1, p2, paint);
        }

    }
  }

  // Since this Sky painter has no fields, it always paints
  // the same thing and semantics information is the same.
  // Therefore we return false here. If we had fields (set
  // from the constructor) then we would return true if any
  // of them differed from the same fields on the oldDelegate.
  @override
  bool shouldRepaint(PolylinePainter oldDelegate) => false;
  @override
  bool shouldRebuildSemantics(PolylinePainter oldDelegate) => false;
}

class PolyLine {
  final List<LatLng> points;
  final Color color;
  final bool dash, curved;
  final double strokeWidth;
  const PolyLine({
    required this.points,
    this.strokeWidth = 4,
    this.color = Colors.black,
    this.dash = false,
    this.curved = false,
});
}