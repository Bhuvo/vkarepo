// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instant_approval_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InstantApprovalRequestImpl _$$InstantApprovalRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$InstantApprovalRequestImpl(
      appointmentId: json['appointmentId'],
      queueId: (json['queueId'] as num?)?.toInt(),
      doctorId: (json['doctorId'] as num?)?.toInt(),
      userId: (json['userId'] as num?)?.toInt(),
      doctorApproval: json['doctorApproval'] as String?,
      doctorApprovalDateTime: json['doctorApprovalDateTime'] as String?,
      orderId: json['orderId'] as String?,
      transactionStatus: json['transactionStatus'] as String?,
      orderDate: json['orderDate'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      userName: json['userName'] as String?,
      reqDate: json['reqDate'] as String?,
    );

Map<String, dynamic> _$$InstantApprovalRequestImplToJson(
        _$InstantApprovalRequestImpl instance) =>
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
