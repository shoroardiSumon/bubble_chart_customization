import 'dart:math';
import 'package:flutter/material.dart';

class MultiCircleDragableBubbleChartUp extends StatefulWidget {
  const MultiCircleDragableBubbleChartUp({super.key});

  @override
  State<MultiCircleDragableBubbleChartUp> createState() =>
      _MultiCircleDragableBubbleChartUpState();
}

class _MultiCircleDragableBubbleChartUpState
    extends State<MultiCircleDragableBubbleChartUp> with SingleTickerProviderStateMixin {
  final List<BubbleData> bubbleData = [
    BubbleData(name: 'Microsoft', value: 90, color: Colors.blue),
    BubbleData(name: 'Amazon', value: 80, color: Colors.orange),
    BubbleData(name: 'Google', value: 75, color: Colors.red),
    BubbleData(name: 'Facebook', value: 70, color: Colors.purple),
    BubbleData(name: 'Apple', value: 200, color: const Color(0xFF336713)),
    BubbleData(name: 'Tesla', value: 65, color: Colors.cyan),
    BubbleData(name: 'Alibaba', value: 60, color: Colors.yellow),
    BubbleData(name: 'Tencent', value: 55, color: Colors.pink),
    BubbleData(name: 'Berkshire', value: 50, color: Colors.teal),
    BubbleData(name: 'Visa', value: 45, color: Colors.brown),

    BubbleData(name: 'Microsoft', value: 90, color: Colors.blue),
    BubbleData(name: 'Amazon', value: 80, color: Colors.orange),
    BubbleData(name: 'Google', value: 75, color: Colors.red),
    BubbleData(name: 'Facebook', value: 70, color: Colors.purple),
    BubbleData(name: 'Apple', value: 190, color: Colors.green),
    BubbleData(name: 'Tesla', value: 65, color: Colors.cyan),
    BubbleData(name: 'Alibaba', value: 60, color: Colors.yellow),
    BubbleData(name: 'Tencent', value: 55, color: Colors.pink),
    BubbleData(name: 'Berkshire', value: 50, color: Colors.teal),
    BubbleData(name: 'Visa', value: 45, color: Colors.brown),

    BubbleData(name: 'Microsoft', value: 90, color: Colors.blue),
    BubbleData(name: 'Amazon', value: 80, color: Colors.orange),
    BubbleData(name: 'Google', value: 75, color: Colors.red),
    BubbleData(name: 'Facebook', value: 70, color: Colors.purple),
    BubbleData(name: 'Apple', value: 100, color: Colors.green),
    BubbleData(name: 'Tesla', value: 65, color: Colors.cyan),
    BubbleData(name: 'Alibaba', value: 60, color: Colors.yellow),
    BubbleData(name: 'Tencent', value: 55, color: Colors.pink),
    BubbleData(name: 'Berkshire', value: 50, color: Colors.teal),
    BubbleData(name: 'Visa', value: 45, color: Colors.brown),
  ];

  double centerX = 350;
  double centerY = 300;

  @override
  Widget build(BuildContext context) {
    bubbleData.sort((a, b) => b.value.compareTo(a.value)); // Sort by size

    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        title: const Text('Multi Circle Dragable Bubble Chart'),
      ),
      body: Center(
        child: GestureDetector(
          onPanUpdate: (details) {
            setState(() {
              centerX += details.delta.dx;
              centerY += details.delta.dy;
            });
          },
          child: Container(
            width: 700,
            height: 600,
            color: Colors.grey[900],
            child: Stack(
              children: _generateBubblePositions(),
            ),
          ),
        ),
      ),
    );
  }

  List<PositionedBubble> _generateBubblePositions() {
    List<PositionedBubble> positionedBubbles = [];
    positionedBubbles.add(
      PositionedBubble(
        bubble: bubbleData[0],
        offset: Offset(centerX, centerY),
      ),
    );

    double layerRadius = bubbleData[0].size / 2 + bubbleData[1].size / 1.5;
    int bubblesInLayer = 6;
    int bubbleIndex = 1;

    while (bubbleIndex < bubbleData.length) {
      double angleIncrement = 2 * pi / bubblesInLayer;
      for (int i = 0; i < bubblesInLayer && bubbleIndex < bubbleData.length; i++) {
        var bubble = bubbleData[bubbleIndex];
        double angle = i * angleIncrement;
        double x = centerX + layerRadius * cos(angle);
        double y = centerY + layerRadius * sin(angle);

        bool overlapping = false;
        for (var positioned in positionedBubbles) {
          double distance = sqrt(
              pow(x - positioned.offset.dx, 2) +
              pow(y - positioned.offset.dy, 2));
          if (distance < (bubble.size + positioned.bubble.size) / 2) {
            overlapping = true;
            break;
          }
        }

        if (!overlapping) {
          positionedBubbles.add(
            PositionedBubble(bubble: bubble, offset: Offset(x, y)),
          );
          bubbleIndex++;
        }
      }
      layerRadius += 70; // Increase radius for the next layer
      bubblesInLayer += 8;
    }

    return positionedBubbles;
  }
}

class PositionedBubble extends StatelessWidget {
  final BubbleData bubble;
  final Offset offset;

  const PositionedBubble({super.key, required this.bubble, required this.offset});

  @override
  Widget build(BuildContext context) {
    double fontSize = bubble.size / 5;
    bool showTextInside = bubble.size > 40;

    return Positioned(
      left: offset.dx - bubble.size / 2,
      top: offset.dy - bubble.size / 2,
      child: GestureDetector(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Clicked on ${bubble.name}')),
          );
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: bubble.size,
          height: bubble.size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              // colors: [
              //   bubble.color.withOpacity(0.2),
              //   bubble.color.withOpacity(0.5),
              //   bubble.color.withOpacity(0.9),
              // ],
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

class BubbleData {
  final String name;
  final double value;
  final Color color;

  double get size => value;

  BubbleData({
    required this.name,
    required this.value,
    required this.color,
  });
}
