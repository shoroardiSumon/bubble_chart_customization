// import 'package:bubble_chart/bubble_chart.dart';
// import 'package:bubble_graph/core/model/bubble_chart_wp.dart';
// import 'package:flutter/material.dart';

// //Scrollable bubble chart working
// class CustomSrollableBubbleChartWP extends StatefulWidget {
//   const CustomSrollableBubbleChartWP({super.key});

//   @override
//   State<CustomSrollableBubbleChartWP> createState() => _CustomSrollableBubbleChartWPState();
// }

// class _CustomSrollableBubbleChartWPState extends State<CustomSrollableBubbleChartWP> {
//   final List<BubbleDataWP> bubbleData = [
//     BubbleDataWP(id: '1', name: 'Apple', value: 2200, color: Colors.blue),
//     BubbleDataWP(id: '2', name: 'Microsoft', value: 2100, color: Colors.orange),
//     BubbleDataWP(id: '3', name: 'Amazon', value: 1950, color: Colors.red),
//     BubbleDataWP(id: '4', name: 'Tesla', value: 1800, color: Colors.green),
//     BubbleDataWP(id: '5', name: 'Google', value: 1750, color: Colors.purple),
//     BubbleDataWP(id: '6', name: 'Facebook', value: 1600, color: Colors.yellow),
//     BubbleDataWP(id: '7', name: 'Alibaba', value: 1500, color: Colors.cyan),
//     BubbleDataWP(id: '8', name: 'Netflix', value: 1450, color: Colors.pink),
//     BubbleDataWP(id: '9', name: 'Adobe', value: 1400, color: Colors.brown),
//     BubbleDataWP(id: '10', name: 'IBM', value: 1300, color: Colors.teal),

//     BubbleDataWP(id: '11', name: 'Intel', value: 1200, color: Colors.blue),
//     BubbleDataWP(id: '12', name: 'Nvidia', value: 1150, color: Colors.orange),
//     BubbleDataWP(id: '13', name: 'SAP', value: 1100, color: Colors.red),
//     BubbleDataWP(id: '14', name: 'Oracle', value: 1050, color: Colors.green),
//     BubbleDataWP(id: '15', name: 'Spotify', value: 1000, color: Colors.purple),
//     BubbleDataWP(id: '16', name: 'Twitter', value: 950, color: Colors.yellow),
//     BubbleDataWP(id: '17', name: 'Snapchat', value: 900, color: Colors.cyan),
//     BubbleDataWP(id: '18', name: 'Pinterest', value: 850, color: Colors.pink),
//     BubbleDataWP(id: '19', name: 'Uber', value: 800, color: Colors.brown),
//     BubbleDataWP(id: '20', name: 'Lyft', value: 750, color: Colors.teal),
//   ];

//   double _minValue() {
//     return bubbleData.map((e) => e.value).reduce((a, b) => a < b ? a : b).toDouble();
//   }

//   double _maxValue() {
//     return bubbleData.map((e) => e.value).reduce((a, b) => a > b ? a : b).toDouble();
//   }

//   double _calculateFontSize(double value) {
//     double minValue = _minValue();
//     double maxValue = _maxValue();

//     // Rescale the value between 8 and 16
//     return 10 + (value - minValue) * (16 - 10) / (maxValue - minValue);
//   }

//   // Modify the way you calculate the size of the bubble
//   double _calculateBubbleSize(double value) {
//     double minValue = _minValue();
//     double maxValue = _maxValue();

//     // Rescale the value between a small and large size
//     return 50 + (value - minValue) * (150 - 50) / (maxValue - minValue); // Example range between 50 and 150
//   }

//   List<BubbleNode> _generateBubbleNodes() {
//   // Sort the data by value to place the largest bubble in the center
//   bubbleData.sort((a, b) => b.value.compareTo(a.value));

//   return bubbleData.map((data) {
//     // Calculate the bubble size based on the value
//     double bubbleSize = _calculateBubbleSize(data.value.toDouble());
//     double textSize = _calculateFontSize(data.value.toDouble());

