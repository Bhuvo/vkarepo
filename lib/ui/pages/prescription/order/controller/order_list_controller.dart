import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../../../components/show_message.dart';
import '../model/lab_order_model.dart';

class OrderListController {

  LabOrderModel labOrderModel = LabOrderModel();
  Data details = Data();

  Future<void> getOrderDetails(String orderId , BuildContext context)async{
    print('order Id ${orderId}');
    var response = await http.get(Uri.parse('https://tmsnew.timesmed.com/WebAPIP/GetuserlabOrderDetails?OrderId=$orderId'));
    if(response.statusCode == 200) {
      print('detail json ${response.body}');
      details = Data.fromJson(jsonDecode(response.body)['Data']);
      print('length ${details.labTestDetails?.length}');
      // details = jsonDecode(response.body)['Data']['LabTestDetails'];

    }else{
     print('something went wrong in details ${response.body}');
    }
  }

  Future<void> getLabOrderList(context,String orderId) async {
    var response = await http.get(Uri.parse('https://tmsnew.timesmed.com/WebAPIP/GetuserlabOrders?UserId=$orderId'));
    if(response.statusCode == 200){
      labOrderModel= LabOrderModel.fromJson(jsonDecode(response.body));
      print('lab order ${response.body}');
    }else{
      print('something went wrong');
    }
  }
}