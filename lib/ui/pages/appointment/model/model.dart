class PatientClinicalAppointmentModel {
  int? responseCode;
  String? responseMessage;
  List<Data>? data;

  PatientClinicalAppointmentModel(
      {this.responseCode, this.responseMessage, this.data});

  PatientClinicalAppointmentModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['ResponseCode'];
    responseMessage = json['ResponseMessage'];
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ResponseCode'] = this.responseCode;
    data['ResponseMessage'] = this.responseMessage;
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? userId;
  String? userName;
  int? doctorId;
  String? doctorName;
  int? appointmentId;

  Data(
      {this.userId,
        this.userName,
        this.doctorId,
        this.doctorName,
        this.appointmentId});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['User_id'];
    userName = json['User_Name'];
    doctorId = json['Doctor_id'];
    doctorName = json['Doctor_Name'];
    appointmentId = json['Appointment_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['User_id'] = this.userId;
    data['User_Name'] = this.userName;
    data['Doctor_id'] = this.doctorId;
    data['Doctor_Name'] = this.doctorName;
    data['Appointment_id'] = this.appointmentId;
    return data;
  }
}