//     return BubbleNode.leaf(
//       value: data.value.toDouble(),
//       options: BubbleOptions(
//         child: Container(
//           width: bubbleSize, // Set the dynamic width of the bubble
//           height: bubbleSize, // Set the dynamic height of the bubble
//           // width: 100, // Set the dynamic width of the bubble
//           // height: 100, // Set the dynamic height of the bubble
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
            
//             gradient: RadialGradient(
//               colors: [
//                 data.color.withOpacity(0.4),
//                 data.color.withOpacity(0.6),
//                 data.color.withOpacity(1),
//               ],
//               stops: const [0.4, 0.7, 1.0],
//             ),

//             boxShadow: [
//               BoxShadow(
//                 color: data.color.withOpacity(0.6),
//                 spreadRadius: 10,
//                 blurRadius: 15,
//                 offset: const Offset(0, 0),
//               ),
//               // BoxShadow(
//               //   color: data.color.withOpacity(0.6),
//               //   spreadRadius: bubbleSize * 0.15, // Adjusted spread based on bubble size
//               //   blurRadius: bubbleSize * 0.25,  // Adjusted blur based on bubble size
//               //   offset: const Offset(0, 0), // Center shadow
//               // ),
//             ],
//           ),
//           child: Center( // Center the text inside the bubble
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   data.name,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: textSize,
//                     overflow: TextOverflow.ellipsis, // Prevent overflow
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 Text(
//                   data.value.toString(),
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: textSize,
//                     overflow: TextOverflow.ellipsis, // Prevent overflow
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }).toList();
// }


//   // List<BubbleNode> _generateBubbleNodes() {
//   //   // Sort the data by value to place the largest bubble in the center
//   //   bubbleData.sort((a, b) => b.value.compareTo(a.value));

//   //   return bubbleData.map((data) {
//   //     double bubbleSize = _calculateBubbleSize(data.value.toDouble());
//   //     double textSize = _calculateFontSize(data.value.toDouble());

//   //     return BubbleNode.leaf(
//   //       value: data.value.toDouble(),
//   //       options: BubbleOptions(
//   //         child: Container(
//   //           width: bubbleSize, // Dynamic size based on bubble value
//   //           height: bubbleSize, // Dynamic size based on bubble value
//   //           decoration: BoxDecoration(
//   //             shape: BoxShape.circle,
//   //             gradient: RadialGradient(
//   //               colors: [
//   //                 data.color.withOpacity(0.2),
//   //                 data.color.withOpacity(0.5),
//   //                 data.color.withOpacity(0.9),
//   //               ],
//   //               stops: const [0.4, 0.7, 1.0],
//   //             ),
//   //             boxShadow: [
//   //               BoxShadow(
//   //                 color: data.color.withOpacity(0.6),
//   //                 spreadRadius: bubbleSize * 0.2, // Shadow size proportional to the bubble size
//   //                 blurRadius: bubbleSize * 0.3, // Blur based on bubble size
//   //                 offset: const Offset(0, 0),
//   //               ),
//   //             ],
//   //           ),
//   //           child: Column(
//   //             mainAxisAlignment: MainAxisAlignment.center,
//   //             children: [
//   //               // Text with dynamic font size based on bubble value
//   //               Text(
//   //                 data.name,
//   //                 style: TextStyle(
//   //                   color: Colors.white,
//   //                   fontSize: textSize,
//   //                   overflow: TextOverflow.visible,
//   //                 ),
//   //                 textAlign: TextAlign.center,
//   //               ),
//   //               Text(
//   //                 data.value.toString(),
//   //                 style: TextStyle(
//   //                   color: Colors.white,
//   //                   fontSize: textSize,
//   //                   overflow: TextOverflow.visible,
//   //                 ),
//   //                 textAlign: TextAlign.center,
//   //               ),
//   //             ],
//   //           ),
//   //         ),
//   //       ),
//   //     );
//   //   }).toList();
//   // }

//   // List<BubbleNode> _generateBubbleNodes() {
//   //   // Sort the data by value to place the largest bubble in the center
//   //   bubbleData.sort((a, b) => b.value.compareTo(a.value));

//   //   return bubbleData.map((data) {
//   //     // Calculate the text size based on the bubble value
//   //     double textSize = _calculateFontSize(data.value.toDouble());

//   //     return BubbleNode.leaf(
//   //       value: data.value.toDouble(),

