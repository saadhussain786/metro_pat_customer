import 'package:flutter/material.dart';
import 'package:metro_pat_customer/Constants/constants.dart';
import 'package:metro_pat_customer/Constants/size_config.dart';
import 'package:metro_pat_customer/Reusable_Widget/custom_text_field.dart';


class CheckOutBill extends StatefulWidget {
  @override
  _CheckOutBillState createState() => _CheckOutBillState();
}

class _CheckOutBillState extends State<CheckOutBill> {
  int _currentStep = 0;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final invoiveEmailController=TextEditingController();
  final companyNameController = TextEditingController();
  final customerNameController = TextEditingController();
  final phoneController = TextEditingController();
  final address1Controller = TextEditingController();
  final address2Controller = TextEditingController();
  final cityController = TextEditingController();
  final postalController = TextEditingController();
  final PoNoController = TextEditingController();
  final orderAddress1Controller = TextEditingController();
  final orderAddress2Controller = TextEditingController();
  final orderCityController = TextEditingController();
  final orderPostalController = TextEditingController();
  final orderContactController = TextEditingController();
  final orderSitePhoneController = TextEditingController();
  final orderEmailController = TextEditingController();
  final notesController=TextEditingController();
  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }



  Step buildStep(int stepNumber, String title,Widget widget) {
    return Step(
      title: Text(
        title,
        style: TextStyle(color: _currentStep == stepNumber ? kpurple : kgrey),
      ),
      content: widget,
      isActive: _currentStep == stepNumber,

    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beling Detail'),
      ),
      body: Form(
        key: _formKey,
        child: Stepper(
          onStepTapped: (int step) {
              setState(() {
                _currentStep = step;
              });

            // Change the active step when tapped

          },
          type: StepperType.horizontal,


          steps: [

            buildStep(0, 'Step 1', Column(
              children: [
                Text('Customer Detail',style: headingStyle(color1: kgreen),),
                SizedBox(
                  height: SizeConfig.screenHeight*0.02,
                ),

                CustomTextField(controller: invoiveEmailController, label: 'Customer/Invoive EmaiL', isHide: false, icon: Icons.drive_file_rename_outline),
                SizedBox(
                  height: SizeConfig.screenHeight*0.02,
                ),
                CustomTextField(controller: companyNameController, label: 'Company Name', isHide: false, icon: Icons.account_balance_rounded),
                SizedBox(
                  height: SizeConfig.screenHeight*0.02,
                ),
                CustomTextField(controller: customerNameController, label: 'Customer Name', isHide: false, icon: Icons.drive_file_rename_outline),
                SizedBox(
                  height: SizeConfig.screenHeight*0.02,
                ),
                CustomTextField(controller: phoneController, label: 'Phone', isHide: false, icon: Icons.phone),
                SizedBox(
                  height: SizeConfig.screenHeight*0.02,
                ),
                CustomTextField(controller: address1Controller, label: 'Address Line 1', isHide: false, icon: Icons.home),
                SizedBox(
                  height: SizeConfig.screenHeight*0.02,
                ),
                CustomTextField(controller: address2Controller, label: 'Address Line 2', isHide: false, icon: Icons.home),
                SizedBox(
                  height: SizeConfig.screenHeight*0.02,
                ),
                CustomTextField(controller: cityController, label: 'City', isHide: false, icon: Icons.location_city),
                SizedBox(
                  height: SizeConfig.screenHeight*0.02,
                ),
                CustomTextField(controller: postalController, label: 'Postal/Zip Code', isHide: false, icon: Icons.local_post_office_rounded)
              ],
            ),),
            buildStep(1, 'Step 1', Column(
              children: [
                Text('Order Detail',style: headingStyle(color1: kgreen),),

                SizedBox(
                  height: SizeConfig.screenHeight*0.02,
                ),
                CustomTextField(controller: PoNoController, label: 'Po. No.', isHide: false, icon: Icons.drive_file_rename_outline),
                SizedBox(
                  height: SizeConfig.screenHeight*0.02,
                ),
                CustomTextField(controller: orderAddress1Controller, label: 'Address Line 1', isHide: false, icon: Icons.account_balance_rounded),
                SizedBox(
                  height: SizeConfig.screenHeight*0.02,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: kgrey,
                          width: 2
                      )
                  ),
                  child: Row(
                    children: [
                      Text('${_selectedTime.hour} ${_selectedTime.minute} ${_selectedTime.period}',style: headingStyle(),),
                      SizedBox(width: SizeConfig.screenWidth*0.02,),
                      ElevatedButton(onPressed: (){
                        _selectTime(context);
                      }, child: const Text('Select Time'))
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight*0.02,
                ),
                CustomTextField(controller: orderAddress2Controller, label: 'Address Line 2', isHide: false, icon: Icons.drive_file_rename_outline),
                SizedBox(
                  height: SizeConfig.screenHeight*0.02,
                ),
                CustomTextField(controller: orderCityController, label: 'City', isHide: false, icon: Icons.phone),
                SizedBox(
                  height: SizeConfig.screenHeight*0.02,
                ),
                CustomTextField(controller: orderPostalController, label: 'Postal / Zip Code', isHide: false, icon: Icons.home),
                SizedBox(
                  height: SizeConfig.screenHeight*0.02,
                ),
                CustomTextField(controller: orderContactController, label: 'Contact Person', isHide: false, icon: Icons.home),
                SizedBox(
                  height: SizeConfig.screenHeight*0.02,
                ),
                CustomTextField(controller: orderSitePhoneController, label: 'Site Phone', isHide: false, icon: Icons.location_city),
                SizedBox(
                  height: SizeConfig.screenHeight*0.02,
                ),
                CustomTextField(controller: orderEmailController, label: 'PSite Email', isHide: false, icon: Icons.local_post_office_rounded),
                SizedBox(
                  height: SizeConfig.screenHeight*0.02,
                ),
                TextFormField(
                  maxLines: 3,
                  controller: notesController,
                  decoration: InputDecoration(
                    label: const Text('Notes'),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: kgrey,
                            width: 2
                        ),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: kgreen,
                            width: 2
                        ),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: kgrey,
                            width: 2
                        ),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: kred,
                            width: 2
                        ),
                        borderRadius: BorderRadius.circular(20)
                    ),
                  ),
                )
              ],
            ),),









          ],
          currentStep: _currentStep,
          onStepContinue: () {
              if (_currentStep < 1 ){
                setState(() {
                  _currentStep++;
                });
              } else {
                // Perform send data logic here


              }
            },

          onStepCancel: () {
            if (_currentStep > 0) {
              setState(() {
                _currentStep--;
              });
            }
          },
        ),
      ),
    );
  }
}


