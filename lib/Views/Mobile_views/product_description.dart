import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:metro_pat_customer/Constants/constants.dart';
import 'package:metro_pat_customer/Constants/size_config.dart';
import 'package:metro_pat_customer/Controller/get_package_detail_controller.dart';
import 'package:metro_pat_customer/Model/get_package_detail_model.dart';
import 'package:metro_pat_customer/Reusable_Widget/custom_button.dart';
import 'package:metro_pat_customer/Views/Mobile_views/check_out_bill.dart';

class ProductDescription extends StatefulWidget {
  String productId;
  ProductDescription({super.key, required this.productId});

  @override
  State<ProductDescription> createState() =>
      _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth * 0.02,
            vertical: SizeConfig.screenHeight * 0.002),
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),

            child: FutureBuilder(
              future: GetPackageDetailController.getPackageDetail(GetPackageDetailModel(packageID: widget.productId)),
              builder: (context, snapshot) {
                if (ConnectionState.waiting == snapshot.connectionState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return const Center(
                    child: Text(
                      'Error',
                      style: TextStyle(color: Colors.red, fontSize: 18),
                    ),
                  );
                }
                if (snapshot.hasData) {
                  Map data=jsonDecode(snapshot.data);
                 List serviceData=data['data'];


                  return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const ScrollPhysics(),
                    itemCount: serviceData.length,
                    itemBuilder: (context, index) {
                    String serviceName=serviceData[index]['service_name'];
                    String serviceDescription=serviceData[index]['service_description'];
                    String productDescription=serviceData[index]['description'];
                    String productPrice=serviceData[index]['price'];
                    String productImage=serviceData[index]['service_image'];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: SizeConfig.screenHeight * 0.4,
                          decoration:  BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(productImage))),
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight * 0.02,
                        ),
                        Text(
                          serviceName,
                          style: headingStyle(),
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight * 0.02,
                        ),
                        Text(
                          'Service Details',
                          style: headingStyle(color1: kpurple),
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight * 0.01,
                        ),
                         Text(
                           serviceDescription),
                        SizedBox(
                          height: SizeConfig.screenHeight * 0.02,
                        ),
                        Text(
                          'Product Details',
                          style: headingStyle(color1: kpurple),
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight * 0.01,
                        ),
                         Text(productDescription),
                        SizedBox(
                          height: SizeConfig.screenHeight * 0.02,
                        ),
                        Row(
                          children: [
                            Text(
                              'Package :',
                              style: headingStyle(color1: kgreen),
                            ),
                            SizedBox(
                              width: SizeConfig.screenWidth * 0.01,
                            ),
                            Text(
                              '£$productPrice',
                              style: headingStyle(),
                            )
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight * 0.02,
                        ),
                        Text(
                          'Additiong',
                          style: headingStyle(),
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight * 0.02,
                        ),
                        TextFormField(
                          decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight * 0.02,
                        ),
                        Row(
                          children: [
                            Text(
                              'Total :',
                              style: headingStyle(color1: kgreen),
                            ),
                            SizedBox(
                              width: SizeConfig.screenWidth * 0.01,
                            ),
                            Text(
                              '£79.00',
                              style: headingStyle(),
                            )
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight * 0.02,
                        ),
                        CustomButton(
                            text: 'Add to Card',
                            func: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CheckOutBill(),
                                  ));
                            },
                            bg: kpurple)
                      ],
                    );
                  },);
                }
                return Container();
              },
            )),
      ),
    );
  }
}

// child:Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Container(
// width: double.infinity,
// height: SizeConfig.screenHeight * 0.4,
// decoration: const BoxDecoration(
// image: DecorationImage(
// fit: BoxFit.fill,
// image: AssetImage('assets/product_img.jpg'))),
// ),
// SizedBox(
// height: SizeConfig.screenHeight * 0.02,
// ),
// Text(
// 'dfdf',
// style: headingStyle(color1: kpurple),
// ),
// SizedBox(
// height: SizeConfig.screenHeight * 0.02,
// ),
// Text(
// 'Service Details',
// style: headingStyle(color1: kpurple),
// ),
// SizedBox(
// height: SizeConfig.screenHeight * 0.01,
// ),
// const Text(
// 'Construction PAT Testing Deals - 3 Mth For 110v - 240v - 3 Phase'),
// SizedBox(
// height: SizeConfig.screenHeight * 0.02,
// ),
// Text(
// 'Product Details',
// style: headingStyle(color1: kpurple),
// ),
// SizedBox(
// height: SizeConfig.screenHeight * 0.01,
// ),
// const Text('PAT Deal 1 to 10'),
// SizedBox(
// height: SizeConfig.screenHeight * 0.02,
// ),
// Row(
// children: [
// Text(
// 'Package :',
// style: headingStyle(color1: kgreen),
// ),
// SizedBox(
// width: SizeConfig.screenWidth * 0.01,
// ),
// Text(
// '£79.00',
// style: headingStyle(),
// )
// ],
// ),
// SizedBox(
// height: SizeConfig.screenHeight * 0.02,
// ),
// Text(
// 'Additiong',
// style: headingStyle(),
// ),
// SizedBox(
// height: SizeConfig.screenHeight * 0.02,
// ),
// TextFormField(
// decoration:
// const InputDecoration(border: OutlineInputBorder()),
// ),
// SizedBox(
// height: SizeConfig.screenHeight * 0.02,
// ),
// Row(
// children: [
// Text(
// 'Total :',
// style: headingStyle(color1: kgreen),
// ),
// SizedBox(
// width: SizeConfig.screenWidth * 0.01,
// ),
// Text(
// '£79.00',
// style: headingStyle(),
// )
// ],
// ),
// SizedBox(
// height: SizeConfig.screenHeight * 0.02,
// ),
// CustomButton(
// text: 'Add to Card',
// func: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) => CheckOutBill(),
// ));
// },
// bg: kpurple)
// ],
// ))