//   //       options: BubbleOptions(
//   //         //color: data.color,
//   //         child: Container(
//   //           padding: const EdgeInsets.all(0),
//   //           width: double.infinity,
//   //           height: double.infinity,
//   //           decoration: BoxDecoration(
//   //             shape: BoxShape.circle,
//   //             gradient: RadialGradient(
//   //               colors: [
//   //                 data.color.withOpacity(0.2),
//   //                 data.color.withOpacity(0.5),
//   //                 data.color.withOpacity(0.9),
//   //               ],
//   //               stops: const [0.4, 0.7, 1.0],
//   //             ),
//   //             boxShadow: [
//   //               BoxShadow(
//   //                 color: data.color.withOpacity(0.6),
//   //                 spreadRadius: 10,
//   //                 blurRadius: 15,
//   //                 offset: const Offset(0, 0),
//   //               ),
//   //             ],
//   //           ),
//   //           child: Column(
//   //             mainAxisAlignment: MainAxisAlignment.center,
//   //             children: [
//   //               // Text with dynamic font size based on bubble value
//   //               Text(
//   //                 data.name,
//   //                 style: TextStyle(
//   //                   color: Colors.white,
//   //                   fontSize: textSize,
//   //                   overflow: TextOverflow.visible, // Prevent text from overflowing
//   //                 ),
//   //                 textAlign: TextAlign.center, // Center the text within the bubble
//   //               ),
//   //               Text(
//   //                 data.value.toString(),
//   //                 style: TextStyle(
//   //                   color: Colors.white,
//   //                   fontSize: textSize, // Apply dynamic font size to the value as well
//   //                   overflow: TextOverflow.visible, // Prevent text from overflowing
//   //                 ),
//   //                 textAlign: TextAlign.center,
//   //               ),
//   //             ],
//   //           ),
//   //         ),
//   //       ),
//   //     );
//   //   }).toList();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Scrollable Bubble Chart'),
//       ),
//       body: Container(
//         width: double.infinity, // Set width large enough to support scrolling
//         height: 600,
//         padding: const EdgeInsets.all(1),
//         margin: const EdgeInsets.all(16),
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//           color: Colors.black,
//           borderRadius: BorderRadius.circular(20),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.3),
//               spreadRadius: 5,
//               blurRadius: 10,
//             ),
//           ],
//         ),
        
//         child: SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//             child: Container(
//               width: 500, // Set width large enough to support scrolling
//               height: 500, // Set height large enough to support scrolling
//               alignment: Alignment.center,
//               child: BubbleChartLayout(
//                 children: [
//                   BubbleNode.node(
//                     padding: 20,
//                     children: _generateBubbleNodes(),
//                     options: BubbleOptions(
//                       // border: Border.all(
//                       //   color: Colors.black,
//                       //   width: 1,
//                       // ),
//                       color: Colors.transparent, // Remove the background color of the circle
//                     ),
//                   ),
//                 ],
//                 duration: const Duration(milliseconds: 500),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }










import 'package:bubble_chart/bubble_chart.dart';
import 'package:bubble_graph/core/model/bubble_chart_wp.dart';
import 'package:bubble_graph/core/provider/bubble_chart_provider.dart';
import 'package:bubble_graph/ui/screen/bubble_chart_package/bubble_with_shadow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomSrollableBubbleChartWP extends StatefulWidget {
  const CustomSrollableBubbleChartWP({super.key});

  @override
  State<CustomSrollableBubbleChartWP> createState() => _CustomSrollableBubbleChartWPState();
}

class _CustomSrollableBubbleChartWPState extends State<CustomSrollableBubbleChartWP> {
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

