import 'package:freezed_annotation/freezed_annotation.dart';

part 'instant_approval_request.freezed.dart';
part 'instant_approval_request.g.dart';

@freezed
class InstantApprovalRequest with _$InstantApprovalRequest {
  const factory InstantApprovalRequest({
    dynamic appointmentId,
    int? queueId,
    int? doctorId,
    int? userId,
    String? doctorApproval,
    String? doctorApprovalDateTime,
    String? orderId,
    String? transactionStatus,
    String? orderDate,
    String? mobileNumber,
    String? userName,
    String? reqDate,
  }) = _InstantApprovalRequest;
  static const fromJsonFactory = _$InstantApprovalRequestFromJson;
  factory InstantApprovalRequest.fromJson(Map<String, dynamic> json) =>
      _$InstantApprovalRequestFromJson(json);
}
