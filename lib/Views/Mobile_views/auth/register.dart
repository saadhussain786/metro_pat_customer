import 'package:flutter/material.dart';
import 'package:metro_pat_customer/Constants/size_config.dart';
import 'package:metro_pat_customer/Reusable_Widget/custom_text_field.dart';
import 'package:metro_pat_customer/Views/Mobile_views/auth/login.dart';
import 'package:metro_pat_customer/Views/Mobile_views/dashboard_screen.dart';

import '../../../Constants/constants.dart';
import '../../../Reusable_Widget/custom_button.dart';
import '../check_out_bill.dart';
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  final firstNameController=TextEditingController();
  final lastNameController=TextEditingController();
  final phoneController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth*0.05),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: const AssetImage('assets/metro_pat_logo.png'),width: SizeConfig.screenWidth*0.3,height: SizeConfig.screenHeight*0.1,fit: BoxFit.fill,),
                  SizedBox(height: SizeConfig.screenHeight*0.03,),
                  CustomTextField(controller: firstNameController, label: "First Name", isHide: false, icon: Icons.drive_file_rename_outline),
                  SizedBox(height: SizeConfig.screenHeight*0.02,),
                  CustomTextField(controller: lastNameController, label: "Last Name", isHide: false, icon: Icons.drive_file_rename_outline),
                  SizedBox(height: SizeConfig.screenHeight*0.02,),
                  CustomTextField(controller: phoneController, label: "Phone", isHide: false, icon: Icons.phone,inputType: TextInputType.number,),
                  SizedBox(height: SizeConfig.screenHeight*0.02,),
                  CustomTextField(controller: emailController, label: "Enter your email", isHide: false, icon: Icons.alternate_email),
                  SizedBox(height: SizeConfig.screenHeight*0.02,),
                  CustomTextField(controller: emailController, label: "Enter your password", isHide: true, icon: Icons.alternate_email),
                  SizedBox(height: SizeConfig.screenHeight*0.03,),
                  CustomButton(text: 'Register', func: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardScreen(),));
                  }, bg: kgreen),
                  SizedBox(height: SizeConfig.screenHeight*0.02,),
                  TextButton(onPressed: (){
                    Navigator.push(context,  MaterialPageRoute(builder: (context) => const Login(),));
                  }, child: const Text('Register Account | Sign Up',style: TextStyle(
                      color: kgreen
                  ),))
              
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