  final List<BubbleDataWP> bubbleData = [
    BubbleDataWP(id: '1', name: 'Apple', value: 4200, color: Colors.blue),
    BubbleDataWP(id: '2', name: 'Microsoft', value: 2100, color: Colors.orange),
    BubbleDataWP(id: '3', name: 'Amazon', value: 1950, color: Colors.red),
    BubbleDataWP(id: '4', name: 'Tesla', value: 1800, color: Colors.green),
    BubbleDataWP(id: '5', name: 'Google', value: 1750, color: Colors.purple),
    BubbleDataWP(id: '6', name: 'Facebook', value: 1600, color: Colors.yellow),
    BubbleDataWP(id: '7', name: 'Alibaba', value: 1500, color: Colors.cyan),
    BubbleDataWP(id: '8', name: 'Netflix', value: 1450, color: Colors.pink),
    BubbleDataWP(id: '9', name: 'Adobe', value: 1400, color: Colors.brown),
    BubbleDataWP(id: '10', name: 'IBM', value: 1300, color: Colors.teal),
    BubbleDataWP(id: '11', name: 'Intel', value: 1200, color: Colors.blue),
    BubbleDataWP(id: '12', name: 'Nvidia', value: 1150, color: Colors.orange),
    BubbleDataWP(id: '13', name: 'SAP', value: 1100, color: Colors.red),
    BubbleDataWP(id: '14', name: 'Oracle', value: 1050, color: Colors.green),
    BubbleDataWP(id: '15', name: 'Spotify', value: 1000, color: Colors.purple),
    BubbleDataWP(id: '16', name: 'Twitter', value: 950, color: Colors.yellow),
    BubbleDataWP(id: '17', name: 'Snapchat', value: 900, color: Colors.cyan),
    BubbleDataWP(id: '18', name: 'Pinterest', value: 850, color: Colors.pink),
    BubbleDataWP(id: '19', name: 'Uber', value: 800, color: Colors.brown),
    BubbleDataWP(id: '20', name: 'Lyft', value: 750, color: Colors.teal),
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
    return 10 + (value - minValue) * (16 - 10) / (maxValue - minValue);
  }

  double _calculateBubbleSize(double value) {
    double minValue = _minValue();
    double maxValue = _maxValue();

    // Rescale the value between a small and large size
    return 50 + (value - minValue) * (150 - 50) / (maxValue - minValue);
  }


