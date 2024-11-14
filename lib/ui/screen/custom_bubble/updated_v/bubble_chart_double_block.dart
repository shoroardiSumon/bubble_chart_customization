
import 'package:bubble_graph/core/model/bubble_data.dart';
import 'package:bubble_graph/ui/screen/custom_bubble/updated_v/custom_bubble_chart_uup.dart';
import 'package:flutter/material.dart';

class BubbleChartDoubleBlock extends StatefulWidget {
  final List<BubbleData> bubbleData;
  const BubbleChartDoubleBlock({super.key, required this.bubbleData});

  @override
  State<BubbleChartDoubleBlock> createState() => _BubbleChartDoubleBlockState();
}

class _BubbleChartDoubleBlockState extends State<BubbleChartDoubleBlock> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 180,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey[900],
        child: Stack(
          children: [
            // Bubble chart in the background
            Positioned.fill(
              child: CustomBubbleChartUUP(
                bubbles: widget.bubbleData,
                blockSize: "double",
              ),
            ),
            
            // Title positioned at the top
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 48,
                padding: const EdgeInsets.all(12.0),
                color: Colors.grey[700],
                child: Row(
                  children: [
                    const Text(
                      'Market Capitalization',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Clicked on double block info icon')),
                        );
                      },
                      child: const Icon(
                        Icons.info_outline,
                        size: 24,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}