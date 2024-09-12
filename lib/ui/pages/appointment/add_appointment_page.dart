import 'dart:convert';

import 'package:cc_avenue/cc_avenue.dart';
import 'package:firebase_notifications_handler/firebase_notifications_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/di/dependency_injection.dart';
import 'package:timesmedlite/facade/api_facade.dart';
import 'package:timesmedlite/model/instant_doctor.dart';
import 'package:timesmedlite/model/patient.dart';
import 'package:timesmedlite/ui/bloc/patient/patient_bloc.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder_bloc.dart';
import 'package:timesmedlite/ui/components/shimmer/drop_down_shimmer.dart';
import 'package:timesmedlite/ui/components/show_message.dart';
import 'package:timesmedlite/ui/components/user_tile.dart';
import 'package:timesmedlite/ui/providers/patient_provider.dart';
import 'package:timesmedlite/ui/providers/user_provider.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/date_utils.dart';
import 'package:timesmedlite/utils/local_storage.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';
import 'package:timesmedlite/utils/size_utils.dart';
import 'package:timesmedlite/ui/pages/appointment/call_waiting_dialog.dart';
import 'package:http/http.dart' as http;

import '../../components/waiting_dialog.dart';
import '../../theme/theme.dart';
import 'book_appointment_page.dart';

class AddAppointmentPage extends StatefulWidget {
  const AddAppointmentPage({Key? key}) : super(key: key);

  @override
  State<AddAppointmentPage> createState() => _AddAppointmentPageState();
}

class _AddAppointmentPageState extends State<AddAppointmentPage> {
  final GlobalKey<FormState> form = GlobalKey();
  String type = Consts.INSTANT;
  Map<String, dynamic>? doctor, special, lang;
  String symptoms = '';
  var doctorSpecialityID, doctorSpecialityName;
  var doctorGender, doctorQualification, doctorTotalExperience, doctorFee;

  final TextEditingController _postYourQuery = TextEditingController();

  late final TextEditingController _amountController = TextEditingController();
  late Razorpay _razorpay;
  var doctorClinicalFee;

