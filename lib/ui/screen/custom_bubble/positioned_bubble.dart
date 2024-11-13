import 'package:bubble_graph/core/model/bubble_data.dart';
import 'package:flutter/material.dart';

class PositionedBubble extends StatelessWidget {
  final BubbleData bubble;
  final Offset offset;
  final double scaledSize;

  const PositionedBubble({
    super.key,
    required this.bubble,
    required this.offset,
    required this.scaledSize,
  });

  @override
  Widget build(BuildContext context) {
    double fontSize = scaledSize / 5;
    return Positioned(
      left: offset.dx - scaledSize / 2,
      top: offset.dy - scaledSize / 2,
      child: GestureDetector(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Clicked on ${bubble.name}')),
          );
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: scaledSize,
          height: scaledSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                bubble.color.withOpacity(0.2),
                bubble.color.withOpacity(0.5),
                bubble.color.withOpacity(0.9),
              ],
              stops: const [0.4, 0.7, 1.0],
            ),
            boxShadow: [
              BoxShadow(
                color: bubble.color.withOpacity(0.6),
                spreadRadius: 10,
                blurRadius: 15,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  bubble.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize.clamp(8, 16),
                  ),
                ),
                Text(
                  '${bubble.value.toInt()}',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: fontSize.clamp(6, 14),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// class PositionedBubble extends StatelessWidget {
//   final BubbleData bubble;
//   final Offset offset;

//   const PositionedBubble({super.key, required this.bubble, required this.offset});

//   @override
//   Widget build(BuildContext context) {
//     double fontSize = bubble.size / 5;
//     return Positioned(
//       left: offset.dx - bubble.size / 2,
//       top: offset.dy - bubble.size / 2,
//       child: GestureDetector(
//         onTap: () {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('Clicked on ${bubble.name}')),
//           );
//         },
//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 500),
//           width: bubble.size,
//           height: bubble.size,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             gradient: RadialGradient(
//               colors: [
//                 bubble.color.withOpacity(0.2),
//                 bubble.color.withOpacity(0.5),
//                 bubble.color.withOpacity(0.9),
//               ],
//               stops: const [0.4, 0.7, 1.0],
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: bubble.color.withOpacity(0.6),
//                 spreadRadius: 10,
//                 blurRadius: 15,
//                 offset: const Offset(0, 0),
//               ),
//             ],
//           ),
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   bubble.name,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: fontSize.clamp(8, 16),
//                   ),
//                 ),
//                 Text(
//                   '${bubble.value.toInt()}',
//                   style: TextStyle(
//                     color: Colors.white70,
//                     fontSize: fontSize.clamp(6, 14),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }