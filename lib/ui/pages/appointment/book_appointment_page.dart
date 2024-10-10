import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/model/appointment_response.dart';
import 'package:timesmedlite/model/patient.dart';
import 'package:timesmedlite/model/user.dart';
import 'package:timesmedlite/ui/bloc/patient/patient_bloc.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder_bloc.dart';
import 'package:timesmedlite/ui/components/expandable_column.dart';
import 'package:timesmedlite/ui/components/patient_bottom_navigation.dart';
import 'package:timesmedlite/ui/components/shimmer/shimmer_list.dart';
import 'package:timesmedlite/ui/components/user_tile.dart';
import 'package:timesmedlite/ui/pages/appointment/Clinical%20Visit/clinical_payment.dart';
import 'package:timesmedlite/ui/pages/auth/logout.dart';
import 'package:timesmedlite/ui/pages/onboard/add_family.dart';
import 'package:timesmedlite/ui/providers/patient_provider.dart';
import 'package:timesmedlite/ui/providers/user_provider.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/m_divider.dart';
import 'package:timesmedlite/utils/local_storage.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../di/dependency_injection.dart';
import '../../../model/appointment_data.dart';
import '../../components/waiting_dialog.dart';
import '../../widgets/widgets.dart';
import '../call/call_actions.dart';
import 'appointment_list_item.dart';
import 'bookings_dialog.dart';
import 'controller/controller.dart';

class BookAppointmentPage extends StatefulWidget {
  BookAppointmentPage({Key? key}) : super(key: key);

  @override
  State<BookAppointmentPage> createState() => _BookAppointmentPageState();
}

ApiBuilderBloc familyBloc = ApiBuilderBloc(path: '');

class _BookAppointmentPageState extends State<BookAppointmentPage> {
  /// Below code is for the user previous and upcoming appointments list api bloc
  // final apBloc = ApiBuilderBloc(
  //     path: 'Appointmentslist',
  //     query: {'User_id': LocalStorage.getUser().userId})
  //   ..add(const Load());
  late ApiBuilderBloc apBloc;
  late ApiBuilderBloc clApBloc;

  /// Below code is for the user saved patient list api bloc

