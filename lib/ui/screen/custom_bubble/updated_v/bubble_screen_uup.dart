import 'package:bubble_graph/core/model/bubble_data.dart';
import 'package:bubble_graph/ui/screen/custom_bubble/updated_v/bubble_chart_double_block.dart';
import 'package:bubble_graph/ui/screen/custom_bubble/updated_v/bubble_chart_full_block.dart';
import 'package:bubble_graph/ui/screen/custom_bubble/updated_v/bubble_chart_small_block.dart';
import 'package:flutter/material.dart';

class BubbleScreen extends StatefulWidget {
  const BubbleScreen({super.key});

  @override
  State<BubbleScreen> createState() => _BubbleScreenState();
}

class _BubbleScreenState extends State<BubbleScreen> {
  @override
  Widget build(BuildContext context) {
    // Sample bubble data
    final List<BubbleData> bubbleData = [
      BubbleData(id: 1, name: 'Microsoft', value: 11400, color: Colors.blue),
      BubbleData(id: 2, name: 'Amazon', value: 1190, color: Colors.orange),
      BubbleData(id: 3, name: 'Google', value: 1775, color: Colors.red),
      BubbleData(id: 4, name: 'Facebook', value: 12200, color: Colors.purple),
      BubbleData(id: 5, name: 'Apple', value: 1150, color: const Color(0xFF336713)),
      BubbleData(id: 6, name: 'Tesla', value: 3165, color: Colors.cyan),
      BubbleData(id: 7, name: 'Alibaba', value: 11560, color: Colors.yellow),
      BubbleData(id: 8, name: 'Tencent', value: 1190, color: Colors.pink),
      BubbleData(id: 9, name: 'Berkshire', value: 1550, color: Colors.teal),
      BubbleData(id: 10, name: 'Visa', value: 1145, color: Colors.brown),

      BubbleData(id: 11, name: 'Microsoft', value: 2300, color: Colors.blue),
      BubbleData(id: 12, name: 'Amazon', value: 1110, color: Colors.orange),
      BubbleData(id: 13, name: 'Google', value: 6120, color: Colors.red),
      BubbleData(id: 14, name: 'Facebook', value: 7230, color: Colors.purple),
      BubbleData(id: 15, name: 'Apple', value: 8140, color: Colors.green),
      BubbleData(id: 16, name: 'Tesla', value: 3150, color: Colors.cyan),
      BubbleData(id: 17, name: 'Alibaba', value: 11660, color: Colors.yellow),
      BubbleData(id: 18, name: 'Tencent', value: 1110, color: Colors.pink),
      BubbleData(id: 19, name: 'Berkshire', value: 2190, color: Colors.teal),
      BubbleData(id: 20, name: 'Visa', value: 1901, color: Colors.brown),
    ];

    // Directly passing the bubble data to CustomBubbleChart
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bubble Chart UUP Example'),  
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              BubbleChartFullBlock(
                bubbleData: bubbleData,
              ),

              const SizedBox(height: 50),

              BubbleChartDoubleBlock(
                bubbleData: bubbleData,
              ),

              const SizedBox(height: 50),

              BubbleChartSmallBlock(
                bubbleData: bubbleData,
              ),

              const SizedBox(height: 50),
            ],
          ),
        ),
      )
    );
  }
}