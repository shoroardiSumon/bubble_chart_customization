import 'dart:math';

import 'package:bubble_graph/core/model/bubble_data.dart';
import 'package:bubble_graph/ui/screen/custom_bubble/positioned_bubble.dart';
import 'package:flutter/material.dart';


class BubbleChartProvider with ChangeNotifier {
  List<BubbleData> bubbles = [];
  List<PositionedBubble> positionedBubbles = [];
  double containerWidth = 0.0;
  double containerHeight = 0.0;
  double padding = 20.0;
  final Random random = Random();

  BubbleChartProvider() {
    _initializeBubbleData();
    _calculateContainerSize();
    _generateBubblePositions();
  }

  void _initializeBubbleData() {
    bubbles = [
      BubbleData(id: 1, name: 'Microsoft', value: 1400, color: Colors.blue),
      BubbleData(id: 2, name: 'Amazon', value: 190, color: Colors.orange),
      BubbleData(id: 3, name: 'Google', value: 775, color: Colors.red),
      BubbleData(id: 4, name: 'Facebook', value: 2200, color: Colors.purple),
      BubbleData(id: 5, name: 'Apple', value: 150, color: const Color(0xFF336713)),
      BubbleData(id: 6, name: 'Tesla', value: 365, color: Colors.cyan),
      BubbleData(id: 7, name: 'Alibaba', value: 1560, color: Colors.yellow),
      BubbleData(id: 8, name: 'Tencent', value: 190, color: Colors.pink),
      BubbleData(id: 9, name: 'Berkshire', value: 550, color: Colors.teal),
      BubbleData(id: 10, name: 'Visa', value: 1145, color: Colors.brown),

      BubbleData(id: 11, name: 'Microsoft', value: 1300, color: Colors.blue),
      BubbleData(id: 12, name: 'Amazon', value: 110, color: Colors.orange),
      BubbleData(id: 13, name: 'Google', value: 620, color: Colors.red),
      BubbleData(id: 14, name: 'Facebook', value: 1230, color: Colors.purple),
      BubbleData(id: 15, name: 'Apple', value: 1140, color: Colors.green),
      BubbleData(id: 16, name: 'Tesla', value: 350, color: Colors.cyan),
      BubbleData(id: 17, name: 'Alibaba', value: 1660, color: Colors.yellow),
      BubbleData(id: 18, name: 'Tencent', value: 110, color: Colors.pink),
      BubbleData(id: 19, name: 'Berkshire', value: 290, color: Colors.teal),
      BubbleData(id: 20, name: 'Visa', value: 901, color: Colors.brown),
    ];
  }

  void updateBubbleData(List<BubbleData> newBubbles) {
    bubbles = newBubbles;
    _calculateContainerSize();
    _generateBubblePositions();
    notifyListeners();
  }

  //updated 2
  void _calculateContainerSize() {
    // Define the min and max scaled sizes
    double minSize = 50;
    double maxSize = 150;

    // Find min and max actual sizes in the bubbles list
    double maxValue = bubbles.map((bubble) => bubble.size).reduce(max);
    double minValue = bubbles.map((bubble) => bubble.size).reduce(min);

    // Scale sizes for each bubble
    List<double> scaledSizes = bubbles.map((bubble) {
      return ((bubble.size - minValue) / (maxValue - minValue)) * (maxSize - minSize) + minSize;
    }).toList();

    double largestBubbleSize = scaledSizes.isNotEmpty ? scaledSizes[0] : minSize;
    double layerRadius = largestBubbleSize / 2 + padding;
    int bubbleIndex = 1;
    int layerCount = 1;

    // Adjust layer radius for scaled bubbles
    while (bubbleIndex < scaledSizes.length) {
      int bubblesInLayer = max(6, (2 * pi * layerRadius / scaledSizes[bubbleIndex]).floor());
      bubbleIndex += bubblesInLayer;
      layerRadius += max(scaledSizes[0] / 2, padding);
      layerCount++;
    }

    containerWidth = containerHeight = (layerRadius + largestBubbleSize / 2) * 3;
  }

  // void _calculateContainerSize() {
  //   double maxBubbleSize = bubbles.isNotEmpty ? bubbles[0].size : 0.0;
  //   int layerCount = 1;
  //   int index = 1;
  //   double radiusIncrement = maxBubbleSize + padding;

