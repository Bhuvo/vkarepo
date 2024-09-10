import 'package:flutter/cupertino.dart';
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
import 'package:timesmedlite/ui/providers/user_provider.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/date_utils.dart';
import 'package:timesmedlite/utils/local_storage.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';
import 'package:timesmedlite/utils/size_utils.dart';

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
    print(widget.date);
    print("prints date");
    super.initState();
  }

  User? user;

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
                        user = d;
                      });
                    },
                  ),
                  SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        const MTextField(
                          label: 'Username',
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const MTextField(
                          label: 'Email Address',
                          type: MInputType.email,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const MPhoneField(
                          label: 'Mobile Number',
                          maxLines: 10,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const MTextField(
                          label: 'Complaints',
                        ),
                        MRadioChip<String>(
                          labelStyle: Theme.of(context).textTheme.caption,
                          value: gender,
                          onChanged: (d) {
                            setState(() {
                              gender = d;
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
                      ],
                    ),
                  ),
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
    if (user?.userId != null) {
      print("api clicked");
      final call = Injector()
          .timesmedService
          .get2(path: 'DoctorBookAppointment', query: {
        'UserId': user?.userId,
        'Type_Flag': 'H',
        'Hospital_id': widget.hospitalId,
        'DoctorId': LocalStorage.getUID(),
        'desc': complaints,
        'Time': MDateUtils.dateToHourMinuteQuery(widget.date.toIso8601String()),
        'Date': MDateUtils.dateToQueryDate(widget.date.toIso8601String()),
      });
      final res = await ApiFacade.callApi(context: context, call: call);
      print(res);
      print(res?.error);
      print(res?.body);
      print(res?.statusCode);
      if (res != null) {
        context.popDialog(true);
      }
    } else {
      print("api clicked");
      final call = Injector()
          .timesmedService
          .get2(path: 'DoctorBookAppointment', query: {
        'UserId': 1,
        'Type_Flag': 'H',
        'Hospital_id': widget.hospitalId,
        'DoctorId': LocalStorage.getUID(),
        'desc': complaints,
        'Time': MDateUtils.dateToHourMinuteQuery(widget.date.toIso8601String()),
        'Date': MDateUtils.dateToQueryDate(widget.date.toIso8601String()),
      });
      final res = await ApiFacade.callApi(context: context, call: call);
      print(res);
      print(res?.error);
      print(res?.body);
      print(res?.statusCode);
      if (res != null) {
        context.popDialog(true);
      }
    }
  }
}

class ExistingUserTab extends StatefulWidget {
  final Function(User d)? onSelect;

  const ExistingUserTab({Key? key, this.onSelect}) : super(key: key);

  @override
  State<ExistingUserTab> createState() => _ExistingUserTabState();
}

class _ExistingUserTabState extends State<ExistingUserTab> {
  User? value;

  final bloc =
      ApiBuilderBloc(path: 'PatientSearch', timesmedApi: true, api2: true);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          MTextField(
            label: 'Search Existing User',
            suffixIcon: const Icon(CupertinoIcons.search),
            onChanged: (d) {
              if (d.trim().isNotEmpty) {
                bloc.add(UpdateQuery({'term': d.trim()}));
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
            child: ApiBuilder<User>(
              fromJson: User.fromJsonFactory,
              jsonBuilder: (list, index) {
                final l = list
                    .map((e) => User.fromJson(e).copyWith(
                        fullName: e['User_Name'], phone: e['MobileNumber']))
                    .toList();

                return ListView.builder(
                  itemCount: l.length,
                  itemBuilder: (c, i) {
                    final data = l[i];
                    return UserProvider(
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
                                  value: '${data.userId}',
                                  groupValue: '${value?.userId}',
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
