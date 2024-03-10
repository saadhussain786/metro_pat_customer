import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:metro_pat_customer/Constants/size_config.dart';
import 'package:metro_pat_customer/Controller/get_package_detail_controller.dart';
import 'package:metro_pat_customer/Controller/get_service_by_category_id_controller.dart';
import 'package:metro_pat_customer/Model/get_package_detail_model.dart';
import 'package:metro_pat_customer/Model/get_service_by_category_id_model.dart';
import 'package:metro_pat_customer/Views/Mobile_views/product_description.dart';

import '../../Constants/constants.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key, required this.title, required this.categoryID});
  final String title;
  final String categoryID;

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  int _calculateCrossAxisCount(double screenWidth) {
    if (screenWidth > 600) {
      return 3; // For larger screens, show 3 items in a row
    } else if (screenWidth > 400) {
      return 2; // For medium-sized screens, show 2 items in a row
    } else {
      return 1; // For smaller screens, show 1 item in a row
    }}

  int currentIndex = 0;
  String defaultPackage = "0";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: FutureBuilder(
                        future: GetServiceBuCateforyIDController.getServiceByCategoryID(GetServiceByCategoryIDModel(cateID: widget.categoryID)),
                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            Map map = jsonDecode(snapshot.data);
                            List getServices = map["data"];
                            int recordFound = map["total_records"];
                            return recordFound != 0 ? ListView.builder(
                              itemCount: getServices.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              physics: const ScrollPhysics(),
                              itemBuilder: (context, index) {
                                // defaultPackage = getServices[0]["id"];
                                return GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      currentIndex = index;
                                      defaultPackage = getServices[index]["id"];
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    margin: const EdgeInsets.symmetric(horizontal: 4,vertical: 4),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: currentIndex == index ? kgreen : Colors.transparent,
                                    ),
                                    child: Text(getServices[index]["name"],style:headingStyle(color1: currentIndex == index ? kwhite : kblack)),
                                  ),
                                );
                              },) : Center(child: Text("No Service Found",style:headingStyle(color1: kblack)));
                          } else if (snapshot.hasError) {
                            return const Icon(Icons.error_outline);
                          } else {
                            return Center(child: Text("Getting Services",style:headingStyle(color1: kblack)));
                          }
                        }),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            LayoutBuilder(
              builder: (context, constraints) {
                return FutureBuilder(
                    future: GetPackageDetailController.getPackageDetail(GetPackageDetailModel(packageID: defaultPackage.toString())),
                    builder: (BuildContext context,  snapshot) {
                      if (snapshot.hasData) {
                        Map map = jsonDecode(snapshot.data);
                        List getPackages = map["data"];
                        int packageFound = map["total_records"];
                        final crossAxisCount = _calculateCrossAxisCount(constraints.maxWidth);
                        return packageFound != 0 ? GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: crossAxisCount,
                              crossAxisSpacing: 8.0,
                              mainAxisSpacing: 8.0,
                              mainAxisExtent: 250
                          ),
                          itemCount: getPackages.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    "${getPackages[index]["image"]}",
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
                                          "${getPackages[index]["name"]}",
                                          overflow: TextOverflow.ellipsis,
                                          style: headingStyle(),
                                        ),
                                        Text(
                                          '£ ${getPackages[index]["price"]}',
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                        Text("${getPackages[index]["description"]}",
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
                                     Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDescription(productId: "${getPackages[index]["id"]}"),));
                                    },
                                    child: const Text('View Detail',style: TextStyle(
                                        color: kwhite
                                    ),),
                                  ),
                                ],
                              ),
                            );
                          },
                        ) : Center(child: Text("No Package Found",style:headingStyle(color1: kblack)));
                      } else if (snapshot.hasError) {
                        return const Icon(Icons.error_outline);
                      } else {
                        return const Center(child: SizedBox(width: 40,height: 40,child: CircularProgressIndicator()));
                      }
                    });
              },
            )
          ],
        ),
      ),
    );
  }
}
