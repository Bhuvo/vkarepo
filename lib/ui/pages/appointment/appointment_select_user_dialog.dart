import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/di/dependency_injection.dart';
import 'package:timesmedlite/facade/api_facade.dart';
import 'package:timesmedlite/model/user.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder_bloc.dart';
import 'package:timesmedlite/ui/components/user_info.dart';
import 'package:timesmedlite/ui/components/user_tile.dart';
import 'package:timesmedlite/ui/providers/patient_provider.dart';
import 'package:timesmedlite/ui/providers/user_provider.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/date_utils.dart';
import 'package:timesmedlite/utils/local_storage.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';
import 'package:timesmedlite/utils/size_utils.dart';

import '../../../model/patient.dart';
import '../../components/show_message.dart';
import '../../components/waiting_dialog.dart';
import '../../routes/routes.dart';
import '../patient_registration/patient_register.dart';

class AppointmentSelectUserDialog extends StatefulWidget {
  final dynamic hospitalId;
  final DateTime date;

  const AppointmentSelectUserDialog(
      {Key? key, required this.date, this.hospitalId})
      : super(key: key);

  @override
  State<AppointmentSelectUserDialog> createState() =>
      _AppointmentSelectUserDialogState();
}

class _AppointmentSelectUserDialogState
    extends State<AppointmentSelectUserDialog>
    with SingleTickerProviderStateMixin {
  late TabController tab;
  static const tabs = [
    Consts.EXISTING_USER,
    Consts.NEW_USER,
  ];
  String gender = "";

  TextEditingController complaintsController = TextEditingController();

  @override
  void initState() {
    tab = TabController(length: tabs.length, vsync: this);
    if(data?.doctorId == null) data = data.copyWith(doctorId: LocalStorage.getUser().id);
    print(widget.date);
    print("prints hospitalId ${widget.hospitalId}");
    super.initState();
  }

  User? user;
  Patient data = Patient();
  final GlobalKey<FormState> form = GlobalKey();

  @override
  Widget build(BuildContext context) {
    print(user);
    print("prints user");
    return MDialog(
      title: Row(
        children: [
          const Text(Consts.SELECT_USER),
          const Spacer(),
          IconButton(
              onPressed: () {
                context.popDialog();
              },
              icon: const Icon(Icons.close_rounded))
        ],
      ),
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
          child: Column(
            children: [
              MListTile(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                color: MTheme.THEME_COLOR.withOpacity(0.05),
                background: Theme.of(context).cardColor,
                child: UserProvider(
                  data: LocalStorage.getUser(),
                  child: UserTile(
                    caption: Row(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        UserInfo(
                          Info.custom,
                          icon: Icons.date_range_rounded,
                          lable: MDateUtils.dateToFormattedDate(
                              widget.date.toIso8601String(), true),
                          textColor: MTheme.THEME_COLOR,
                          textSize: 12,
                          iconSize: 14,
                        ),
                        UserInfo(
                          Info.custom,
                          icon: CupertinoIcons.clock,
                          lable: MDateUtils.dateToHourMinute(
                              widget.date.toIso8601String()),
                          textColor: MTheme.THEME_COLOR,
                          textSize: 12,
                          iconSize: 14,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: MTabBar(
                  tab,
                  tabs,
                  scrollable: false,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                //height: context.width,
                child: TabBarView(controller: tab, children: [
                  ExistingUserTab(
                    onSelect: (d) {
                      setState(() {
                        data = d;
                      });
                    },
                  ),
                  // SingleChildScrollView(
                  //   padding: const EdgeInsets.symmetric(horizontal: 12),
                  //   child: Column(
                  //     children: [
                  //       const SizedBox(
                  //         height: 8,
                  //       ),
                  //       const MTextField(
                  //         label: 'Username',
                  //       ),
                  //       const SizedBox(
                  //         height: 8,
                  //       ),
                  //       const MTextField(
                  //         label: 'Email Address',
                  //         type: MInputType.email,
                  //       ),
                  //       const SizedBox(
                  //         height: 8,
                  //       ),
                  //       const MPhoneField(
                  //         label: 'Mobile Number',
                  //         maxLines: 10,
                  //       ),
                  //       const SizedBox(
                  //         height: 8,
                  //       ),
                  //       const MTextField(
                  //         label: 'Complaints',
                  //       ),
                  //       MRadioChip<String>(
                  //         labelStyle: Theme.of(context).textTheme.bodySmall,
                  //         value: gender,
                  //         onChanged: (d) {
                  //           setState(() {
                  //             gender = d;
                  //           });
                  //         },
                  //         items: const [
                  //           MRadioItem(
                  //               value: 'Male',
                  //               icon: FontAwesomeIcons.person,
                  //               label: 'Male'),
                  //           MRadioItem(
                  //               value: 'Female',
                  //               icon: FontAwesomeIcons.personDress,
                  //               label: 'Female'),
                  //         ],
                  //         label: 'Gender',
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                      child: Form(
                        key: form,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MTextField(
                              label: 'Patient Registration Number',
                              value: data.regNo,
                              type: MInputType.numeric,
                              onChanged: (d) {
                                data = data.copyWith(regNo: d);
                              },
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            MTextField(
                              label: 'First Name',
                              value: data.firstName,
                              onChanged: (d) {
                                data = data.copyWith(firstName: d);
                              },
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            MTextField(
                              label: 'Last Name',
                              value: data.lastName,
                              onChanged: (d) {
                                data = data.copyWith(lastName: d);
                              },
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            MTextField(
                              label: 'Age',
                              value: data.age,
                              type: MInputType.numeric,
                              onChanged: (d) {
                                data = data.copyWith(age: d);
                              },
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            MRadioChip<String>(
                              value: data.gender,
                              onChanged: (d) {
                                setState(() {
                                  data = data.copyWith(gender: d);
                                });
                              },
                              items: const [
                                MRadioItem(
                                    value: 'Male',
                                    icon: FontAwesomeIcons.person,
                                    label: 'Male'),
                                MRadioItem(
                                    value: 'Female',
                                    icon: FontAwesomeIcons.personDress,
                                    label: 'Female'),
                              ],
                              label: 'Gender',
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            MTextField(
                              label: 'Phone Number',
                              value: data.mobile,
                              type: MInputType.phone,
                              onChanged: (d) {
                                data = data.copyWith(phone: d);
                              },
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            MTextField(
                              label: 'WhatsApp Number',
                              value: data.whatsapp,
                              type: MInputType.phone,
                              onChanged: (d) {
                                data = data.copyWith(whatsapp: d);
                              },
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            MTextField(
                              label: 'Mail Id',
                              value: data.email,
                              type: MInputType.email,
                              onChanged: (d) {
                                data = data.copyWith(email: d);
                              },
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            MTextField(
                              label: 'Password',
                              type: MInputType.password,
                              value: data.password,
                              onChanged: (d) {
                                data = data.copyWith(password: d);
                              },
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Target INR',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: MTextField(
                                    label: 'From',
                                    type: MInputType.decimal,
                                    value: data.inrFrom,
                                    onChanged: (d) {
                                      data = data.copyWith(inrFrom: d);
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: MTextField(
                                    label: 'To',
                                    type: MInputType.decimal,
                                    value: data.inrTo,
                                    onChanged: (d) {
                                      data = data.copyWith(inrTo: d);
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),

                            // Row(
                            //   children: [
                            //     Expanded(
                            //         child: OutlinedButton(
                            //           onPressed: () {
                            //             context.pop();
                            //           },
                            //           child: const Text(
                            //             'Close',
                            //             style: TextStyle(color: Colors.white),
                            //           ),
                            //           style: ButtonStyle(
                            //               backgroundColor:
                            //               MaterialStateProperty.all(Colors.red)),
                            //         )),
                            //     const SizedBox(
                            //       width: 16,
                            //     ),
                            //     Expanded(
                            //         child: OutlinedButton(
                            //             onPressed: () async {
                            //               if (form.currentState!.validate()) {
                            //                 showWaitingDialog(context: context);
                            //                 final res = await Injector()
                            //                     .apiService
                            //                     .register(
                            //                     path: 'VKA_PatientRegistration',
                            //                     query: data.toJson());
                            //                 context.pop();
                            //
                            //                 if (res.isSuccessful) {
                            //                   if (res.body?.code == '1') {
                            //                     context.pop(data);
                            //                   }
                            //                   showMessage(
                            //                       context: context,
                            //                       message: res.body?.message ?? '');
                            //                 } else {
                            //                   showMessage(
                            //                       context: context,
                            //                       message:
                            //                       'Request failed, Please check your connection.');
                            //                 }
                            //               }
                            //             },
                            //             child: const Text('Save'))),
                            //   ],
                            // )
                          ],
                        ),
                      ),
                    ),
                  )
                ]),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                width: double.maxFinite,
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    book(complaintsController.text);
                  },
                  child: const Text('Book Appointment'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future book(String complaints) async {
    print("api clicked outside");
    if (data.id != null) {
      print("api clicked ${LocalStorage.getUID()}");
      // final call = Injector()
      //     .timesmedService
      //     .get2(
      //     // path: 'DoctorBookAppointment',
      //     path: 'VkaDoctorBookAppointment',
      //     query: {
      //   'UserId': user?.id,
      //   'Type_Flag': 'H',
      //   'Hospital_id': widget.hospitalId,
      //   'DoctorId': LocalStorage.getUID(),
      //   'desc': complaints,
      //   'Time': MDateUtils.dateToHourMinuteQuery(widget.date.toIso8601String()),
      //   'Date': MDateUtils.dateToQueryDate(widget.date.toIso8601String()),
      // });
      final call = Injector()
          .timesmedService
          .get2(
          path: 'VkaDoctorBookAppointment',
          query: {
            // .get2(path: 'DoctorBookAppointment', query: {
            'UserId': data.id,
            //  user?.userId,
            'Type_Flag': 'H',
            'OnlineFlag':false,
            'Hospital_id': widget.hospitalId,
            // 'DoctorId': LocalStorage.getUID(),
            'DoctorId': LocalStorage.getUID(),
            'desc': 'complaints',
            'Time': MDateUtils
                .dateToHourMinuteQuery(
                widget.date.toIso8601String()),
            'Date': MDateUtils
                .dateToQueryDate(
                widget.date.toIso8601String()),
          });
      final res = await ApiFacade.callApi(context: context, call: call);
      print(res);
      print(res?.error);
      print(res?.body);
      print(res?.statusCode);
      if (res != null) {
        context.popDialog(true);
        context.pop(data);
      }
    }
    else {
      print('coming inside save');
      if (form.currentState!.validate()) {
        showWaitingDialog(context: context);
        final res = await Injector()
            .apiService
            .register(
            path: 'VKA_PatientRegistration',
            query: data.toJson());
        context.pop();
        log('API URL: ' + (res.base.request?.url.toString() ?? ''));
        print('VKA_PatientRegistration ${res.body}'); //312503
        if (res.isSuccessful) {
          if (res.body?.code == '1') {
            // final call = Injector()
            //     .timesmedService
            //     .get2(
            //     // path: 'DoctorBookAppointment',
            //     path: 'VkaDoctorBookAppointment',
            //     query: {
            //   'UserId': res.body?.data,
            //   'Type_Flag': 'H',
            //   'Hospital_id': widget.hospitalId,
            //   'DoctorId': LocalStorage.getUID(),
            //   'desc': complaints,
            //   'Time': MDateUtils.dateToHourMinuteQuery(widget.date.toIso8601String()),
            //   'Date': MDateUtils.dateToQueryDate(widget.date.toIso8601String()),
            // });
            final call = Injector()
                .timesmedService
                .get2(
                path: 'VkaDoctorBookAppointment',
                query: {
                  // .get2(path: 'DoctorBookAppointment', query: {
                  'UserId': res.body?.data,
                  //  user?.userId,
                  'Type_Flag': 'H',
                  'OnlineFlag':false,
                  'Hospital_id': widget.hospitalId,
                  // 'DoctorId': LocalStorage.getUID(),
                  'DoctorId': LocalStorage.getUID(),
                  'desc': 'complaints',
                  'Time': MDateUtils
                      .dateToHourMinuteQuery(
                      widget.date.toIso8601String()),
                  'Date': MDateUtils
                      .dateToQueryDate(
                      widget.date.toIso8601String()),
                });
            final resp = await ApiFacade.callApi(context: context, call: call);
            print(resp);
            print(resp?.error);
            print(resp?.body);
            print(resp?.statusCode);
            if (resp != null) {
              context.popDialog(true);
            }
            print('coming 1');
            context.pop(data);
          }else{
            print('coming 2');
          }
          showMessage(
              context: context,
              message: res.body?.message ?? '');
        } else {
          showMessage(
              context: context,
              message:
              'Request failed, Please check your connection.');
        }
      }
      // final call = Injector()
      //     .timesmedService
      //     .get2(path: 'DoctorBookAppointment', query: {
      //   'UserId': 1,
      //   'Type_Flag': 'H',
      //   'Hospital_id': widget.hospitalId,
      //   'DoctorId': LocalStorage.getUID(),
      //   'desc': complaints,
      //   'Time': MDateUtils.dateToHourMinuteQuery(widget.date.toIso8601String()),
      //   'Date': MDateUtils.dateToQueryDate(widget.date.toIso8601String()),
      // });
      // final res = await ApiFacade.callApi(context: context, call: call);
      // print(res);
      // print(res?.error);
      // print(res?.body);
      // print(res?.statusCode);
      // if (res != null) {
      //   context.popDialog(true);
      // }
    }
    context.pushAndRemoveUntil(Routes.currentAppointment, (_) => false);
  }
}

class ExistingUserTab extends StatefulWidget {
  final Function(Patient d)? onSelect;

  const ExistingUserTab({Key? key, this.onSelect}) : super(key: key);

  @override
  State<ExistingUserTab> createState() => _ExistingUserTabState();
}

class _ExistingUserTabState extends State<ExistingUserTab> {
  Patient? value;

  TextEditingController c = TextEditingController();

  final bloc =
      // ApiBuilderBloc(path: 'PatientSearch', timesmedApi: true, api2: true);
  ApiBuilderBloc(
        path: 'RegisteredPatientList', query: {'Doctor_id': LocalStorage.getUser().id});

  // List<Patient> orginalList = [];
  // List<Patient> l = [];

  @override
  Widget build(BuildContext context) {
    print('Doctorrr id ${LocalStorage.getUser().id}');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          MTextField(
            controller: c,
            label: 'Search Existing User',
            suffixIcon: const Icon(CupertinoIcons.search),
            onChanged: (d) {
              if (d.trim().isNotEmpty) {
                setState(() {

                });

                // bloc.add(UpdateQuery({'term': d.trim()}));
                // l = orginalList.where((e) => e.firstName!.toLowerCase().contains(d.toLowerCase())).toList();
                // setState(() {
                //   print('lenth ${l.length}');
                // });
              }
            },
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
              child: BlocProvider(
            create: (BuildContext context) {
              bloc.add(const Load());
              return bloc;
            },
            child: ApiBuilder<Patient>(
              fromJson: Patient.fromJsonFactory,
              jsonBuilder: (list, index) {
                List l = list
                    .map((e) => Patient.fromJson(e).copyWith(
                         patientName : e['User_Name'], phone: e['MobileNumber']))
                    .toList();
                if(c.text.trim().isNotEmpty) {
                  l = l
                      .where((e) =>
                      e.firstName!.toLowerCase().contains(c.text.toLowerCase()))
                      .toList();
                }
                // orginalList = List.from(listst.map((e) => Patient.fromJson(e)).toList());
                return ListView.builder(
                  itemCount: l.length,
                  itemBuilder: (c, i) {
                    final data = l[i];
                    return PatientProvider(
                      data: data,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            value = data;
                            widget.onSelect?.call(data);
                          });
                        },
                        borderRadius: BorderRadius.circular(MTheme.RADIUS),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Theme.of(context).dividerColor,
                                      width: 0.5))),
                          child: Row(
                            children: [
                              Radio(
                                  value: '${data.id}',
                                  groupValue: '${value?.id}',
                                  onChanged: (v) {}),
                              const UserTile(
                                avatarRadius: 18,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                caption: UserInfo(
                                  Info.phone,
                                  iconSize: 14,
                                  textSize: 12,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          )),
        ],
      ),
    );
  }
}
