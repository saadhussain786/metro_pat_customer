import 'package:flutter/material.dart';
import 'package:metro_pat_customer/Constants/constants.dart';
import 'package:metro_pat_customer/Constants/size_config.dart';
import 'package:metro_pat_customer/Views/Mobile_views/FRAAsbestosManagementSurveys/land_lord_hmo_rentalproperty.dart';
import 'package:metro_pat_customer/Views/Mobile_views/FRAAsbestosManagementSurveys/land_lord_ownerscommunalareas.dart';
import 'package:metro_pat_customer/Views/Mobile_views/FRAAsbestosManagementSurveys/select_floor_plant_type.dart';
import 'package:metro_pat_customer/Views/Mobile_views/FRAAsbestosManagementSurveys/shop_sand_offices.dart';
class FraAsbestosManagement extends StatefulWidget {
  const FraAsbestosManagement({super.key});

  @override
  State<FraAsbestosManagement> createState() => _FraAsbestosManagementState();
}

class _FraAsbestosManagementState extends State<FraAsbestosManagement> with SingleTickerProviderStateMixin {
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
        title: const Text('FRA Asbestos Management Surveys'),
      ),
      body: Column(
        children: [
          TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            controller: _tabController,
            indicatorColor: kpurple,
            tabs: [
              CustomTab(text: 'Land Lord HMO Rental Property'),
              CustomTab(text: 'Land Lord Onwers Communal Areas'),
              CustomTab(text: 'Select Floor Plant Type'),
              CustomTab(text: 'Shop Sand Offices'),
            ],
          ),
          const SizedBox(height: 15,),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                const LandLordHMORentalProperty(),
                const LandLordOwnersCommunalAreas(),
                const SelectFloorPlantType(),
                const ShopSandOffices(),

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