  Future<void> showAlert(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.15,
            height: MediaQuery.of(context).size.height * 0.05,
            child: Column(
              children: const [
                Text('Please wait...'),
                CupertinoActivityIndicator(),
              ],
            ),
          ),
        );
      },
    );

    await Future.delayed(Duration(seconds: 5));
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();

    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  /// The below code is to perform razor pay payment gateway
  void openCheckout(amount, orderId) async {
    Razorpay razorpay = Razorpay();
    var options = {
      "key": "rzp_test_UQu4zdljD2dohm",
      // "key": "rzp_test_2sbsCAvXWlYz0N",
      "amount": amount * 100,
      "name": "TimesMed",
      "description": "payment",
      'order_id': orderId,
      //'id': responseOrderId,
      'send_sms_hash': true,
      // 'retry': {'enabled': true, 'max_count': 1},
      "prefill": {"contact": "9677268979", "email": "wecare@timesmed.com"},
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
    final res = await showWaitingDialog(context: context, call: call);
    if (res?.body.Rmessage == 'Payment Success') {
      Navigator.push(
          context, MaterialPageRoute(builder: (c) => BookAppointmentPage()));
    }
  }

  void handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: ${response.code} - ${response.message}",
        timeInSecForIosWeb: 4);
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET:  + ${response.walletName}",
        timeInSecForIosWeb: 4);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final ApiBuilderBloc langBloc = ApiBuilderBloc(path: 'LanguageList');
    final p = context.read<PatientBloc>().patient ?? const Patient();
    return MScaffold(
      title: Text(
        Consts.SEARCH_DOCTORS,
        style: TextStyle(
          fontSize: size.height * 0.0165,
        ),
      ),
      paddingTop: 120,
      appBarBottom: Padding(
        padding: const EdgeInsets.all(8),
        child: PatientProvider(
          data: p,
          child: const UserTile(
            avatarRadius: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Form(
            key: form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MSearchDown<Map<String, dynamic>>(
                  label: 'Search by Doctor Name',
                  suffixIcon: const Icon(CupertinoIcons.search),
                  onSearched: (String d) async {
                    final res = await Injector()
                        .apiService
                        .get(path: 'DoctorName_Search', query: {'term': d});
                    List<Map<String, dynamic>> list = [];
                    if (res.isSuccessful) {
                      print("Sucesssssssssssssssssss");
                      if (res.body?.data is List) {
                        for (var e in res.body!.data) {
                          list.add(e as Map<String, dynamic>);
                        }
                      }
                    }
                    return list;
                  },
                  labelKey: 'Doctor_Name',
                  subTitleKey: 'SubCategory_Name',
                  onChanged: (d) {
                    setState(() {
                      doctor = d;
                      // print("printing doctor");
                      // print(doctor!["SubCategory_id"].toString());
                      // doctorSpecialityID = doctor!["SubCategory_id"].toString();
                      // print(doctor!["SubCategory_Name"].toString());
                      // doctorSpecialityName =
                      //     doctor!["SubCategory_Name"].toString();
                    });
                  },
                ),
                SizedBox(
                  height: size.height * 0.0172,
                ),
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                          Border.all(color: Theme.of(context).dividerColor)),
                  padding: EdgeInsets.all(
                    size.width * 0.018,
                  ),
                  child: Text(
                    'OR',
                    style: TextStyle(fontSize: size.height * 0.0165),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.0172,
                ),
                MSearchDown<Map<String, dynamic>>(
                  label: 'Speciality',
                  hint: 'Select the Specialization',
                  labelKey: 'SubCategory_Name',
                  onSearched: (String d) async {
                    final res = await Injector()
                        .apiService
                        .get(path: 'SpecialitySearch', query: {'Keyword': d});
                    List<Map<String, dynamic>> list = [];
                    if (res.isSuccessful) {
                      if (res.body?.data is List) {
                        for (var e in res.body!.data) {
                          list.add(e as Map<String, dynamic>);
                        }
                      }
                    }
                    return list;
                  },
                  onChanged: (d) {
                    setState(() {
                      special = d;
                      // print(special);
                      // doctorSpecialityName = special;
                      // print(doctorSpecialityID);
                      // print(doctorSpecialityName);
                    });
                  },
                ),
                SizedBox(
                  height: size.height * 0.0172,
                ),
                MTextField(
                  label: 'Symptoms',
                  value: symptoms,
                  onChanged: (d) {
                    symptoms = d;
                  },
                ),
                SizedBox(
                  height: size.height * 0.0172,
                ),
                BlocProvider(
                  create: (_) => langBloc..add(const Load()),
                  child: ApiBuilder(
                    loading: const DropDownShimmer(
                      label: 'Language',
                    ),
                    jsonBuilder: (data, load) {
                      //return DropDownShimmer(label: 'Select Patient',);
                      return MDialogDown<Map<String, dynamic>>(
                          items: data,
                          label: 'Language',
                          onChanged: (d) {
                            setState(() {
                              lang = d;
                            });
                          },
                          value: lang,
                          labelKey: 'Language_Name');
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * 0.0172,
                ),
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                          Border.all(color: Theme.of(context).dividerColor)),
                  padding: EdgeInsets.all(
                    size.width * 0.018,
                  ),
                  child: Text(
                    'OR',
                    style: TextStyle(fontSize: size.height * 0.0165),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.025,
                ),
                TextField(
                  controller: _postYourQuery,
                  textInputAction: TextInputAction.newline,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    labelText: "Post your query",
                    hintText: "Help Request",
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () async {
                        /// below code is to post users query to ask the backend team to assign a doctor based on the user request
                        if (_postYourQuery.text.isEmpty) {
                          await Fluttertoast.showToast(
                            msg: "Please enter your query before posting",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: size.height * 0.018,
                          );
                        } else {
                          print("${p.userId} - printing user id bro");
                          final call = Injector()
                              .apiService
                              .get(path: 'HelpRequest', query: {
                            // 'User_id': LocalStorage.getUser().userId.toString(),
                            'User_id': p.userId.toString(),
                            'HelpMsg': _postYourQuery.text,
                          });
                          final res = await showWaitingDialog(
                              context: context, call: call);
                          if (res?.body.message == "Inserted") {
                            await Fluttertoast.showToast(
                              msg:
                                  "Your Query has been inserted wait until we assign a doctor based on your Query",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: size.height * 0.018,
                            );
                            context.pop();
                          }
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.036),
                  child: MRadioChip<String>(
                    items: const [
                      MRadioItem(value: Consts.INSTANT, label: Consts.INSTANT),
                      MRadioItem(
                          value: Consts.SCHEDULE, label: Consts.SCHEDULE),
                    ],
                    type: MRadioChipType.radio,
                    value: type,
                    onChanged: (d) {
                      setState(() {
                        type = d;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * 0.0172,
                ),
              ],
            ),
          ),
        ),
      ),
      bottom: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: context.getWPercent(10), vertical: size.height * 0.016),
        child: OutlinedButton(
          child: Text(
            'Book Now',
            style: TextStyle(
              fontSize: size.height * 0.022,
            ),
          ),
          onPressed: () async {
            print(LocalStorage.getUser().id);
            print("user id");
            switch (type) {
              case Consts.INSTANT:
                if (doctor != null) {
                  print("Printing doctor");
                  print(doctor);
                  print(doctor!["Doctor_id"].toString());
                  print('$doctor');

                  /// below code is for the queue request api bloc
                  var queryParameters = {
                    'Doctor_id': doctor!["Doctor_id"].toString(),
                    // 'User_id': LocalStorage.getUser().userId.toString(),
                    'User_id': p.userId.toString(),
                  };
                  final uri = Uri.parse(
                          "http://tmsnew.timesmed.com/WebAPIP/QueueRequest")
                      .replace(
                          queryParameters: queryParameters = {
                    'Doctor_id': doctor!["Doctor_id"].toString(),
                    // 'User_id': LocalStorage.getUser().userId.toString(),
                    'User_id': p.userId.toString(),
                  });
                  final response1 = await http.get(uri);
                  print('Uri 1 ${response1.body}');
                  final uri2 = Uri.parse(
                          "https://api.timesmed.com/WebAPI2/getOnlineFeeData")
                      .replace(
                          queryParameters: queryParameters = {
                    'DoctorId': doctor!["Doctor_id"].toString(),
                  });
                  final response2 = await http.get(uri2);
                  print('Uri 2 ${response2.body}');
                  var jsonResponse = jsonDecode(response2.body);
                  print(jsonResponse[0]["eclinicVideo"].toString());
                  setState(() {
                    if (jsonResponse[0]["eclinicVideo"] == "") {
                      doctorClinicalFee = "250";
                    } else {
                      doctorClinicalFee =
                          jsonResponse[0]["eclinicVideo"].toString();
                    }
                  });
                  print(doctorClinicalFee);
                  print("http response above");
                  if (response1.statusCode == 200) {
                    showDialog(
                        context: context,
                        builder: (c) => CallWaitingDialog(
                              contextfromBookAppointmentPage: context,
                              docId: doctor!["Doctor_id"].toString(),
                              // userId: LocalStorage.getUser().userId.toString(),
                              userId: p.userId.toString(),
                              amount: doctorClinicalFee,

                              /// need to ask about amount params
                              speciality: doctor!["SubCategory_id"].toString(),
                            ),
                        barrierDismissible: false);
                  }

                  // final call =
                  //     Injector().apiService.rawGet(path: 'QueueRequest', query: {
                  //   // 'User_id': LocalStorage.getUser().id,
                  //   'User_id': "3158",
                  //   // 'Doctor_id': doctor?['Doctor_id'],
                  //   'Doctor_id': "178936",
                  // });
                  //
                  // final reqRes =
                  //     await ApiFacade.callApi(context: context, call: call);
                  // print(reqRes);
                  // if (reqRes != null) {
                  //
                  // }
                } else {
                  final res =
                      await context.push(Routes.instantAppointmentDoctorsList, {
                    'lang': lang?['Language_Id'].toString(),
                    'speciality': special?['SubCategory_id'].toString()
                  });
                  print("came back from that page");
                  if (res is InstantDoctor) {
                    print("http response inside");
                    print(res);
                    var queryParameters = {
                      'Doctor_id': res.Doctor_id.toString(),
                      // 'User_id': LocalStorage.getUser().userId.toString(),
                      'User_id': p.userId.toString(),
                    };
                    final uri = Uri.parse(
                            "http://tmsnew.timesmed.com/WebAPIP/QueueRequest")
                        .replace(
                            queryParameters: queryParameters = {
                      'Doctor_id': res.Doctor_id.toString(),
                      // 'User_id': LocalStorage.getUser().userId.toString(),
                      'User_id': p.userId.toString(),
                    });
                    final response = await http.get(uri);
                    print(response.body);
                    print("http response above");
                    print(special?['SubCategory_id'].toString());
                    final uri3 = Uri.parse(
                            "https://api.timesmed.com/WebAPI2/GetDoctorDetails")
                        .replace(
                            queryParameters: queryParameters = {
                      'DoctorId': res.Doctor_id.toString(),
                    });
                    final response3 = await http.get(uri3);
                    print(response3.body);
                    var jsonResponse = jsonDecode(response3.body);
                    print(jsonResponse["Data"]["SubCategory_id"].toString());
                    setState(() {
                      doctorSpecialityID =
                          jsonResponse["Data"]["SubCategory_id"].toString();
                    });
                    print(doctorSpecialityID);
                    print("printing id");
                    if (response.statusCode == 200) {
                      showDialog(
                          context: context,
                          builder: (c) => CallWaitingDialog(
                                docId: res.Doctor_id.toString(),
                                // userId: LocalStorage.getUser().userId.toString(),
                                userId: p.userId.toString(),
                                amount: res.Eclinic_Charges.toString(),
                                speciality: doctorSpecialityID.toString(),

                                /// need to ask about speciality id
                                contextfromBookAppointmentPage: context,
                              ),
                          barrierDismissible: false);
                    }
                  }
                }
                break;
              case Consts.SCHEDULE:
                print(doctor);
                print("prints doc");
                if (doctor != null) {
                  await showAlert(context);
                  print(doctor);
                  print("im here at 1");
                  print(doctor!["Doctor_id"].toString());
                  var queryParameters;
                  final uri2 = Uri.parse(
                          "https://api.timesmed.com/WebAPI2/getOnlineFeeData")
                      .replace(
                          queryParameters: queryParameters = {
                    'DoctorId': doctor!["Doctor_id"].toString(),
                  });
                  final response2 = await http.get(uri2);
                  print(response2.body);
                  var jsonResponseToGetFee = jsonDecode(response2.body);
                  print(jsonResponseToGetFee[0]["eclinicVideo"].toString());
                  print("im here at GetDoctorDetails");
                  final uri3 = Uri.parse(
                          "https://api.timesmed.com/WebAPI2/GetDoctorDetails")
                      .replace(
                          queryParameters: queryParameters = {
                    'DoctorId': doctor!["Doctor_id"].toString(),
                  });
                  final response3 = await http.get(uri3);
                  print("im here at jsonResponse");
                  var jsonResponse = jsonDecode(response3.body);
                  final uri4 = Uri.parse(
                          "https://tmsnew.timesmed.com/WebAPIP/DoctorDetails")
                      .replace(
                          queryParameters: queryParameters = {
                    'Doctor_id': doctor!["Doctor_id"].toString(),
                  });
                  final response4 = await http.get(uri4);
                  var jsonResponse1 = jsonDecode(response4.body);
                  setState(() {
                    doctorGender = jsonResponse["Data"]["Gender"].toString();
                    doctorQualification =
                        jsonResponse1["Data"][0]["Qualification"].toString();
                    doctorTotalExperience = jsonResponse["Data"]
                            ["DoctorExperience_Years"]
                        .toString();
                    doctorFee =
                        jsonResponseToGetFee[0]["eclinicVideo"].toString();
                  });
                  print(doctor);
                  print("printing doctor details");
                  final reqRes1 =
                      await context.push(Routes.scheduleAppointmentPatient, {
                    'instantDoctor': InstantDoctor.fromJson(doctor!),
                    'doctorGender': doctorGender,
                    'doctorQualification': doctorQualification,
                    'doctorTotalExperience': doctorTotalExperience,
                    'doctorFee': doctorFee,
                  });
                  print("below is reqres");
                  print(reqRes1);
                  print("iam empty");
                  // print(MDateUtils.dateToFormattedDate(
                  //     reqRes1.toIso8601String(), true,
                  //     generic: true));

                  print(reqRes1);
                  var checkPrint = MDateUtils.dateToFormattedDate(
                      reqRes1.toIso8601String(), true,
                      generic: true);
                  var checkPrint1 =
                      MDateUtils.getFormattedDate(reqRes1.toIso8601String());
                  print(checkPrint);
                  print(checkPrint1);
                  print("printing datetime bro");

                  /// below code is for booking time slot for schedule date and time api bloc
                  final call = Injector()
                      .apiService
                      .rawGet(path: 'BookThisTime', query: {
                    // 'User_id': LocalStorage.getUser().userId.toString(),
                    'User_id': p.userId.toString(),
                    'Doctor_id': doctor!["Doctor_id"].toString(),
                    // 'DateParam': MDateUtils.dateToFormattedDate(
                    //     reqRes1.toIso8601String(), true,
                    //     generic: true),
                    'DateParam':
                        MDateUtils.getFormattedDate(reqRes1.toIso8601String()),
                    'TimeParam': MDateUtils.dateToHourMinuteTimezone(
                        reqRes1.toIso8601String())
                  });
                  final reqRes2 =
                      await ApiFacade.callApi(context: context, call: call);
                  print(reqRes2);
                  if (reqRes2 != null) {
                    print("im here at 6----");
                    final apId = reqRes2.body['Appointment_id'];
                    print("apId - $apId");
                    final call1 = Injector()
                        .apiService
                        .rawPost(path: 'ConfirmAppointment', query: {
                      // 'User_id': LocalStorage.getUser().userId.toString(),
                      'User_id': p.userId.toString(),
                      'Doctor_id': doctor!["Doctor_id"].toString(),
                      'Description': symptoms,
                      'Appointment_id': apId
                    });
                    print("im here at 6----over");
                    final reqRes3 =
                        await ApiFacade.callApi(context: context, call: call1);
                    print("im here at 7-----");
                    final map = reqRes3!.body;
                    print(map);
                    final orderId = reqRes3!.body["Data"];
                    final amount = reqRes3!.body["Order_Amount"];
                    print("$orderId - $amount");
                    print("Razor payment gateway starts here");
                    openCheckout(amount, orderId);
                  }
                } else {
                  if (special == null) {
                    Fluttertoast.showToast(
                        msg:
                            "Please select a Doctor or Specialization for Schedule",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.redAccent,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  } else {
                    print("im here at 2");
                    print(lang?['Language_Id'].toString());
                    print(special?['SubCategory_Name'].toString());
                    print("prints language and speciality above");
                    final res = await context.push(Routes.scheduleDoctorsList, {
                      'lang': lang?['Language_Id'].toString(),
                      'speciality': special?['SubCategory_Name'].toString()
                    });
                    print("printing res");
                    if (res is InstantDoctor) {
                      print("im here at 3");
                      final dateTime = await context
                          .push(Routes.scheduleAppointmentPatient, {
                        'instantDoctor': res,
                        'doctorGender': res.Gender.toString(),
                        'doctorQualification':
                            res.Doctor_Qualification.toString(),
                        'doctorTotalExperience':
                            res.Doctor_ExperienceYears.toString(),
                        'doctorFee': res.Fee.toString(),
                      });
                      if (dateTime is DateTime) {
                        print("im here at 4");
                        print(dateTime);
                        print("printing datetime bro");

                        print(dateTime);
                        var checkPrint = MDateUtils.dateToFormattedDate(
                            dateTime.toIso8601String(), true,
                            generic: true);
                        var checkPrint1 = MDateUtils.getFormattedDate(
                            dateTime.toIso8601String());
                        print(checkPrint);
                        print(checkPrint1);
                        print("printing datetime bro1111111");

                        /// below code is for booking time slot for schedule date and time api bloc
                        final call = Injector()
                            .apiService
                            .rawGet(path: 'BookThisTime', query: {
                          // 'User_id': LocalStorage.getUser().userId.toString(),
                          'User_id': p.userId.toString(),
                          'Doctor_id': res.Doctor_id,
                          // 'DateParam': MDateUtils.dateToFormattedDate(
                          //     dateTime.toIso8601String(), true,
                          //     generic: true),
                          'DateParam': MDateUtils.getFormattedDate(
                              dateTime.toIso8601String()),
                          'TimeParam': MDateUtils.dateToHourMinuteTimezone(
                              dateTime.toIso8601String())
                        });
                        final reqRes = await ApiFacade.callApi(
                            context: context, call: call);
                        print("im here at 5");
                        if (reqRes != null) {
                          print("im here at 6--");
                          final apId = reqRes.body['Appointment_id'];

                          /// below code is to ConfirmAppointment api bloc
                          final call1 = Injector()
                              .apiService
                              .rawPost(path: 'ConfirmAppointment', query: {
                            // 'User_id': LocalStorage.getUser().userId.toString(),
                            'User_id': p.userId.toString(),
                            'Doctor_id': res.Doctor_id,
                            'Description': symptoms,
                            'Appointment_id': apId
                          });
                          final reqRes1 = await ApiFacade.callApi(
                              context: context, call: call1);
                          print("im here at 7---");
                          final map = reqRes1!.body;
                          print("req body ");
                          // -------------------------------------- chcking
                          // var paymenturl = AWSURL +
                          //     'api/IspinPaymentOrderid/' +
                          //     uispin.toString() +
                          //     '/' +
                          //     int.parse(pay.toString() + "00").toString();
                          // // var paymenturl = AWSURL +
                          // //     'api/IspinPaymentOrderid/' +
                          // //     uispin.toString() +
                          // //     '/' +
                          // //     int.parse("100").toString();
                          // final response = await http.get(paymenturl);
                          // final responseJson = json.decode(response.body);
                          //
                          // order_id = responseJson['id'];

                          //  testing key
                          // Razorpay Test Key : rzp_test_TY9QbhRA0AgMK5
                          // Razorpay Secret Key : xuDvLwatyyf5XarlKemGUHXz
                          print("Razor payment gateway starts here");
                          // openCheckout();
                        }
                      }
                    }
                  }
                }
                break;
            }
            //context.push(Routes.inQueuePage);
          },
        ),
      ),
    );
  }
}
