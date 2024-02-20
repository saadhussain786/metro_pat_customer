import 'package:flutter/material.dart';
import 'package:metro_pat_customer/Constants/constants.dart';
import 'package:metro_pat_customer/Constants/size_config.dart';
import 'package:metro_pat_customer/Views/Mobile_views/Legionella/land_lord_legionella_risk_assess.dart';
import 'package:metro_pat_customer/Views/Mobile_views/Legionella/legionella_testing.dart';
class Legionella extends StatefulWidget {
  const Legionella({super.key});

  @override
  State<Legionella> createState() => _LegionellaState();
}

class _LegionellaState extends State<Legionella> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Legionalla'),
      ),
      body: Column(
        children: [
          TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            controller: _tabController,
            indicatorColor: kpurple,
            tabs: [
              CustomTab(text: 'Land Lord Legionella Risk Assess'),
              CustomTab(text: 'Legionella Testing'),
            ],
          ),
          const SizedBox(height: 15,),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                const LandLordLegionellaRisk(),
                const LegionellaTesting(),


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
