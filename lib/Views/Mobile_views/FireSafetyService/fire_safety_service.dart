import 'package:flutter/material.dart';
import 'package:metro_pat_customer/Constants/constants.dart';
import 'package:metro_pat_customer/Constants/size_config.dart';
import 'package:metro_pat_customer/Views/Mobile_views/FireSafetyService/evacuationPlans.dart';
import 'package:metro_pat_customer/Views/Mobile_views/FireSafetyService/fire_alarm_testing.dart';
import 'package:metro_pat_customer/Views/Mobile_views/FireSafetyService/fire_alarm_testing_addtional_fault_fixing.dart';
import 'package:metro_pat_customer/Views/Mobile_views/FireSafetyService/fire_exting_uisher_service.dart';
class FireSafetyService extends StatefulWidget {
  const FireSafetyService({super.key});

  @override
  State<FireSafetyService> createState() => _FireSafetyServiceState();
}

class _FireSafetyServiceState extends State<FireSafetyService> with SingleTickerProviderStateMixin {
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
        title: const Text('Fire Safety Service'),
      ),
      body: Column(
        children: [
          TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            controller: _tabController,
            indicatorColor: kpurple,
            tabs: [
              CustomTab(text: 'Evacuation Plans'),
              CustomTab(text: 'Fire Alarm Testing'),
              CustomTab(text: 'Fire Alarm Testing Additional Fault Fixing'),
              CustomTab(text: 'Fire Exting Uisher Service'),
            ],
          ),
          const SizedBox(height: 15,),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                const EvacuationPlans(),
                const FireAlarmTesting(),
                const FireAlarmTestingAddtional(),
                const FireExtingUisherService(),

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
