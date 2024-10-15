import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:timesmedlite/ui/app/m_app.dart';
import 'package:timesmedlite/ui/components/show_message.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../routes/routes.dart';
import '../../prescription/order/model/lab_order_model.dart';

class MedicalRecordController
{
  List<LabTestDetails> details = [];

  Future<void> getOrderDetails(String orderId , BuildContext context)async{
    var response = await http.get(Uri.parse('https://tmsnew.timesmed.com/WebAPIP/GetuserlabOrderDetails?OrderId=$orderId'));
    if(response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body)['Data']['LabTestDetails'];
      details = data.map((e) => LabTestDetails.fromJson(e)).toList();
      // details = jsonDecode(response.body)['Data']['LabTestDetails'];
      print(details[0].toJson());
    }else{
      showMessage(context: context, message: 'Something went wrong');
    }

  }

  Future<void> orderLabTest(BuildContext context, String appointmentId ,String shippId ,String billingId ,String userId)async{
    var response = await http.post(Uri.parse('https://tmsnew.timesmed.com/WebAPIP/LabOrder?Shipp_id=$shippId&Billing_id=$billingId&Us_User_id=$userId&Appointment_id=$appointmentId'),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    }
    );
    if(response.statusCode == 200){
      print('order responce ${response.body}');
      context.push(Routes.orderSummary,{
        'OrderId': jsonDecode(response.body)['Order_id'].toString(),
        'txn': 'Cash on Delivery',
        'amount': jsonDecode(response.body)['Amt'],
        'islab': true
      });
      showMessage(context: context, message: 'Lab test ordered successfully');
    }else{
      showMessage(context: context, message: 'Lab test order failed');
    }
  }


}