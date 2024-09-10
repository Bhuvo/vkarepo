import 'dart:async';
import 'dart:convert';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/service/razorpay/razorpay_service.dart';
import 'package:timesmedlite/ui/pages/appointment/in_queue_page.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';
import 'package:timesmedlite/utils/string_utils.dart';

import '../../../di/dependency_injection.dart';
import '../../components/api_builder/api_builder.dart';
import '../../components/api_builder/api_builder_bloc.dart';
import '../../components/waiting_dialog.dart';
import 'package:http/http.dart' as http;

import '../../routes/routes.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:timesmedlite/ui/components/file_upload.dart';
import 'package:timesmedlite/ui/components/patient_bottom_navigation.dart';
import 'package:timesmedlite/ui/components/user_info.dart';

import 'package:timesmedlite/ui/pages/call/incoming_call_dialog.dart';
import 'package:timesmedlite/ui/theme/theme.dart';

import '../../../model/waiting_room_details.dart';
import '../../../utils/local_storage.dart';
import 'book_appointment_page.dart';

class CallWaitingDialog extends StatefulWidget {
  final contextfromBookAppointmentPage;
  final docId, userId, amount, speciality;

  const CallWaitingDialog({
    Key? key,
    required this.contextfromBookAppointmentPage,
    required this.docId,
    required this.userId,
    required this.amount,
    this.speciality,
  }) : super(key: key);

  @override
  State<CallWaitingDialog> createState() => _CallWaitingDialogState();
}

class _CallWaitingDialogState extends State<CallWaitingDialog> {
  late final ApiBuilderBloc bloc;

