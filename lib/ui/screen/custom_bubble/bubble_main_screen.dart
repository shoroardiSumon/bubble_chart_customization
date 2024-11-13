import 'package:bubble_graph/ui/screen/custom_bubble/Custom_bubble_chart.dart';
import 'package:flutter/material.dart';

class BubbleMainScreen extends StatefulWidget {
  const BubbleMainScreen({super.key});

  @override
  State<BubbleMainScreen> createState() => _BubbleMainScreenState();
}

class _BubbleMainScreenState extends State<BubbleMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        title: const Text('Bubble Chart Example'),  
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            //color: Colors.grey[500],
            height: 500,
            width: 500,
            decoration: BoxDecoration(
              color: Colors.grey[500],
              borderRadius: BorderRadius.circular(20),
            ),
            child: const CustomBubbleChart(),
          ),
        ),
      )
    );
  }
}