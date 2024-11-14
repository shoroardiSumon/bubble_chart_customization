
import 'package:bubble_graph/core/model/bubble_data.dart';
import 'package:bubble_graph/ui/screen/custom_bubble/updated_v/custom_bubble_chart_uup.dart';
import 'package:flutter/material.dart';

class BubbleChartFullBlock extends StatefulWidget {
  final List<BubbleData> bubbleData;
  const BubbleChartFullBlock({super.key, required this.bubbleData});

  @override
  State<BubbleChartFullBlock> createState() => _BubbleChartFullBlockState();
}

class _BubbleChartFullBlockState extends State<BubbleChartFullBlock> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 500,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey[900],
        child: Stack(
          children: [
            // Bubble chart in the background
            Positioned.fill(
              child: CustomBubbleChartUUP(
                bubbles: widget.bubbleData,
                blockSize: "full",
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
                          const SnackBar(content: Text('Clicked on full block info icon')),
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

            // Insights section positioned at the bottom
            Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.grey[700],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Insights: ',
                        style: TextStyle(
                          color: Colors.greenAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text:
                            'The market capitalization of a company is calculated by multiplying the current stock price by the number of outstanding shares. It indicates the size of a company and its influence on the market. ',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
