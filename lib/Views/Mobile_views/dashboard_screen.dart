import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:metro_pat_customer/Constants/constants.dart';
import 'package:metro_pat_customer/Constants/size_config.dart';
import 'package:metro_pat_customer/Controller/get_categories_controller.dart';
import 'package:metro_pat_customer/Services/product_service.dart';
import 'package:metro_pat_customer/Views/Mobile_views/product_description.dart';
import 'package:metro_pat_customer/Views/Mobile_views/service_screen.dart';

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
            FutureBuilder(future: GetCategoryController.getCategory(),
                builder: (context, snapshot) {
                  if(ConnectionState.waiting==snapshot.connectionState)
                    {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  if(snapshot.hasError)
                    {
                      return const Center(
                        child: Text('Something went Wrong',style: TextStyle(
                          color: Colors.green,
                          fontSize: 18
                        ),),
                      );
                    }
                  if(snapshot.hasData)
                    {
                      Map data=jsonDecode(snapshot.data);
                      List category_data=data['data'];
                      debugPrint("$data");
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: category_data.length,
                        itemBuilder: (context, index) {
                          String categoryName=category_data[index]["name"];
                          String categoryId=category_data[index]["id"];
                          return DrawerOption(
                            lable: categoryName,
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceScreen(title: categoryName, categoryID: categoryId),));
                            },
                          );
                        },);
                    }
                  return Container();
                },)

          ],
        ),
      ),
      body: FutureBuilder(future: ProductService.FetchProduct(), builder: (context, snapshot) {
        if(ConnectionState.waiting==snapshot.connectionState)
        {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if(snapshot.hasError)
        {
          return const Center(
            child: Text('Something went Wrong',style: TextStyle(
                color: Colors.red,
                fontSize: 18
            ),),
          );
        }
        if(snapshot.hasData)
          {
            return LayoutBuilder(
              builder: (context, constraints) {
                final crossAxisCount = _calculateCrossAxisCount(constraints.maxWidth);
                Map products=jsonDecode(snapshot.data);
                List proudct_data=products['data'];
                if(proudct_data.isEmpty)
                  {
                    return Text('Nothing to Show');
                  }
                else {

                  return GridView.builder(

                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,

                    ),
                    itemCount: proudct_data.length,
                    itemBuilder: (BuildContext context, int index) {
                      String productName=proudct_data[index]['name'];
                      String productDes=proudct_data[index]['description'];
                      String productPrice=proudct_data[index]['price'];
                      String productImage=proudct_data[index]['image'];
                      String productId=proudct_data[index]['id'];

                      debugPrint(" this is pic: $productImage");

                      return Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AspectRatio(
                              aspectRatio: 16/6,
                              child: Image.network(
                                "http://patcrm.codetech.pk$productImage",
                                height: 110,
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '$productName',
                                    overflow: TextOverflow.ellipsis,
                                    style: headingStyle(),
                                  ),
                                  Text(
                                    '£ $productPrice',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  Text('$productDes',
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
                                print(productId);
                                Navigator.push(context, MaterialPageRoute(builder: (context) =>  ProductDescription(productId: productId,),));
                                // Handle button press
                              },
                              child: const Text('View Detail',style: TextStyle(
                                  color: kwhite
                              ),),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }

              },
            );
          }
        return Container();
      },),
    );
  }
}

