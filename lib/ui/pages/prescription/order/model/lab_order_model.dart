class LabOrderModel {
  List<Data>? data;
  String? responseCode;
  String? responseMessage;

  LabOrderModel({this.data, this.responseCode, this.responseMessage});

  LabOrderModel.fromJson(Map<String, dynamic> json) {
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    responseCode = json['ResponseCode'];
    responseMessage = json['ResponseMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['ResponseCode'] = this.responseCode;
    data['ResponseMessage'] = this.responseMessage;
    return data;
  }
}

class Data {
  int? orderId;
  int? orderAmount;
  String? orderDate;
  List<LabTestDetails>? labTestDetails;

  Data({this.orderId, this.orderAmount, this.labTestDetails});

  Data.fromJson(Map<String, dynamic> json) {
    orderId = json['OrderId'];
    orderAmount = json['order_amount'];
    orderDate = json['order_date'];
    if (json['LabTestDetails'] != null) {
      labTestDetails = <LabTestDetails>[];
      json['LabTestDetails'].forEach((v) {
        labTestDetails!.add(new LabTestDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['OrderId'] = this.orderId;
    data['order_amount'] = this.orderAmount;
    data['order_date'] = this.orderDate;
    if (this.labTestDetails != null) {
      data['LabTestDetails'] =
          this.labTestDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LabTestDetails {
  int? testCode;
  String? testname;
  int? testAmount;

  LabTestDetails({this.testCode, this.testname, this.testAmount});

  LabTestDetails.fromJson(Map<String, dynamic> json) {
    testCode = json['TestCode'];
    testname = json['Testname'];
    testAmount = json['TestAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TestCode'] = this.testCode;
    data['Testname'] = this.testname;
    data['TestAmount'] = this.testAmount;
    return data;
  }
}