  List<BubbleNode> _generateBubbleNodes() {
    // Sort the data by value to place the largest bubble in the center
    bubbleData.sort((a, b) => b.value.compareTo(a.value));

    // Separate the largest bubble and shuffle the remaining bubbles
    final largestBubble = bubbleData.first;
    final otherBubbles = bubbleData.sublist(1)..shuffle();

    // Combine the largest bubble with the shuffled smaller bubbles
    final randomizedBubbles = [largestBubble, ...otherBubbles];

    return randomizedBubbles.map((data) {
      double bubbleSize = _calculateBubbleSize(data.value.toDouble());
      double textSize = _calculateFontSize(data.value.toDouble());
      print('Bubble Value: ');
      print(data.value.toString());

      // return BubbleNode.leaf(
      //   value: data.value.toDouble(),
      //   options: BubbleOptions(
      //     child: Stack(
      //       alignment: Alignment.center,
      //       children: [
      //         // Shadow container
      //         Container(
      //           width: data.value.toDouble(),
      //           height: data.value.toDouble(),
      //           decoration: BoxDecoration(
      //             shape: BoxShape.circle,
      //             boxShadow: [
      //               BoxShadow(
      //                 color: data.color.withOpacity(0.6),
      //                 spreadRadius: data.value.toDouble() / 2 + 50,
      //                 blurRadius: data.value.toDouble() / 2 + 50,
      //                 offset: const Offset(0, 0),
      //               ),
      //             ],
      //           ),
      //         ),
      //         // Gradient container
      //         Container(
      //           width: data.value.toDouble(),
      //           height: data.value.toDouble(),
      //           decoration: BoxDecoration(
      //             shape: BoxShape.circle,
      //             gradient: RadialGradient(
      //               colors: [
      //                 data.color.withOpacity(0.4),
      //                 data.color.withOpacity(0.6),
      //                 data.color.withOpacity(1),
      //               ],
      //               stops: const [0.4, 0.7, 1.0],
      //             ),
      //           ),
      //           child: Center(
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 Text(
      //                   data.name,
      //                   style: TextStyle(
      //                     color: Colors.white,
      //                     fontSize: textSize,
      //                     overflow: TextOverflow.ellipsis,
      //                   ),
      //                   textAlign: TextAlign.center,
      //                 ),
      //                 Text(
      //                   data.value.toString(),
      //                   style: TextStyle(
      //                     color: Colors.white,
      //                     fontSize: textSize,
      //                     overflow: TextOverflow.ellipsis,
      //                   ),
      //                   textAlign: TextAlign.center,
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // );


      // return BubbleNode.leaf(
      //   value: data.value.toDouble(),
      //   options: BubbleOptions(
      //     child: Container(
      //       decoration: BoxDecoration(
      //         shape: BoxShape.circle,
      //         boxShadow: [
      //           BoxShadow(
      //             color: data.color.withOpacity(0.6),
      //             spreadRadius: data.value.toDouble() / 2 + 50,
      //             blurRadius: data.value.toDouble() / 2 + 50,
      //             offset: const Offset(0, 0),
      //           ),
      //         ],
      //       ),
      //       child: Container(
      //         width: data.value.toDouble(),
      //         height: data.value.toDouble(),
      //         decoration: BoxDecoration(
      //           shape: BoxShape.circle,
      //           gradient: RadialGradient(
      //             colors: [
      //               data.color.withOpacity(0.4),
      //               data.color.withOpacity(0.6),
      //               data.color.withOpacity(1),
      //             ],
      //             stops: const [0.4, 0.7, 1.0],
      //           ),
      //         ),
      //         child: Center(
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               Text(
      //                 data.name,
      //                 style: TextStyle(
      //                   color: Colors.white,
      //                   fontSize: textSize,
      //                   overflow: TextOverflow.ellipsis,
      //                 ),
      //                 textAlign: TextAlign.center,
      //               ),
      //               Text(
      //                 data.value.toString(),
      //                 style: TextStyle(
      //                   color: Colors.white,
      //                   fontSize: textSize,
      //                   overflow: TextOverflow.ellipsis,
      //                 ),
      //                 textAlign: TextAlign.center,
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      // );


      // return BubbleNode.leaf(
      //   value: data.value.toDouble(),
      //   options: BubbleOptions(
      //     child: Container(
      //       width: data.value.toDouble(),
      //       height: data.value.toDouble(),
      //       decoration: BoxDecoration(
      //         shape: BoxShape.circle,
      //         gradient: RadialGradient(
      //           colors: [
      //             data.color.withOpacity(0.4),
      //             data.color.withOpacity(0.6),
      //             data.color.withOpacity(1),
      //           ],
      //           stops: const [0.4, 0.7, 1.0],
      //         ),
      //         boxShadow: [
      //           BoxShadow(
      //             color: data.color.withOpacity(0.6),
      //             spreadRadius: data.value.toDouble()/2+50,  // Adjust spread based on bubble size
      //             blurRadius: data.value.toDouble()/2 + 50,    // Adjust blur based on bubble size
      //             offset: const Offset(0, 0),
      //           ),
      //         ],
      //       ),
          
          
      //       child: Center(
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             Text(
      //               data.name,
      //               style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: textSize,
      //                 overflow: TextOverflow.ellipsis,
      //               ),
      //               textAlign: TextAlign.center,
      //             ),
      //             Text(
      //               data.value.toString(),
      //               style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: textSize,
      //                 overflow: TextOverflow.ellipsis,
      //               ),
      //               textAlign: TextAlign.center,
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ),
      // );

      return BubbleNode.leaf(
        value: data.value.toDouble(),
        options: BubbleOptions(
          child: BubbleWithShadow(
            size: data.value.toDouble()-100.0, 
            color: data.color, 
            name: data.name, 
            value: data.value.toDouble(), 
            textSize: textSize
          )
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scrollable Bubble Chart'),
      ),
      body: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: double.infinity,
          height: 600,
          padding: const EdgeInsets.all(1),
          margin: const EdgeInsets.all(16),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 10,
              ),
            ],
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: _horizontalScrollController,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              controller: _verticalScrollController,
              child: Container(
                width: 700,
                height: 700,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: BubbleChartLayout(
                  children: [
                    BubbleNode.node(
                      padding: 30,
                      children: _generateBubbleNodes(),
                      options: BubbleOptions(
                        color: Colors.transparent,
                      ),
                    ),
                  ],
                  duration: const Duration(milliseconds: 500),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
