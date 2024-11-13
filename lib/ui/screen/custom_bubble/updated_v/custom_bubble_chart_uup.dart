// import 'dart:math';
// import 'package:bubble_graph/core/model/bubble_data.dart';
// import 'package:bubble_graph/ui/screen/custom_bubble/updated_v/positioned_bubble_uup.dart';
// import 'package:flutter/material.dart';

// class CustomBubbleChartUUP extends StatefulWidget {
//   final List<BubbleData> bubbles;

//   const CustomBubbleChartUUP({super.key, required this.bubbles});

//   @override
//   State<CustomBubbleChartUUP> createState() => _CustomBubbleChartUUPState();
// }

// class _CustomBubbleChartUUPState extends State<CustomBubbleChartUUP> {
//   final ScrollController _horizontalScrollController = ScrollController();
//   final ScrollController _verticalScrollController = ScrollController();
//   List<PositionedBubble> positionedBubbles = [];
//   double containerWidth = 0.0;
//   double containerHeight = 0.0;
//   double padding = 20.0;

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _calculateContainerSize();
//       _generateBubblePositions();

//       // Calculate initial offset to center the scroll position
//       double initialHorizontalOffset = (containerWidth / 2) - (MediaQuery.of(context).size.width / 2);
//       double initialVerticalOffset = (containerHeight / 2) - (MediaQuery.of(context).size.height / 2);

//       initialHorizontalOffset = initialHorizontalOffset > 0 ? initialHorizontalOffset : 0;
//       initialVerticalOffset = initialVerticalOffset > 0 ? initialVerticalOffset : 0;

//       Future.delayed(const Duration(milliseconds: 100), () => _verticalScrollController.jumpTo(initialVerticalOffset));
//       Future.delayed(const Duration(milliseconds: 100), () => _horizontalScrollController.jumpTo(initialHorizontalOffset));
//     });
//   }

//   @override
//   void dispose() {
//     _horizontalScrollController.dispose();
//     _verticalScrollController.dispose();
//     super.dispose();
//   }

//   void _calculateContainerSize() {
//     double minSize = 50;
//     double maxSize = 150;

//     double maxValue = widget.bubbles.map((bubble) => bubble.value).reduce(max);
//     double minValue = widget.bubbles.map((bubble) => bubble.value).reduce(min);

//     List<double> scaledSizes = widget.bubbles.map((bubble) {
//       return ((bubble.value - minValue) / (maxValue - minValue)) * (maxSize - minSize) + minSize;
//     }).toList();

//     double largestBubbleSize = scaledSizes.isNotEmpty ? scaledSizes[0] : minSize;
//     double layerRadius = largestBubbleSize / 2 + padding;
//     int bubbleIndex = 1;

//     while (bubbleIndex < scaledSizes.length) {
//       int bubblesInLayer = max(6, (2 * pi * layerRadius / scaledSizes[bubbleIndex]).floor());
//       bubbleIndex += bubblesInLayer;
//       layerRadius += max(scaledSizes[0] / 2, padding);
//     }

//     containerWidth = containerHeight = (layerRadius + largestBubbleSize / 2) * 3;
//   }

//   void _generateBubblePositions() {
//     positionedBubbles.clear();
//     if (widget.bubbles.isEmpty) return;

//     widget.bubbles.sort((a, b) => b.value.compareTo(a.value));
//     List<BubbleData> bubblesCopy = List.from(widget.bubbles);
//     final largestBubble = bubblesCopy.removeAt(0);
//     bubblesCopy.shuffle();
//     bubblesCopy.insert(0, largestBubble);

//     double minSize = 50;
//     double maxSize = 150;

//     double maxValue = widget.bubbles.map((bubble) => bubble.value).reduce(max);
//     double minValue = widget.bubbles.map((bubble) => bubble.value).reduce(min);

//     List<double> scaledSizes = bubblesCopy.map((bubble) {
//       return ((bubble.value - minValue) / (maxValue - minSize)) * (maxSize - minSize) + minSize;
//     }).toList();

//     final centerX = containerWidth / 2;
//     final centerY = containerHeight / 2;

//     positionedBubbles.add(PositionedBubble(
//       bubble: bubblesCopy[0],
//       offset: Offset(centerX, centerY),
//       scaledSize: scaledSizes[0],
//     ));

//     double layerRadius = scaledSizes[0] / 2 + scaledSizes[1] / 2 + padding;
//     int bubbleIndex = 1;

//     while (bubbleIndex < bubblesCopy.length) {
//       int bubblesInLayer = max(6, (2 * pi * layerRadius / scaledSizes[bubbleIndex]).floor());

//       while (bubblesInLayer > (bubblesCopy.length - bubbleIndex)) {
//         bubblesInLayer--;
//       }

//       double angleIncrement = 2 * pi / bubblesInLayer;

//       for (int i = 0; i < bubblesInLayer && bubbleIndex < bubblesCopy.length; i++) {
//         var bubble = bubblesCopy[bubbleIndex];
//         double angle = i * angleIncrement;
//         double x = centerX + layerRadius * cos(angle);
//         double y = centerY + layerRadius * sin(angle);

//         bool overlapping = positionedBubbles.any((existingBubble) {
//           double distance = (Offset(x, y) - existingBubble.offset).distance;
//           return distance < (scaledSizes[bubbleIndex] + existingBubble.scaledSize) / 2;
//         });

