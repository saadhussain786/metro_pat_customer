import 'package:flutter/material.dart';
import 'package:metro_pat_customer/Constants/constants.dart';
import 'package:metro_pat_customer/Constants/size_config.dart';
import 'package:metro_pat_customer/Views/Mobile_views/FireRiskAssessments/asbestos_management_surveys.dart';
import 'package:metro_pat_customer/Views/Mobile_views/FireRiskAssessments/fire_risk_assessments_all_business.dart';
import 'package:metro_pat_customer/Views/Mobile_views/FireRiskAssessments/fire_risk_assessments_communal_areas.dart';
import 'package:metro_pat_customer/Views/Mobile_views/FireRiskAssessments/floor_plants.dart';
class FireRisk extends StatefulWidget {
  const FireRisk({super.key});

  @override
  State<FireRisk> createState() => _FireRiskState();
}

class _FireRiskState extends State<FireRisk> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fire Risk Assessments'),
      ),
      body: Column(
        children: [
          TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            controller: _tabController,
            indicatorColor: kpurple,
            tabs: [
              CustomTab(text: 'Asbestos Management Surveys'),
              CustomTab(text: 'Fire Risk Assessments All Business'),
              CustomTab(text: 'Fire Risk Assessments Communal Areas'),
              CustomTab(text: 'Floor Plants'),
            ],
          ),
          const SizedBox(height: 15,),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                const FireRiskAsbestos(),
                const FireRiskAllBusiness(),
                const FireRiskCommunal(),
                const FloorPlants(),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
class CustomTab extends StatelessWidget {
  final String text;

  CustomTab({required this.text});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: kgreen,
        ),
        child: Text(text,style:headingStyle(color1: kwhite)),
      ),
    );
  }
}