  showAlertDialog(BuildContext context, int userId) {
    // set up the buttons
    Widget cancelButton = ElevatedButton(
      child: const Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget deleteButton = ElevatedButton(
      child: const Text("Delete"),
      onPressed: () async {
        if (userId == LocalStorage.getUser().userId) {
          Fluttertoast.showToast(
            msg: "Primary Account cannot be deleted...",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: MTheme.THEME_COLOR,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          Navigator.pop(context); // Close the dialog
        } else {
          final call = Injector().apiService.get(path: 'DeleteMemeber', query: {
            'User_id': userId.toString(),
          });

          final res = await showWaitingDialog(context: context, call: call);
          await Future.delayed(const Duration(milliseconds: 100), () async {
            setState(() {
              familyBloc.add(const Refresh());
            });
          });

          if (res?.body.message == "Member Account Removed...") {
            await Fluttertoast.showToast(
              msg: "Member Account Removed",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: MTheme.THEME_COLOR,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
          context.pop(); // Close the dialog
        }
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Delete Patient"),
      content: const Text("Are you sure you want to delete this patient?"),
      actions: [
        cancelButton,
        deleteButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  var patientData;

  _reload(int userId) {
    // reload the data here
    apBloc = ApiBuilderBloc(path: 'Appointmentslist', query: {
      'User_id': LocalStorage.getCursorPatient().userId.toString(),
      // 'User_id': patientData.userId,
    })..add(const Load());
    clApBloc = ApiBuilderBloc(path: 'GetPatientAppointments', query: {
      'user_id': LocalStorage.getCursorPatient().userId.toString(),
      // 'User_id': patientData.userId,
    })..add(const Load());

    setState(() {});
  }

  String? selectedOption;

  void getData() async{
    print('Get User Id ${LocalStorage.getCursorPatient().userId}'); //297488 //311214
    await controller.getClinicalAppointmentData(LocalStorage.getCursorPatient().userId);
   setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    print("init state print");
    getData();
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   patientData = context.watch<PatientBloc>().patient ?? const Patient();
    // });
    print(LocalStorage.getUser().userId);
    print(LocalStorage.getUser().userId.toString());
    print(LocalStorage.getUID());
    print("prints user id ${LocalStorage.getUser().userId} ,${LocalStorage.getUID()}");
    apBloc = ApiBuilderBloc(path: 'Appointmentslist', query: {
       'User_id': LocalStorage.getCursorPatient().userId,
      // 'User_id': context.watch<PatientBloc>().patient?.userId.toString()
      // 'User_id': patientData.userId,
      // 'User_id': LocalStorage.getCursorPatient().userId.toString(),
    })..add(const Load());
    clApBloc = ApiBuilderBloc(path: 'GetPatientAppointments',api2: true, query: {
      'user_id': LocalStorage.getCursorPatient().userId,
    })..add(const Load());
    familyBloc = ApiBuilderBloc(path: 'SavedPatientList', query: {
      'User_id': LocalStorage.getUser().userId,
    })
      ..add(const Load());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
  PatientClinicalAppointmentController controller = PatientClinicalAppointmentController();



  Widget switchBody(String status, String id){
    switch(status){
      case "A":
        return InkWell(
          onTap: () async {
            final result = await ClinicalPayment.pay(context, id, () async {
              getData();
            });
          },
          child: Container(
            padding: const EdgeInsets.all(5) + const EdgeInsets.symmetric(horizontal: 8),
            decoration:BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
                color: Colors.yellow.shade700, borderRadius: BorderRadius.circular(8)),
            child: const Text("Pay Fees", style: TextStyle(color: Colors.white, fontSize: 12),),
          ),
        );
      case 'F' :
        return Container(
          padding: const EdgeInsets.all(5),
          decoration:BoxDecoration(color: Colors.green.shade700, borderRadius: BorderRadius.circular(8)),
          child: const Text("Booked Successfully", style: TextStyle(color: Colors.white, fontSize: 12),),
        );
      case 'W':
        return Container(
          padding: const EdgeInsets.all(5),
          decoration:BoxDecoration(color: Colors.blue.shade700, borderRadius: BorderRadius.circular(8)),
          child: const Text("Waiting for Accept", style: TextStyle(color: Colors.white, fontSize: 12),),
        );
      case 'C':
        return Container(
          padding: const EdgeInsets.all(5),
          decoration:BoxDecoration(color: Colors.red.shade700, borderRadius: BorderRadius.circular(8)),
          child: const Text("Visit Completed", style: TextStyle(color: Colors.white, fontSize: 12),),
        );
      default:
        return Container(
          padding: const EdgeInsets.all(5),
          decoration:BoxDecoration(color: Colors.blue.shade700, borderRadius: BorderRadius.circular(8)),
          child: const Text("Waiting for Accept", style: TextStyle(color: Colors.white, fontSize: 12),),
        );
    }
  }
  @override
  Widget build(BuildContext context) {
    final data = context.watch<PatientBloc>().patient ?? const Patient();
    print(data);
    print(data.userId);
    print(data.firstName);
    print(data.id);
     // _reload(data.userId);
    // print("prints user id above");
    Size size = MediaQuery.of(context).size;
    return MScaffold(
      title: Text(Consts.BOOK_AN_APPOINTMENT.toUpperCase()),
      paddingTop: 160,
      appBarBottom: PatientProvider(
        data: data,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16) ,
          child: PopupMenuButton(
            offset: const Offset(0, 60),
            itemBuilder: (BuildContext context) {
              return const [
                PopupMenuItem(
                  value: 'Logout',
                  child: Text(
                    'Logout',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ];
            },
            onSelected: (v) {
              switch (v) {
                case 'Logout':
                  logOut(context);
                  break;
              }
            },
            child: UserTile(
              padding:EdgeInsets.all(4),
              avatarRadius: 28,
              caption: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const Text(
                  //   'Type: Secondary',
                  //   style: TextStyle(color: Colors.white70),
                  // ),
                  Text('Age: ${data.age}',
                      style: const TextStyle(color: Colors.white70)),
                ],
              ),
              trailing: OutlinedButton(
                child: SizedBox(
                  width: size.width * 0.3,
                 // height: 40,
                  child: Row(
                    children: [
                      const FaIcon(FontAwesomeIcons.solidCalendarCheck),
                      SizedBox(
                        width: size.width * 0.032,
                      ),
                      Flexible(
                        child: AutoSizeText(
                          Consts.BOOK_AN_APPOINTMENT,
                          style: TextStyle(fontSize: size.height * 0.016),
                        ),
                      )
                    ],
                  ),
                ),
                onPressed: () {
                  print(LocalStorage.getUser().userId);
                  showDialog(
                    context: context,
                    builder: (c) => const BookingsDialog(),
                  );
                  // showDialog(
                  //   context: context,
                  //   builder: (BuildContext dialogContext) {
                  //     String? selectedOption = 'clinical';
                  //
                  //     return StatefulBuilder(
                  //       builder: (context, setState) {
                  //         return AlertDialog(
                  //           contentPadding: const EdgeInsets.all(16),
                  //           shape: RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(8),
                  //           ),
                  //           title: const Padding(
                  //             padding: EdgeInsets.all(16),
                  //             child: Text(
                  //               'Appointment Type',
                  //               style: TextStyle(
                  //                 color: Colors.black,
                  //                 // Replace with your desired text color
                  //                 fontWeight: FontWeight.bold,
                  //               ),
                  //             ),
                  //           ),
                  //           content: Column(
                  //             mainAxisSize: MainAxisSize.min,
                  //             children: [
                  //               ListTile(
                  //                 title: const Text('Clinical Visit'),
                  //                 leading: Radio<String>(
                  //                   value: 'clinical',
                  //                   groupValue: selectedOption,
                  //                   onChanged: (String? value) {
                  //                     setState(() {
                  //                       selectedOption = value;
                  //                     });
                  //                   },
                  //                 ),
                  //               ),
                  //               ListTile(
                  //                 title: const Text('Online'),
                  //                 leading: Radio<String>(
                  //                   value: 'online',
                  //                   groupValue: selectedOption,
                  //                   onChanged: (String? value) {
                  //                     setState(() {
                  //                       selectedOption = value;
                  //                     });
                  //                   },
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //           actions: [
                  //             ElevatedButton(
                  //               onPressed: () {
                  //                 Navigator.of(dialogContext).pop();
                  //                 if (selectedOption == 'online') {
                  //                   context.push(Routes.bookAppointmentPage);
                  //                 } else {
                  //                   context.push(Routes.bookAppointmentPage);
                  //                 }
                  //               },
                  //               style: ElevatedButton.styleFrom(
                  //                 shape: RoundedRectangleBorder(
                  //                   borderRadius: BorderRadius.circular(8),
                  //                 ),
                  //               ),
                  //               child: const Text('Submit'),
                  //             ),
                  //           ],
                  //         );
                  //       },
                  //     );
                  //   },
                  // );
                },
              ),
            ),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          apBloc.add(const Refresh());
          clApBloc.add(const Refresh());
          familyBloc.add(const Refresh());
          getData();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment : CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8),
                    child: Text(
                      'Upcoming Clinical Appointments',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  ExpandableColumn(
                    min: 3,
                    children: List.generate(controller.upcoming.length ?? 0, (i) {
                      final item = controller.upcoming[i];
                      print("XXXX$item");
                      return UserProvider(
                          data: User(
                              fullName: '${controller.upcoming[i].doctorName}',
                              image:'${controller.upcoming[i].doctorImage}' ),
                          child: AppointmentListItem(
                            contextfromBookAppointmentPage: context,
                            data: item,
                            // data: AppointmentData(doctorName: item.doctorName),
                            upcoming: false,
                            child: switchBody(item.confirmStatus ?? '', controller.upcoming[i].id.toString()),
                          )
                      );
                    }),
                  ),
                ],),
              Column(
                crossAxisAlignment : CrossAxisAlignment.start,
                children: [
                const SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 8),
                  child: Text(
                    'Previous Clinical Appointments',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                ExpandableColumn(
                  min: 3,
                  children: List.generate(controller.previous.length ?? 0, (i) {
                    final item = controller.previous[i];
                    print("XXXX$item");
                    // return Text('${item.toJson()}');
                    return UserProvider(
                        data: User(
                            fullName: '${controller.previous[i].doctorName}',
                            image: 'https://www.timesmed.com/images/doc-imgs/55bccd5aa6c01c74389ad3e3be60fed0afa2067a2aef6.jpg'),
                        child: AppointmentListItem(
                          contextfromBookAppointmentPage: context,
                          data : item,
                          // data: AppointmentData(doctorName: item.doctorName,id: item.id, ),
                          upcoming: false,
                          child: switchBody(item.confirmStatus ?? '', controller.previous[i].id.toString()),
                        )
                    );
                  }),
                ),
              ],),
              MDivider(),
              BlocProvider(
                create: (_) => apBloc,
                child: ApiBuilder<AppointmentResponse>(
                  fromJson: AppointmentResponse.fromJsonFactory,
                  loading: const ShimmerList(
                    height: 60,
                  ),
                  customBuilder: (list, load) {
                    final data = list.first;
                    final previous = data.previous ?? [];
                    final upcoming = data.upcoming ?? [];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 32,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Text(
                            // Consts.UPCOMING_APPOINTMENT,
                            'Upcoming Video Consultation Appointments',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                        ExpandableColumn(
                          min: 3,
                          children: List.generate(upcoming.length, (i) {
                            final item = upcoming[i];
                            print("XXXX$item");
                            return UserProvider(
                                data: User(
                                    fullName: '${item.doctorName}',
                                    image: '${item.doctorImage}'),
                                child: AppointmentListItem(
                                  contextfromBookAppointmentPage: context,
                                  data: item,
                                  upcoming: true,
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    decoration:BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(8)),
                                    child: Text("Booked Successfully", style: TextStyle(color: Colors.white),),
                                  ),
                                ));
                          }),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Text(
                            // Consts.PREVIOUS_APPOINTMENT,
                            'Previous Video Consultation Appointments',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                        ExpandableColumn(
                          min: 3,
                          children: List.generate(previous.length, (i) {
                            print("asjdflasjdf     ${previous[i]}");
                            final item = previous[i];
                            return UserProvider(
                                data: User(
                                    fullName: '${item.doctorName}',
                                    image: '${item.doctorImage}'),
                                child: AppointmentListItem(
                                  contextfromBookAppointmentPage: context,
                                  data: item,
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    decoration:BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(8)),
                                    child: Text("Visit Completed", style: TextStyle(color: Colors.white),),
                                  ),
                                ));
                          }),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 16,
                              ),
                              Text(
                                Consts.CHOOSE_ACCOUNT,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              const Spacer(),
                              TextButton(
                                  onPressed: () async {
                                    await context.push(Routes.addFamily);
                                    print("bloc refreshed");
                                    familyBloc.add(const Refresh());
                                    print("bloc refreshed already");
                                  },
                                  child: Row(
                                    children: const [
                                      Icon(
                                        Icons.add_circle_rounded,
                                        color: MTheme.ICON_COLOR,
                                        size: 16,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        Consts.ADD_PATIENT,
                                      )
                                    ],
                                  )),
                              const SizedBox(
                                width: 8,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              BlocConsumer<ApiBuilderBloc, ApiBuilderState>(
                  listener: (context, state) {
                    log(state.toString());
                  },
                  bloc: familyBloc,
                  builder: (context, snapshot) {
                    return BlocProvider(
                      key: ValueKey(familyBloc),
                      create: (_) => familyBloc,
                      child: ApiBuilder<Patient>(
                        fromJson: Patient.fromJsonFactory,
                        customBuilder: (list, load) {
                          return SizedBox(
                            height: size.height * 0.1,
                            child: ListView.builder(
                              itemCount: list.length,
                              scrollDirection: Axis.horizontal,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              itemBuilder: (c, i) {
                                final data = list[i];
                                if (context
                                            .read<PatientBloc>()
                                            .patient
                                            ?.userId ==
                                        data.userId ||
                                    context.read<PatientBloc>().patient?.id ==
                                        data.userId) {
                                  context.read<PatientBloc>().add(Select(data));
                                }
                                return PatientProvider(
                                  data: data,
                                  child: MListTile(
                                    onTap: () async {
                                      context
                                          .read<PatientBloc>()
                                          .add(Select(data));
                                      await Future.delayed(
                                          const Duration(milliseconds: 100));
                                      apBloc.add(UpdateQuery({
                                        'User_id': data.userId,
                                      }));
                                      clApBloc.add(UpdateQuery({
                                        'user_id': data.userId,
                                      }));
                                      familyBloc.add(UpdateQuery({
                                        'user_id': LocalStorage.getUser().userId,
                                      }));
                                      await Future.delayed(
                                          const Duration(milliseconds: 100));
                                      apBloc.add(const Refresh());
                                      await Future.delayed(
                                          const Duration(milliseconds: 100));
                                      clApBloc.add(const Refresh());
                                      await Future.delayed(
                                          const Duration(milliseconds: 100));
                                      LocalStorage.setJson(LocalStorage.CURSOR_USER, data.toJson());

                                      familyBloc.add(const Refresh());
                                      await Future.delayed(
                                          const Duration(milliseconds: 100));
                                      print('coming ontap ${data.userId}');
                                     // await controller.getClinicalAppointmentData(data.userId);
                                      getData();
                                      setState(() {});
                                    },
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          data.userId ==
                                                  LocalStorage.getUser().userId
                                              ? Container(
                                                  padding: EdgeInsets.only(
                                                    top: size.height * 0.03,
                                                  ),
                                                )
                                              : Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  // crossAxisAlignment: CrossAxisAlignment.end,
                                                  children: [
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.15,
                                                    ),
                                                    ClipOval(
                                                      child: Material(
                                                        elevation: 2,
                                                        color: Colors.white,
                                                        child: InkWell(
                                                          splashColor: MTheme
                                                              .THEME_COLOR,
                                                          // Splash color
                                                          onTap: () async {
                                                            final updatedPatient =
                                                                await context.push(
                                                                    Routes
                                                                        .addFamilyEdit,
                                                                    {
                                                                  "userName": data
                                                                      .patientName
                                                                      .toString(),
                                                                  "mobileNumber": data
                                                                      .mobile
                                                                      .toString(),
                                                                  "age": data
                                                                      .age
                                                                      .toString(),
                                                                  "userId": data
                                                                      .userId
                                                                      .toString(),
                                                                  "familyMemberId": data
                                                                      .familyMemberId
                                                                      .toString(),
                                                                  "relationShipName": data
                                                                      .relationName
                                                                      .toString(),
                                                                  "gender": data
                                                                      .gender
                                                                      .toString(),
                                                                  "primaryMobile": LocalStorage
                                                                          .getUser()
                                                                      .phoneNumber
                                                                      .toString(),
                                                                  "primaryUserId":
                                                                      LocalStorage
                                                                              .getUID()
                                                                          .toString(),
                                                                  "DOB": data
                                                                      .dob
                                                                      .toString(),
                                                                });
                                                            if (context
                                                                        .read<
                                                                            PatientBloc>()
                                                                        .patient
                                                                        ?.userId
                                                                        .toString() ==
                                                                    data.userId
                                                                        .toString() &&
                                                                mounted) {
                                                              context
                                                                  .read<
                                                                      PatientBloc>()
                                                                  .add(Select(
                                                                      updatedPatient));
                                                            }

                                                            await Future
                                                                .delayed(
                                                              const Duration(
                                                                  milliseconds:
                                                                      300),
                                                            );
                                                            familyBloc.add(
                                                                const Refresh());
                                                          },
                                                          child: SizedBox(
                                                            width: size.width *
                                                                0.05,
                                                            height:
                                                                size.height *
                                                                    0.032,
                                                            child: Icon(
                                                              Icons.edit,
                                                              color: Colors
                                                                  .black38,
                                                              size: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.025,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    ClipOval(
                                                      child: Material(
                                                        elevation: 2,
                                                        color: Colors.white,
                                                        child: InkWell(
                                                          splashColor:
                                                              Colors.red,
                                                          // Splash color
                                                          onTap: () async {
                                                            showAlertDialog(
                                                                context,
                                                                data.userId);
                                                          },
                                                          child: SizedBox(
                                                            width: size.width *
                                                                0.095,
                                                            height:
                                                                size.height *
                                                                    0.032,
                                                            child: Icon(
                                                              Icons.delete,
                                                              color: Colors
                                                                  .red.shade300,
                                                              size: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.025,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                          Row(
                                            children: [
                                              Text(
                                                data.patientName ?? 'Name',
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: MTheme.THEME_COLOR),
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                'Age: ${data.age ?? ''}',
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            data.mobile ?? '',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    );
                  }),
              const SizedBox(
                height: 32,
              )
            ],
          ),
        ),
      ),
      bottom: const PatientBottomNavigation(),
    );
  }
}

class AppointmentDetails extends StatefulWidget {
  final int? patID;
  final int? docId;
  final int? apId;
  const AppointmentDetails({super.key, this.patID, this.docId, this.apId});

  @override
  State<AppointmentDetails> createState() => _AppointmentDetailsState();
}

class _AppointmentDetailsState extends State<AppointmentDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:  CallActions(
        appointmentid: widget.apId,
        docID: widget.docId ?? 0,
        patID: widget.patID ?? 0,
        fab: GlobalKey<ExpandableFabState>(),
      ),
    );
  }
}

