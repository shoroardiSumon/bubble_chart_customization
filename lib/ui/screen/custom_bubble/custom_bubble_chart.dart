
import 'package:bubble_graph/core/provider/bubble_chart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomBubbleChart extends StatefulWidget {
  const CustomBubbleChart({super.key});

  @override
  _CustomBubbleChartState createState() => _CustomBubbleChartState();
}

class _CustomBubbleChartState extends State<CustomBubbleChart> {
  final ScrollController _horizontalScrollController = ScrollController();
  final ScrollController _verticalScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final bubbleProvider = Provider.of<BubbleChartProvider>(context, listen: false);

      // Calculate initial offset to center the scroll position
      double initialHorizontalOffset = (bubbleProvider.containerWidth / 2) - (MediaQuery.of(context).size.width / 2);
      double initialVerticalOffset = (bubbleProvider.containerHeight / 2) - (MediaQuery.of(context).size.height / 2);

      // Ensure offsets are not negative
      initialHorizontalOffset = initialHorizontalOffset > 0 ? initialHorizontalOffset : 0;
      initialVerticalOffset = initialVerticalOffset > 0 ? initialVerticalOffset : 0;

      //_horizontalScrollController.jumpTo(initialHorizontalOffset);
      Future.delayed(const Duration(milliseconds: 100), () => _verticalScrollController.jumpTo(initialVerticalOffset));
      Future.delayed(const Duration(milliseconds: 100), () => _horizontalScrollController.jumpTo(initialHorizontalOffset));
      
      //_verticalScrollController.jumpTo(initialVerticalOffset);
    });
  }

  @override
  void dispose() {
    _horizontalScrollController.dispose();
    _verticalScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bubbleProvider = Provider.of<BubbleChartProvider>(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        controller: _verticalScrollController,
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          controller: _horizontalScrollController,
          scrollDirection: Axis.horizontal,
          child: Container(
            width: bubbleProvider.containerWidth,
            height: bubbleProvider.containerHeight,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: bubbleProvider.positionedBubbles,
            ),
          ),
        ),
      ),
    );
  }
}


// class CustomBubbleChart extends StatelessWidget {
//   const CustomBubbleChart({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final bubbleProvider = Provider.of<BubbleChartProvider>(context);

//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Container(
//             width: bubbleProvider.containerWidth,
//             height: bubbleProvider.containerHeight,
//             color: Colors.white,
//             child: Stack(
//               children: bubbleProvider.positionedBubbles,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }