import 'package:flutter/material.dart';
import 'package:metro_pat_customer/Constants/constants.dart';
import 'package:metro_pat_customer/Constants/size_config.dart';
import 'package:metro_pat_customer/Views/Mobile_views/pat_test_offer_screen/business_pta_testing.dart';
import 'package:metro_pat_customer/Views/Mobile_views/pat_test_offer_screen/commercial_pta_testing.dart';
import 'package:metro_pat_customer/Views/Mobile_views/pat_test_offer_screen/constrcution_pta_testing.dart';
class PatTestScreen extends StatefulWidget {
  const PatTestScreen({super.key});

  @override
  State<PatTestScreen> createState() => _PatTestScreenState();
}

class _PatTestScreenState extends State<PatTestScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PAT Testing Offer'),
      ),
      body: Column(
        children: [
          TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            controller: _tabController,
            indicatorColor: kpurple,
            tabs: [
              CustomTab(text: 'Commercial Pat Testing'),
              CustomTab(text: 'Business Pat Testing'),
              CustomTab(text: 'Construction Pat Testing'),
            ],
          ),
          const SizedBox(height: 15,),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                const CommercialPta(),
                const BusinessPta(),
                const ConstructionPta()
            
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
