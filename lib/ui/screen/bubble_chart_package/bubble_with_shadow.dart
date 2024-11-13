// import 'package:flutter/material.dart';

// class BubbleWithShadow extends StatefulWidget {
//   final double size;
//   final Color color;
//   final String name;
//   final double value;
//   final double textSize;

//   const BubbleWithShadow({
//     super.key,
//     required this.size,
//     required this.color,
//     required this.name,
//     required this.value,
//     required this.textSize,
//   });

//   @override
//   State<BubbleWithShadow> createState() => _BubbleWithShadowState();
// }

// class _BubbleWithShadowState extends State<BubbleWithShadow> {
//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//       painter: BubbleShadowPainter(color: widget.color, size: widget.size),
//       child: Container(
//         width: widget.size,
//         height: widget.size,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           gradient: RadialGradient(
//             colors: [
//               widget.color.withOpacity(0.4),
//               widget.color.withOpacity(0.6),
//               widget.color.withOpacity(1),
//             ],
//             stops: const [0.4, 0.7, 1.0],
//           ),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 widget.name,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: widget.textSize,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               Text(
//                 widget.value.toString(),
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: widget.textSize,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class BubbleShadowPainter extends CustomPainter {
//   final Color color;
//   final double size;

//   BubbleShadowPainter({required this.color, required this.size});

//   @override
//   void paint(Canvas canvas, Size size) {
//     final Paint shadowPaint = Paint()
//       ..color = color.withOpacity(0.3)
//       ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 20); // Soft blur radius

//     canvas.drawCircle(
//       Offset(size.width / 2, size.height / 2),
//       this.size / 2 + 20, // Shadow radius slightly larger than bubble
//       shadowPaint,
//     );
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }


import 'package:flutter/material.dart';

class BubbleWithShadow extends StatefulWidget {
  final double size;
  final Color color;
  final String name;
  final double value;
  final double textSize;

  const BubbleWithShadow({
    super.key,
    required this.size,
    required this.color,
    required this.name,
    required this.value,
    required this.textSize,
  });

  @override
  State<BubbleWithShadow> createState() => _BubbleWithShadowState();
}

class _BubbleWithShadowState extends State<BubbleWithShadow> {
  @override
  Widget build(BuildContext context) {
    return Center(  // Centering the bubble within the parent
      child: CustomPaint(
        size: Size(widget.size, widget.size),  // Ensuring CustomPaint fills the desired space
        painter: BubbleShadowPainter(color: widget.color, size: widget.size),
        child: Container(
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                widget.color.withOpacity(0.4),
                widget.color.withOpacity(0.6),
                widget.color.withOpacity(1),
              ],
              stops: const [0.4, 0.7, 1.0],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: widget.textSize,
                    overflow: TextOverflow.ellipsis,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  widget.value.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: widget.textSize,
                    overflow: TextOverflow.ellipsis,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BubbleShadowPainter extends CustomPainter {
  final Color color;
  final double size;

  BubbleShadowPainter({required this.color, required this.size});

  @override
  void paint(Canvas canvas, Size canvasSize) {
    final Paint shadowPaint = Paint()
      ..color = color.withOpacity(0.3)  // Shadow color with some transparency
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 20);  // Apply blur for shadow effect

    final Offset center = Offset(canvasSize.width / 2, canvasSize.height / 2);

    // Draw shadow circle slightly larger than bubble size
    canvas.drawCircle(center, size / 2 + 20, shadowPaint); // Shadow radius increased for effect
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
