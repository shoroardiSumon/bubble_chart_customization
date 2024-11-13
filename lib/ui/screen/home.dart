import 'package:bubble_graph/ui/screen/bubble_chart_package/custom_bubble_chart_wp.dart';
import 'package:bubble_graph/ui/screen/bubble_chart_package/scrollable_bubble_chart_wp.dart';
import 'package:bubble_graph/ui/screen/bubble_chart_package/zoom_able_buble_chart_wp.dart';
import 'package:bubble_graph/ui/screen/custom_bubble/bubble_main_screen.dart';
import 'package:bubble_graph/ui/screen/custom_bubble/updated_v/bubble_screen_uup.dart';
import 'package:bubble_graph/ui/screen/multi_circle_bubble_chart_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bubble Chart Example'),  
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const ClampingScrollPhysics(),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(CupertinoPageRoute(builder: (context) => const MultiCircleDragableBubbleChartUp()));
                },
                child: const Text('MultiCircle Dragable Bubble Chart'),
              ),
          
              const SizedBox(height: 20),
        
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(CupertinoPageRoute(builder: (context) => const BubbleMainScreen()));
                },
                child: const Text('Custom Bubble Chart Updated'),
              ),
          
              const SizedBox(height: 20),
        
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(CupertinoPageRoute(builder: (context) => const CustomBubbleChartWP()));
                },
                child: const Text('Custom Bubble Chart With Package'),
              ),
          
              const SizedBox(height: 20),
        
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(CupertinoPageRoute(builder: (context) => const CustomZoomableBubbleChartWP()));
                },
                child: const Text('Custom Zoomable Bubble Chart With Package'),
              ),
          
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(CupertinoPageRoute(builder: (context) => const CustomSrollableBubbleChartWP()));
                },
                child: const Text('Custom Zoomable Bubble Chart With Package'),
              ),
          
              const SizedBox(height: 20),
        
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(CupertinoPageRoute(builder: (context) => const BubbleScreen()));
                },
                child: const Text('Custom Scrollable Bubble Chart Finally'),
              ),
          
              const SizedBox(height: 20),

              
            ],
          ),
        ),
      ),
    );
  }
}