  //   while (index < bubbles.length) {
  //     int bubblesInLayer = max(6, (2 * pi * layerCount * radiusIncrement / maxBubbleSize).floor());
  //     index += bubblesInLayer;
  //     layerCount++;
  //   }

  //   containerWidth = containerHeight = (layerCount * radiusIncrement) * 2;
  // }


  //positioned as randonly updated
  // void _generateBubblePositions() {
  //   positionedBubbles.clear();
  //   if (bubbles.isEmpty) return;

  //   bubbles.sort((a, b) => b.size.compareTo(a.size)); // Sort by size (largest first)

  //   final centerX = containerWidth / 2;
  //   final centerY = containerHeight / 2;

  //   // Place the largest bubble at the center
  //   positionedBubbles.add(
  //     PositionedBubble(
  //       bubble: bubbles[0],
  //       offset: Offset(centerX, centerY),
  //     ),
  //   );

  //   // List to store the positions of already placed bubbles
  //   List<Offset> placedPositions = [Offset(centerX, centerY)];

  //   Random random = Random();

  //   // Minimum distance between bubbles to avoid overlap
  //   double minDistanceBetweenBubbles = 20.0; // Allow some gap between bubbles
  //   double safeMargin = 50.0; // To ensure bubbles are not too close to the edge

  //   // Try to place each bubble at a random position
  //   for (int i = 1; i < bubbles.length; i++) {
  //     bool placed = false;
  //     int attempts = 0;

  //     while (!placed && attempts < 100) { // Retry up to 100 times
  //       attempts++;

  //       // Generate a random position within the container, leaving space for margins
  //       double x = random.nextDouble() * (containerWidth - safeMargin * 2) + safeMargin;
  //       double y = random.nextDouble() * (containerHeight - safeMargin * 2) + safeMargin;

  //       // Check if the bubble overlaps with any existing bubbles
  //       bool overlap = false;
  //       for (var position in placedPositions) {
  //         double distance = sqrt(pow(x - position.dx, 2) + pow(y - position.dy, 2));

  //         // Calculate the minimum required distance between the bubbles
  //         double requiredDistance = (bubbles[i].size / 2 + bubbles[placedPositions.indexOf(position)].size / 2 + minDistanceBetweenBubbles);

  //         if (distance < requiredDistance) {
  //           overlap = true;
  //           break;
  //         }
  //       }

  //       // If there's no overlap, place the bubble and update the positions list
  //       if (!overlap) {
  //         positionedBubbles.add(
  //           PositionedBubble(bubble: bubbles[i], offset: Offset(x, y)),
  //         );
  //         placedPositions.add(Offset(x, y));
  //         placed = true;
  //       }
  //     }

  //     // If unable to place after 100 attempts, place the bubble in the center (fallback)
  //     if (!placed) {
  //       positionedBubbles.add(
  //         PositionedBubble(bubble: bubbles[i], offset: Offset(centerX, centerY)),
  //       );
  //     }
  //   }
  // }


  // pisitioned as randomly
  // void _generateBubblePositions() {
  //   positionedBubbles.clear();
  //   if (bubbles.isEmpty) return;

  //   bubbles.sort((a, b) => b.size.compareTo(a.size)); // Sort bubbles by size (largest first)

  //   final centerX = containerWidth / 2;
  //   final centerY = containerHeight / 2;

  //   // Place the largest bubble at the center
  //   positionedBubbles.add(
  //     PositionedBubble(
  //       bubble: bubbles[0],
  //       offset: Offset(centerX, centerY),
  //     ),
  //   );

  //   // List to store the positions of the already placed bubbles
  //   List<Offset> placedPositions = [Offset(centerX, centerY)];

  //   Random random = Random();

  //   // Try to randomly place each bubble
  //   for (int i = 1; i < bubbles.length; i++) {
  //     bool placed = false;
  //     int attempts = 0;

  //     while (!placed && attempts < 100) { // Try 100 times to find a non-overlapping position
  //       attempts++;

  //       // Generate a random position within the container
  //       double x = random.nextDouble() * containerWidth;
  //       double y = random.nextDouble() * containerHeight;

