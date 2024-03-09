import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:metro_pat_customer/Model/add_to_cart_model.dart';

class AddToCartController{

  static Future addToCart(AddToCartModel cart)async{
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=5dbbe2b177bc8f0c385c76552ca79c0e'
    };
    var request = http.Request('POST', Uri.parse('https://patcrm.codetech.pk/pat-crm/yoc/addtocart.php'));
    request.body = json.encode({
      "email": cart.userEmail!,
      "company_name": cart.userCompanyName!,
      "user_name": cart.userName!,
      "contact_no": cart.userContact!,
      "address_1": cart.siteAddress1!,
      "address_2": cart.siteAddress2!,
      "customer_city": cart.customerCity!,
      "postal_code": cart.customerPostalCode!,
      "is_account_customer": 4,
      "credit_limit": cart.creditLimit!,
      "payment_tenure": cart.paymentTenure!,
      "start_date": cart.startDate!,
      "start_time": cart.startTime!,
      "ph_no": cart.phoneNumber!,
      "site_address_1": cart.siteAddress1!,
      "site_address_2": cart.siteAddress2!,
      "site_city": cart.siteCity!,
      "site_zip_code": cart.sitePostalCode!,
      "site_contact": cart.siteContact!,
      "site_phone": cart.sitePhone!,
      "site_email": cart.siteEmail!,
      "note": cart.note!,
      "grosstotal": cart.grossTotal!,
      "login_user_id": cart.loginUserID,
      "cart": {
        "items": {
          "13_88": {
            "service_id": cart.serviceID,
            "service_name": cart.serviceName,
            "service_price": cart.servicePrice,
            "package_id": cart.packageID,
            "package_name": cart.packageName,
            "package_price": cart.packagePrice,
            "package_qty": cart.packageQuantity,
            "additional_qty": cart.additionalQuantity,
            "retest": cart.retest,
            "additional_amount": cart.additionalAmount,
            "total_qty": cart.totalQuantity,
            "total_amount": cart.totalAmount
          },
        },
        "gross_amount": cart.grossAmount,
        "vat_amount": cart.vatAmount,
        "net_amount": cart.netAmount
      }
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      return res;
    }
    else {
      debugPrint(response.reasonPhrase);
    }

  }

}