  // late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    print("print user id bro ${widget.userId}");
    bloc = ApiBuilderBloc(
        path: 'CheckApproval',
        query: {
          'Doctor_id': widget.docId,
          'User_id': widget.userId,
        },
        raw: true);
  }

  @override
  void dispose() {
    super.dispose();
    //_razorpay.clear();
  }

  Future<void> handlePaymentSuccess(PaymentSuccessResponse response) async {
    print(
        "SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSUUUUUUUUUUUUUUUUUUUUCCCCCCCCCCCCCCCCCCCEEEEEEEEEEEEEEESSSSSSSSSSSSSSSSSSSSS");
    Fluttertoast.showToast(
      msg: "PAYMENT SUCCESS",
      timeInSecForIosWeb: 4,
    );
    print(
        "response.paymentId:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::${response.paymentId}");
    print(
        "response.orderId:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::${response.orderId}");
    print(
        "response.signature:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::${response.signature}");

    final call = Injector().apiService.get(path: 'Razorpay', query: {
      'Res_Order_id': response.orderId.toString(),
      'Res_PaymentID': response.paymentId.toString(),
      'Res_Signature': response.signature.toString()
    });
    final res = await showWaitingDialog(
        context: widget.contextfromBookAppointmentPage, call: call);
    if (res?.body.Rmessage == 'Payment Success') {
      print(
          "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ${res?.body.Rkey}");
      Navigator.push(
          widget.contextfromBookAppointmentPage,
          MaterialPageRoute(
              builder: (c) => InQueuePageAfterPaymentDone(
                    transID: res?.body.Rkey.toString(),
                  )));
    }
  }

  void handlePaymentError(PaymentFailureResponse response) {
    print(
        "EEEEEEEEEEEEEEEEEEERRRRRRRRRRRRRRRRRRRRRRRRROOOOOOOOOOOOOOOOOOOOOOOOOORRRRRRRRRRRRRRRRRRRRRRRRRRRRR");
    Fluttertoast.showToast(
        msg: "ERROR: ${response.code} - ${response.message}",
        timeInSecForIosWeb: 4);
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    print(
        "SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSUUUUUUUUUUUUUUUUUUUUCCCCCCCCCCCCCCCCCCCEEEEEEEEEEEEEEESSSSSSSSSSSSSSSSSSSSS");
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET:  + ${response.walletName}",
        timeInSecForIosWeb: 4);
  }

  Padding _getLoadingIndicator() {
    return Padding(
        child: Container(
            child: CircularProgressIndicator(strokeWidth: 3),
            width: 32,
            height: 32),
        padding: EdgeInsets.only(bottom: 16));
  }

  Widget _getHeading(context) {
    return Padding(
        child: Text(
          'Please wait …',
          style: TextStyle(color: Colors.white, fontSize: 16),
          textAlign: TextAlign.center,
        ),
        padding: EdgeInsets.only(bottom: 4));
  }

  openCheckout() async {
    print("amount from previous page ${widget.amount}");
    Razorpay razorpay = Razorpay();
    var queryParameters = {
      'Doctor_id': widget.docId,
      'User_id': widget.userId,
      'Amount': widget.amount,
      'speciality': widget.speciality,
    };
    final uri =
        Uri.parse("http://tmsnew.timesmed.com/WebAPIP/ProceedModeAPI").replace(
            queryParameters: queryParameters = {
      'Doctor_id': widget.docId,
      'User_id': widget.userId,
      'Amount': widget.amount,
      'speciality': widget.speciality,
    });
    http.Response response = await http.get(uri);
    print(response.body);
    var jsonResponse = jsonDecode(response.body);
    print(jsonResponse);
    if (response.statusCode == 200) {
      print(response.statusCode);

      var responseAmount = jsonResponse["OrderAmount"].toString();
      var responseOrderId = jsonResponse["Order_id"].toString();

      //final res = await RazorpayService.create().order(currency: 'INR', amount: (int.tryParse(responseAmount) ?? 0) * 100);

      print(
          '::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::$responseOrderId');

      // var authn =
      //     'Basic ${base64Encode(utf8.encode('rzp_test_UQu4zdljD2dohm:NEp6W4SFs3COR3Uw9pJBzOGU'))}';
      //
      // var headers = {
      //   'content-type': 'application/json',
      //   'Authorization': authn,
      // };
      // var data =
      //     '{ "amount": $responseAmount, "currency": "INR"}'; // as per my experience the receipt doesn't play any role in helping you generate a certain pattern in your Order ID!!
      // var url = Uri.parse('https://api.razorpay.com/v1/orders');
      // var res = await http.post(url, headers: headers, body: data);
      //
      // var jsonResponse1 = jsonDecode(res.body);
      //
      // var orderId = jsonResponse1["id"];
      // var amount = jsonResponse1["amount"];
      // var OID = 'order_$responseOrderId';

      // print(res.statusCode);
      print(
          "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO");

      if (response.statusCode != 200) {
        const Center(child: CircularProgressIndicator());
      } else {
        var options = {
          "key": "rzp_test_UQu4zdljD2dohm",
          //"amount": amount * 100,
          "amount": (num.tryParse(responseAmount) ?? 0) * 100,
          "name": "TimesMed",
          "description": "payment",
          'order_id': responseOrderId,
          //'timeout': 60,
          //'order_id': orderId,
          //'id': responseOrderId,
          'send_sms_hash': true,
          // 'retry': {'enabled': true, 'max_count': 1},
          "prefill": {
            "contact": "8610346904",
            "email": "subash1327@icloud.com"
          },
          "external": {
            "wallets": ["paytm"]
          },
        };
        try {
          razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
          razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
          razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
          razorpay.open(options);
        } catch (e) {
          print(e.toString());
          debugPrint('Error: e');
        }
      }
    }
  }

  ///The purpose of the below method is to to get the data from CheckApproval API and return the data as a stream with interval of 5 seconds
  Stream<http.Response> GetRCode({doctorID, patientID}) async* {
    var queryParameters;
    final uri =
        Uri.parse("http://tmsnew.timesmed.com/WebAPIP/CheckApproval").replace(
            queryParameters: queryParameters = {
      'Doctor_id': doctorID,
      'User_id': patientID,
    });
    yield* Stream.periodic(const Duration(seconds: 5), (_) {
      return http.get(uri);
    }).asyncMap((event) async => await event);
  }

  CountDownController _controller = CountDownController();
  bool _isPause = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<http.Response>(
        stream: GetRCode(
            doctorID: widget.docId,
            patientID: LocalStorage.getUID().toString()),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return buildMDialog(context);
          } else {
            if (snapshot.data?.body.toString().split('"')[3].toString() ==
                "0") {
              // initTimer(const Duration(seconds: Consts.WAITING_DURATION));
              return buildMDialog(context);
            } else if (snapshot.data?.body
                    .toString()
                    .split('"')[3]
                    .toString() ==
                "2") {
              return buildMDialogWhichisShowWhenDoctprRejectsTheRequest(
                  context);
            } else {
              buildMDialog(context);
              openCheckout().then((value) => {context.pop()});
              return const SizedBox.shrink();
            }
          }
        });
  }

  MDialog buildMDialogWhichisShowWhenDoctprRejectsTheRequest(
      BuildContext context) {
    return MDialog(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Text(
              'Doctor Rejected your Request.Please try after sometime',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.caption,
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Close"),
            ),
          ],
        ),
      ),
    );
  }

  WillPopScope buildMDialog(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await Fluttertoast.showToast(
            msg: "Please wait for doctor approval",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: MTheme.THEME_COLOR,
            textColor: Colors.white,
            fontSize: 16.0);
        return false;
      },
      child: MDialog(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              // CupertinoActivityIndicator(),
              // SizedBox(
              //   height: 16,
              // ),
              Center(
                child: CircularCountDownTimer(
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.height / 3,
                  duration: 120,
                  fillColor: Colors.amber,
                  controller: _controller,
                  backgroundColor: Colors.white54,
                  strokeWidth: 5.0,
                  strokeCap: StrokeCap.round,
                  isTimerTextShown: true,
                  isReverse: true,
                  ringColor: Colors.white,
                  onComplete: () {
                    context.pop();
                  },
                  textStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.035,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.016,
              ),
              Text(
                'Kindly Wait for few Minutes until Doctor Accepts your Consultation Request. Please do not press the back button',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.0175,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Duration current = const Duration(seconds: Consts.WAITING_DURATION);

  initTimer(Duration length,
      {Duration interval = const Duration(seconds: 1),
      Duration decrement = const Duration(seconds: 1)}) {
    current = length;
    Timer.periodic(interval, (timer) {
      if (current.inSeconds == 0) {
        timer.cancel();
        context.popDialog(Consts.TIMEOUT);
      } else {
        if (mounted) {
          setState(() {
            current =
                Duration(seconds: current.inSeconds - decrement.inSeconds);
            ApiBuilderBloc(
                    path: 'CheckApproval',
                    query: {
                      'Doctor_id': widget.docId.toString(),
                      'User_id': widget.docId.toString(),
                    },
                    raw: true)
                .add(UpdateQuery(
              {
                'Doctor_id': widget.docId.toString(),
                'User_id': widget.docId.toString(),
              },
            ));
          });
        } else {
          timer.cancel();
        }
      }
    });
  }
}

class InQueuePageAfterPaymentDone extends StatefulWidget {
  final String? transID;

  const InQueuePageAfterPaymentDone({Key? key, this.transID}) : super(key: key);

  @override
  State<InQueuePageAfterPaymentDone> createState() =>
      _InQueuePageAfterPaymentDoneState();
}

class _InQueuePageAfterPaymentDoneState
    extends State<InQueuePageAfterPaymentDone> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context
          .replace(Routes.inQueuePage, {'transactionKey': '${widget.transID}'});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MScaffold();
  }
}
