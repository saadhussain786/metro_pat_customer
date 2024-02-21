import 'package:flutter/material.dart';
import 'package:metro_pat_customer/Constants/size_config.dart';
import 'package:metro_pat_customer/Reusable_Widget/custom_text_field.dart';
import 'package:metro_pat_customer/Views/Mobile_views/auth/register.dart';
import 'package:metro_pat_customer/Views/Mobile_views/dashboard_screen.dart';

import '../../../Constants/constants.dart';
import '../../../Reusable_Widget/custom_button.dart';
import '../check_out_bill.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
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
                  CustomTextField(controller: emailController, label: "Enter your email", isHide: false, icon: Icons.alternate_email),
                  SizedBox(height: SizeConfig.screenHeight*0.02,),
                  CustomTextField(controller: emailController, label: "Enter your password", isHide: true, icon: Icons.alternate_email),
                  SizedBox(height: SizeConfig.screenHeight*0.03,),
                  CustomButton(text: 'Login', func: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardScreen(),));
                  }, bg: kgreen),
                  SizedBox(height: SizeConfig.screenHeight*0.02,),
                  TextButton(onPressed: (){
                    Navigator.push(context,  MaterialPageRoute(builder: (context) => const Register(),));
                  }, child: const Text('Already Account | Register',style: TextStyle(
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