  //       // Check if the bubble overlaps with any existing bubble
  //       bool overlap = false;
  //       for (var position in placedPositions) {
  //         double distance = sqrt(pow(x - position.dx, 2) + pow(y - position.dy, 2));
  //         if (distance < (bubbles[i].size + bubbles[0].size) / 2) { // Simple overlap check
  //           overlap = true;
  //           break;
  //         }
  //       }

  //       // If there's no overlap, place the bubble
  //       if (!overlap) {
  //         positionedBubbles.add(
  //           PositionedBubble(bubble: bubbles[i], offset: Offset(x, y)),
  //         );
  //         placedPositions.add(Offset(x, y));
  //         placed = true;
  //       }
  //     }

  //     // If we couldn't find a non-overlapping position in 100 attempts, fallback to the center for the remaining bubbles
  //     if (!placed) {
  //       positionedBubbles.add(
  //         PositionedBubble(bubble: bubbles[i], offset: Offset(centerX, centerY)),
  //       );
  //     }
  //   }
  // }


  //positioned as circle updated 2
  void _generateBubblePositions() {
    positionedBubbles.clear();
    if (bubbles.isEmpty) return;

    // Sort and shuffle the bubbles list, placing the largest bubble first
    bubbles.sort((a, b) => b.size.compareTo(a.size));
    final bubblesCopy = bubbles;
    final largestBubble = bubblesCopy.first;
    final otherBubbles = bubblesCopy.sublist(1)..shuffle();
    final bubblesFinal = [largestBubble, ...otherBubbles];
    
    bubbles.clear();
    bubbles.addAll(bubblesFinal);

    // Scaling bubble sizes within the range 50 - 150
    double minSize = 50;
    double maxSize = 150;

    // Find min and max actual sizes in the bubbles list
    double maxValue = bubbles.map((bubble) => bubble.size).reduce(max);
    double minValue = bubbles.map((bubble) => bubble.size).reduce(min);

    // Scale sizes for each bubble based on actual size (value)
    List<double> scaledSizes = bubbles.map((bubble) {
      return ((bubble.size - minValue) / (maxValue - minValue)) * (maxSize - minSize) + minSize;
    }).toList();

    final centerX = containerWidth / 2;
    final centerY = containerHeight / 2;

    positionedBubbles.add(
      PositionedBubble(
        bubble: bubbles[0],
        offset: Offset(centerX, centerY),
        scaledSize: scaledSizes[0],
      ),
    );

    double layerRadius = scaledSizes[0] / 2 + scaledSizes[1] / 2 + padding;
    int bubbleIndex = 1;

    while (bubbleIndex < bubbles.length) {
      int bubblesInLayer = max(6, (2 * pi * layerRadius / scaledSizes[bubbleIndex]).floor());

      while (bubblesInLayer > (bubbles.length - bubbleIndex)) {
        bubblesInLayer--;
      }

      double angleIncrement = 2 * pi / bubblesInLayer;

      for (int i = 0; i < bubblesInLayer && bubbleIndex < bubbles.length; i++) {
        var bubble = bubbles[bubbleIndex];
        double angle = i * angleIncrement;
        double x = centerX + layerRadius * cos(angle);
        double y = centerY + layerRadius * sin(angle);

        bool overlapping = false;
        for (int j = 0; j < positionedBubbles.length; j++) {
          double distance = sqrt(
            pow(x - positionedBubbles[j].offset.dx, 2) +
            pow(y - positionedBubbles[j].offset.dy, 2),
          );
          if (distance < (scaledSizes[bubbleIndex] + positionedBubbles[j].scaledSize) / 2) {
            overlapping = true;
            break;
          }
        }

        if (!overlapping) {
          positionedBubbles.add(
            PositionedBubble(
              bubble: bubble,
              offset: Offset(x, y),
              scaledSize: scaledSizes[bubbleIndex],
            ),
          );
          bubbleIndex++;
        }
      }

      layerRadius += max(scaledSizes[0] / 2, scaledSizes[1] / 2);
    }
  }



  // pisitioned as circle updated
  // void _generateBubblePositions() {
  //   positionedBubbles.clear();
  //   if (bubbles.isEmpty) return;

  //   bubbles.sort((a, b) => b.size.compareTo(a.size));

  //   //===
  //   final bubblesCopy = bubbles;
  //   // Separate the largest bubble and shuffle the remaining bubbles
  //   final largestBubble = bubblesCopy.first;
  //   final otherBubbles = bubblesCopy.sublist(1)..shuffle();

