import 'package:flutter/material.dart';
import 'package:metro_pat_customer/Constants/constants.dart';
import 'package:metro_pat_customer/Constants/size_config.dart';
import 'package:metro_pat_customer/Reusable_Widget/custom_button.dart';
import 'package:metro_pat_customer/Views/Mobile_views/check_out_bill.dart';
class ProductDescription extends StatefulWidget {
  const ProductDescription({super.key});

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth*0.02,
          vertical: SizeConfig.screenHeight*0.002
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: SizeConfig.screenHeight*0.4,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/product_img.jpg')
                  )
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight*0.02,),
              Text('Service Details',style: headingStyle(color1: kpurple),),
            SizedBox(height: SizeConfig.screenHeight*0.01,),
              const Text('Construction PAT Testing Deals - 3 Mth For 110v - 240v - 3 Phase'),

              SizedBox(height: SizeConfig.screenHeight*0.02,),
              Text('Product Details',style: headingStyle(color1: kpurple),),
              SizedBox(height: SizeConfig.screenHeight*0.01,),
              const Text('PAT Deal 1 to 10'),
              SizedBox(height: SizeConfig.screenHeight*0.02,),
              Row(
                children: [
                  Text('Package :',style: headingStyle(color1: kgreen),),
                  SizedBox(width: SizeConfig.screenWidth*0.01,),
                  Text('£79.00',style: headingStyle(),)
                ],
              ),
              SizedBox(height: SizeConfig.screenHeight*0.02,),
              Text('Additiong',style: headingStyle(),),
              SizedBox(height: SizeConfig.screenHeight*0.02,),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight*0.02,),
              Row(
                children: [
                  Text('Total :',style: headingStyle(color1: kgreen),),
                  SizedBox(width: SizeConfig.screenWidth*0.01,),
                  Text('£79.00',style: headingStyle(),)
                ],
              ),
              SizedBox(height: SizeConfig.screenHeight*0.02,),
              CustomButton(text: 'Add to Card', func: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => CheckOutBill(),));
              }, bg: kpurple)

            ],
          ),
        ),
      ),
    );
  }
}

