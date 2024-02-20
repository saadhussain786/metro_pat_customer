import 'package:flutter/material.dart';

import '../../../Constants/constants.dart';
import '../../../Constants/size_config.dart';
class LandLordEICRTesting extends StatefulWidget {
  const LandLordEICRTesting({super.key});

  @override
  State<LandLordEICRTesting> createState() => _LandLordEICRTestingState();
}

class _LandLordEICRTestingState extends State<LandLordEICRTesting> {
  int _calculateCrossAxisCount(double screenWidth) {
    if (screenWidth > 600) {
      return 3; // For larger screens, show 3 items in a row
    } else if (screenWidth > 400) {
      return 2; // For medium-sized screens, show 2 items in a row
    } else {
      return 1; // For smaller screens, show 1 item in a row
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  LayoutBuilder(
        builder: (context, constraints) {
          final crossAxisCount = _calculateCrossAxisCount(constraints.maxWidth);
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                mainAxisExtent: 250
            ),
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/product_img.jpg',
                      height: 110,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'AT Deal 0',
                            overflow: TextOverflow.ellipsis,
                            style: headingStyle(),
                          ),
                          Text(
                            '£ 540.00',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 14),
                          ),
                          Text('tFrom £0.54 per test, plus VAT',
                            overflow: TextOverflow.ellipsis,
                            style: headingStyle(),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kgreen
                      ),
                      onPressed: () {
                        // Handle button press
                      },
                      child: Text('View Detail',style: TextStyle(
                          color: kwhite
                      ),),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}