//         if (!overlapping) {
//           positionedBubbles.add(PositionedBubble(
//             bubble: bubble,
//             offset: Offset(x, y),
//             scaledSize: scaledSizes[bubbleIndex],
//           ));
//           bubbleIndex++;
//         }
//       }

//       layerRadius += scaledSizes[0] / 2 + padding;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: SingleChildScrollView(
//         controller: _verticalScrollController,
//         scrollDirection: Axis.vertical,
//         child: SingleChildScrollView(
//           controller: _horizontalScrollController,
//           scrollDirection: Axis.horizontal,
//           child: Container(
//             width: containerWidth,
//             height: containerHeight,
//             decoration: BoxDecoration(
//               color: Colors.black,
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Stack(
//               children: positionedBubbles,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'dart:math';
import 'package:flutter/material.dart';
import 'package:bubble_graph/core/model/bubble_data.dart';
import 'package:bubble_graph/ui/screen/custom_bubble/updated_v/positioned_bubble_uup.dart';

class CustomBubbleChartUUP extends StatefulWidget {
  final List<BubbleData> bubbles;
  final String blockSize;

  const CustomBubbleChartUUP({super.key, required this.bubbles, required this.blockSize});

  @override
  State<CustomBubbleChartUUP> createState() => _CustomBubbleChartUUPState();
}

class _CustomBubbleChartUUPState extends State<CustomBubbleChartUUP> {
  final ScrollController _horizontalScrollController = ScrollController();
  final ScrollController _verticalScrollController = ScrollController();
  List<PositionedBubble> positionedBubbles = [];
  double padding = 20.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _centerScrollView();
    });
  }

  @override
  void dispose() {
    _horizontalScrollController.dispose();
    _verticalScrollController.dispose();
    super.dispose();
  }

  void _generateBubblePositions(double containerWidth, double containerHeight) {
    if (widget.bubbles.isEmpty) return;

    widget.bubbles.sort((a, b) => b.value.compareTo(a.value));
    List<BubbleData> bubblesCopy = List.from(widget.bubbles);
    final largestBubble = bubblesCopy.removeAt(0);
    bubblesCopy.shuffle();
    bubblesCopy.insert(0, largestBubble);

    double minSize = 50;
    double maxSize = 150;

    double maxValue = widget.bubbles.map((bubble) => bubble.value).reduce(max);
    double minValue = widget.bubbles.map((bubble) => bubble.value).reduce(min);

    List<double> scaledSizes = bubblesCopy.map((bubble) {
      return ((bubble.value - minValue) / (maxValue - minValue)) * (maxSize - minSize) + minSize;
    }).toList();

    final centerX = containerWidth / 2;
    final centerY = containerHeight / 2;

    positionedBubbles.add(PositionedBubble(
      bubble: bubblesCopy[0],
      offset: Offset(centerX, centerY),
      scaledSize: scaledSizes[0],
    ));

    double layerRadius = scaledSizes[0] / 2 + scaledSizes[1] / 2 + padding;
    int bubbleIndex = 1;

    while (bubbleIndex < bubblesCopy.length) {
      int bubblesInLayer = max(6, (2 * pi * layerRadius / scaledSizes[bubbleIndex]).floor());

      while (bubblesInLayer > (bubblesCopy.length - bubbleIndex)) {
        bubblesInLayer--;
      }

      double angleIncrement = 2 * pi / bubblesInLayer;

      for (int i = 0; i < bubblesInLayer && bubbleIndex < bubblesCopy.length; i++) {
        var bubble = bubblesCopy[bubbleIndex];
        double angle = i * angleIncrement;
        double x = centerX + layerRadius * cos(angle);
        double y = centerY + layerRadius * sin(angle);

        bool overlapping = positionedBubbles.any((existingBubble) {
          double distance = (Offset(x, y) - existingBubble.offset).distance;
          return distance < (scaledSizes[bubbleIndex] + existingBubble.scaledSize) / 2;
        });

        if (!overlapping) {
          positionedBubbles.add(PositionedBubble(
            bubble: bubble,
            offset: Offset(x, y),
            scaledSize: scaledSizes[bubbleIndex],
          ));
          bubbleIndex++;
        }
      }

      layerRadius += scaledSizes[0] / 2 + padding;
    }
  }

  void _centerScrollView() {
    if (_horizontalScrollController.hasClients && _verticalScrollController.hasClients) {
      double initialHorizontalOffset = (_horizontalScrollController.position.maxScrollExtent) / 2;
      double initialVerticalOffset = (_verticalScrollController.position.maxScrollExtent) / 2;

      _horizontalScrollController.jumpTo(initialHorizontalOffset);
      _verticalScrollController.jumpTo(initialVerticalOffset);
      
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: LayoutBuilder(
        builder: (context, constraints) {
          double containerWidth = constraints.maxWidth * 3;
          double containerHeight = constraints.maxHeight * 3;

          if (positionedBubbles.isEmpty) {
            _generateBubblePositions(containerWidth, containerHeight);
          }

          return IgnorePointer(
            ignoring: widget.blockSize != "full" ? true : false,
            child: SingleChildScrollView(
              controller: _verticalScrollController,
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                controller: _horizontalScrollController,
                scrollDirection: Axis.horizontal,
                child: Container(
                  width: containerWidth,
                  height: containerHeight,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: positionedBubbles,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}