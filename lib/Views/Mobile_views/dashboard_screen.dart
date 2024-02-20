import 'package:flutter/material.dart';
import 'package:metro_pat_customer/Constants/constants.dart';
import 'package:metro_pat_customer/Constants/size_config.dart';
import 'package:metro_pat_customer/Views/Mobile_views/EICRTesting/eicr_testing.dart';
import 'package:metro_pat_customer/Views/Mobile_views/Em%20Lights/em_lights.dart';
import 'package:metro_pat_customer/Views/Mobile_views/FRAAsbestosManagementSurveys/fra_asbestos_management_surveys.dart';
import 'package:metro_pat_customer/Views/Mobile_views/FireRiskAssessments/fire_risk_assessments.dart';
import 'package:metro_pat_customer/Views/Mobile_views/FireSafetyService/fire_safety_service.dart';
import 'package:metro_pat_customer/Views/Mobile_views/Legionella/legionella.dart';
import 'package:metro_pat_customer/Views/Mobile_views/pat_test_offer_screen/pat_test_screen.dart';

import '../../Reusable_Widget/drawer_option.dart';
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
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
      appBar: AppBar(
        centerTitle: true,
        title: const Image(
          width: 150,
          height: 150,
          image: AssetImage('assets/metro_pat_logo.png'),
        ),
      ),
      drawer:  Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
                accountName: Text('Basit Ali'), accountEmail: Text('basitali123@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/humanavatar.png'),
            ),
              decoration: BoxDecoration(
                color: kgreen
              ),
            ),
            const SizedBox(height: 20,),
            DrawerOption(
              lable: 'PAT Testing Offer',
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => PatTestScreen(),));
              },
            ),
            DrawerOption(
              lable: 'EICR Testing',
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => EICRTesting(),));

              },
            ),
            DrawerOption(
              lable: 'Em Lights',
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => EmLights(),));
              },
            ),
            DrawerOption(
              lable: 'Fire Risk Assessments',
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => FireRisk(),));
              },
            ),
            DrawerOption(
              lable: 'FRA Asbestos Management Surveys',
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => FraAsbestosManagement(),));
              },
            ),
            DrawerOption(
              lable: 'Fire Safety Service',
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => FireSafetyService(),));
              },
            ),
            DrawerOption(
              lable: 'Legionella',
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Legionella(),));
              },
            ),


          ],
        ),
      ),
      body: LayoutBuilder(
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

