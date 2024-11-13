import 'package:bubble_chart/bubble_chart.dart';
import 'package:bubble_graph/core/model/bubble_chart_wp.dart';
import 'package:flutter/material.dart';

//zoom in out bubble chart
class CustomZoomableBubbleChartWP extends StatefulWidget {
  const CustomZoomableBubbleChartWP({super.key});

  @override
  State<CustomZoomableBubbleChartWP> createState() => _CustomZoomableBubbleChartWPState();
}

class _CustomZoomableBubbleChartWPState extends State<CustomZoomableBubbleChartWP> {
  final List<BubbleDataWP> bubbleData = [
    BubbleDataWP(id: '1', name: 'Microsoft', value: 1190, color: Colors.blue),
    BubbleDataWP(id: '2', name: 'Amazon', value: 1180, color: Colors.orange),
    BubbleDataWP(id: '3', name: 'Google', value: 1175, color: Colors.red),
    BubbleDataWP(id: '4', name: 'Facebook', value: 1170, color: Colors.purple),
    BubbleDataWP(id: '5', name: 'Apple', value: 2200, color: const Color(0xFF336713)),
    BubbleDataWP(id: '6', name: 'Tesla', value: 2100, color: Colors.cyan),
    BubbleDataWP(id: '7', name: 'Alibaba', value: 1160, color: Colors.yellow),
    BubbleDataWP(id: '8', name: 'Tencent', value: 1155, color: Colors.pink),
    BubbleDataWP(id: '9', name: 'Berkshire', value: 1150, color: Colors.teal),
    BubbleDataWP(id: '10', name: 'Visa', value: 1145, color: Colors.brown),

    BubbleDataWP(id: '1', name: 'Microsoft', value: 1190, color: Colors.blue),
    BubbleDataWP(id: '2', name: 'Amazon', value: 1180, color: Colors.orange),
    BubbleDataWP(id: '3', name: 'Google', value: 1175, color: Colors.red),
    BubbleDataWP(id: '4', name: 'Facebook', value: 1170, color: Colors.purple),
    BubbleDataWP(id: '5', name: 'Apple', value: 2200, color: const Color(0xFF336713)),
    BubbleDataWP(id: '6', name: 'Tesla', value: 2100, color: Colors.cyan),
    BubbleDataWP(id: '7', name: 'Alibaba', value: 1160, color: Colors.yellow),
    BubbleDataWP(id: '8', name: 'Tencent', value: 1155, color: Colors.pink),
    BubbleDataWP(id: '9', name: 'Berkshire', value: 1150, color: Colors.teal),
    BubbleDataWP(id: '10', name: 'Visa', value: 1145, color: Colors.brown),
  ];

  double _minValue() {
    return bubbleData.map((e) => e.value).reduce((a, b) => a < b ? a : b).toDouble();
  }

  double _maxValue() {
    return bubbleData.map((e) => e.value).reduce((a, b) => a > b ? a : b).toDouble();
  }

  double _calculateFontSize(double value) {
    double minValue = _minValue();
    double maxValue = _maxValue();

    // Rescale the value between 8 and 16
    return 8 + (value - minValue) * (16 - 8) / (maxValue - minValue);
  }

  List<BubbleNode> _generateBubbleNodes() {
    // Sort the data by value to place the largest bubble in the center
    bubbleData.sort((a, b) => b.value.compareTo(a.value));

    return bubbleData.map((data) {
      // Calculate the text size based on the bubble value
      double textSize = _calculateFontSize(data.value.toDouble());

      return BubbleNode.leaf(
        value: data.value.toDouble(),
        options: BubbleOptions(
          color: data.color,
          child: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  data.color.withOpacity(0.2),
                  data.color.withOpacity(0.5),
                  data.color.withOpacity(0.9),
                ],
                stops: const [0.4, 0.7, 1.0],
              ),
              shape: BoxShape.circle,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text with dynamic font size based on bubble value
                Text(
                  data.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: textSize,
                    overflow: TextOverflow.visible, // Prevent text from overflowing
                  ),
                  textAlign: TextAlign.center, // Center the text within the bubble
                ),
                Text(
                  data.value.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: textSize, // Apply dynamic font size to the value as well
                    overflow: TextOverflow.visible, // Prevent text from overflowing
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zoomable Bubble Chart'),
      ),
      body: Center(
        child: InteractiveViewer(
          boundaryMargin: EdgeInsets.all(20),
          minScale: 0.5, // Minimum zoom out scale
          maxScale: 2.0, // Maximum zoom in scale
          child: Container(
            width: 500,
            height: 500,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 10,
                ),
              ],
            ),
            child: BubbleChartLayout(
              children: [
                BubbleNode.node(
                  padding: 15,
                  children: _generateBubbleNodes(),
                  options: BubbleOptions(
                    color: Colors.transparent, // Remove the background color of the circle
                  ),
                ),
              ],
              duration: const Duration(milliseconds: 500),
            ),
          ),
        ),
      ),
    );
  }
}
