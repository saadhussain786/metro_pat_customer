import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:metro_pat_customer/Constants/size_config.dart';
import 'package:metro_pat_customer/Controller/add_customer_controller.dart';
import 'package:metro_pat_customer/Model/add_customer_model.dart';
import 'package:metro_pat_customer/Reusable_Widget/custom_text_field.dart';
import 'package:metro_pat_customer/Views/Mobile_views/auth/login.dart';
import 'package:metro_pat_customer/Views/Mobile_views/dashboard_screen.dart';

import '../../../Constants/constants.dart';
import '../../../Reusable_Widget/custom_button.dart';
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final usernameController=TextEditingController();
  final passwordController=TextEditingController();
  final confirmPasswordController=TextEditingController();
  final companyNameController=TextEditingController();
  final profileNameController=TextEditingController();
  final phoneController=TextEditingController();
  final emailController=TextEditingController();
  File? selectProfile;
  final formKey=GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth*0.05),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(image: const AssetImage('assets/metro_pat_logo.png'),width: SizeConfig.screenWidth*0.3,height: SizeConfig.screenHeight*0.1,fit: BoxFit.fill,),
                    SizedBox(height: SizeConfig.screenHeight*0.03,),
                    GestureDetector(
                      onTap: () async{
                        print('run');
                        XFile? pickImage=await ImagePicker().pickImage(source: ImageSource.gallery);
                        if(pickImage!=null)
                          {
                            File userImage=File(pickImage.path);
                            setState(() {
                              selectProfile=userImage;
                            });
                          }
                
                      },
                      child: CircleAvatar(
                        backgroundImage: selectProfile!=null?FileImage(selectProfile!):null,
                        radius: 80,
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight*0.02,),
                    CustomTextField(controller: profileNameController, label: "Enter profile name", isHide: false, icon: Icons.person),
                    SizedBox(height: SizeConfig.screenHeight*0.02,),
                    CustomTextField(controller: companyNameController, label: "Enter company", isHide: false, icon: Icons.location_city),
                    SizedBox(height: SizeConfig.screenHeight*0.02,),
                    CustomTextField(controller: emailController, label: "Enter Email", isHide: false, icon: Icons.mail),
                    SizedBox(height: SizeConfig.screenHeight*0.02,),
                    CustomTextField(controller: phoneController, label: "Enter phone", isHide: false, icon: Icons.phone,inputType: TextInputType.number,),
                    SizedBox(height: SizeConfig.screenHeight*0.02,),
                    CustomTextField(controller: usernameController, label: "Enter username", isHide: false, icon: Icons.alternate_email,inputType: TextInputType.number,),
                    SizedBox(height: SizeConfig.screenHeight*0.02,),
                    CustomTextField(controller: passwordController, label: "Enter password", isHide: false, icon: Icons.password),
                    SizedBox(height: SizeConfig.screenHeight*0.02,),
                    CustomTextField(controller: confirmPasswordController, label: "Enter confirm password", isHide: true, icon: Icons.password),
                    SizedBox(height: SizeConfig.screenHeight*0.03,),
                    CustomButton(text: 'Register', func: (){
                      if(formKey.currentState!.validate())
                        {
                          if(passwordController.text == confirmPasswordController.text)
                            {
                              setState(() {
                                isLoading = ! isLoading;
                              });
                              CustomerAdd.customerAdd(CustomerAddMddel(
                                userName: profileNameController.text,
                                userCompany: companyNameController.text,
                                userPhone: phoneController.text,
                                profileName: usernameController.text,
                                userEmail: emailController.text,
                                userPassword: passwordController.text,
                                confirmPassword: confirmPasswordController.text,
                              ), context,selectProfile);
                              setState(() {
                                isLoading = ! isLoading;
                              });
                            }
                          else
                            {
                              showAdaptiveDialog(context: context, builder: (context) {
                                return AlertDialog(content: SizedBox(
                                  height: SizeConfig.screenHeight*0.3,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Password not same',style: headingStyle(),),
                                      SizedBox(height: SizeConfig.screenHeight*0.02,),
                                      CustomButton(text: 'Ok', func: (){
                                        Navigator.pop(context);
                                      }, bg: Colors.green)
                                    ],
                                  ),
                                ),);
                              },);
                            }

                        }

                    }, bg: kgreen),
                    SizedBox(height: SizeConfig.screenHeight*0.02,),
                    TextButton(onPressed: (){
                      Navigator.push(context,  MaterialPageRoute(builder: (context) => const Login(),));
                    }, child: isLoading == false? const Text('Register Account | Sign Up',style: TextStyle(
                        color: kgreen
                    ),) : const CircularProgressIndicator())
                
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