  //   // Combine the largest bubble with the shuffled smaller bubbles
  //   final bubblesFinal = [largestBubble, ...otherBubbles];

  //   bubbles.clear();
  //   bubbles.addAll(bubblesFinal);
  //   //==

  //   final centerX = containerWidth / 2;
  //   final centerY = containerHeight / 2;

  //   positionedBubbles.add(
  //     PositionedBubble(
  //       bubble: bubbles[0],
  //       offset: Offset(centerX, centerY),
  //     ),
  //   );

  //   // Calculate the layer radius, starting with the first bubble's radius
  //   // double layerRadius = bubbles[0].size / 2 + padding;
  //   double layerRadius = bubbles[0].size / 2 + bubbles[1].size / 2 + padding;
  //   int bubbleIndex = 1;

  //   while (bubbleIndex < bubbles.length) {
  //     int bubblesInLayer = max(6, (2 * pi * layerRadius / bubbles[bubbleIndex].size).floor());
  //     // Ensure we have enough space for all bubbles in the current layer
  //     while (bubblesInLayer > (bubbles.length - bubbleIndex)) {
  //       bubblesInLayer--;
  //     }

  //     double angleIncrement = 2 * pi / bubblesInLayer;

  //     for (int i = 0; i < bubblesInLayer && bubbleIndex < bubbles.length; i++) {
  //       var bubble = bubbles[bubbleIndex];
  //       double angle = i * angleIncrement;
  //       double x = centerX + layerRadius * cos(angle);
  //       double y = centerY + layerRadius * sin(angle);

  //       bool overlapping = false;
  //       for (var positioned in positionedBubbles) {
  //         double distance = sqrt(
  //           pow(x - positioned.offset.dx, 2) +
  //           pow(y - positioned.offset.dy, 2),
  //         );
  //         if (distance < (bubble.size + positioned.bubble.size) / 2) {
  //           overlapping = true;
  //           break;
  //         }
  //       }

  //       if (!overlapping) {
  //         positionedBubbles.add(
  //           PositionedBubble(bubble: bubble, offset: Offset(x, y)),
  //         );
  //         bubbleIndex++;
  //       }
  //     }

  //     // Increase the layer radius to fit the next layer of bubbles
  //     layerRadius += max(bubbles[0].size / 2, bubbles[1].size/2);
  //   }
  // }




  // pisitioned as circle
  // void _generateBubblePositions() {
  //   positionedBubbles.clear();
  //   if (bubbles.isEmpty) return;

  //   bubbles.sort((a, b) => b.size.compareTo(a.size));

  //   final centerX = containerWidth / 2;
  //   final centerY = containerHeight / 2;

  //   positionedBubbles.add(
  //     PositionedBubble(
  //       bubble: bubbles[0],
  //       offset: Offset(centerX, centerY),
  //     ),
  //   );

  //   double layerRadius = bubbles[0].size / 2 + bubbles[1].size / 1.5;
  //   int bubbleIndex = 1;

  //   while (bubbleIndex < bubbles.length) {
  //     int bubblesInLayer = max(6, (2 * pi * layerRadius / bubbles[bubbleIndex].size).floor());
  //     double angleIncrement = 2 * pi / bubblesInLayer;

  //     for (int i = 0; i < bubblesInLayer && bubbleIndex < bubbles.length; i++) {
  //       var bubble = bubbles[bubbleIndex];
  //       double angle = i * angleIncrement;
  //       double x = centerX + layerRadius * cos(angle);
  //       double y = centerY + layerRadius * sin(angle);

  //       bool overlapping = false;
  //       for (var positioned in positionedBubbles) {
  //         double distance = sqrt(
  //             pow(x - positioned.offset.dx, 2) +
  //             pow(y - positioned.offset.dy, 2));
  //         if (distance < (bubble.size + positioned.bubble.size) / 2) {
  //           overlapping = true;
  //           break;
  //         }
  //       }

  //       if (!overlapping) {
  //         positionedBubbles.add(
  //           PositionedBubble(bubble: bubble, offset: Offset(x, y)),
  //         );
  //         bubbleIndex++;
  //       }
  //     }
  //     layerRadius += 70;
  //   }
  // }
}