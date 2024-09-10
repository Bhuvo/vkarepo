// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instant_approval_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InstantApprovalRequest _$$_InstantApprovalRequestFromJson(
        Map<String, dynamic> json) =>
    _$_InstantApprovalRequest(
      appointmentId: json['appointmentId'],
      queueId: json['queueId'] as int?,
      doctorId: json['doctorId'] as int?,
      userId: json['userId'] as int?,
      doctorApproval: json['doctorApproval'] as String?,
      doctorApprovalDateTime: json['doctorApprovalDateTime'] as String?,
      orderId: json['orderId'] as String?,
      transactionStatus: json['transactionStatus'] as String?,
      orderDate: json['orderDate'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      userName: json['userName'] as String?,
      reqDate: json['reqDate'] as String?,
    );

Map<String, dynamic> _$$_InstantApprovalRequestToJson(
        _$_InstantApprovalRequest instance) =>
    <String, dynamic>{
      'appointmentId': instance.appointmentId,
      'queueId': instance.queueId,
      'doctorId': instance.doctorId,
      'userId': instance.userId,
      'doctorApproval': instance.doctorApproval,
      'doctorApprovalDateTime': instance.doctorApprovalDateTime,
      'orderId': instance.orderId,
      'transactionStatus': instance.transactionStatus,
      'orderDate': instance.orderDate,
      'mobileNumber': instance.mobileNumber,
      'userName': instance.userName,
      'reqDate': instance.reqDate,
    };
