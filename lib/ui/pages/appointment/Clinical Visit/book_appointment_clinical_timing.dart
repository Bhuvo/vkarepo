import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timesmedlite/ui/widgets/m_scaffold.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';
import 'package:timesmedlite/utils/size_utils.dart';

import '../../../../model/time_list_response.dart';
import '../../../../utils/local_storage.dart';
import '../../../components/api_builder/api_builder.dart';
import '../../../components/api_builder/api_builder_bloc.dart';
import '../../../components/update_timing_widget.dart';
import '../../../routes/routes.dart';
import '../../../theme/theme.dart';

class BookAppointmentForClinicalTiming extends StatefulWidget {
  final String doctorsName;
  final String doctorsQualification;

  const BookAppointmentForClinicalTiming({
    Key? key,
    required this.doctorsName,
    required this.doctorsQualification,
  }) : super(key: key);

  @override
  State<BookAppointmentForClinicalTiming> createState() =>
      _BookAppointmentForClinicalTimingState();
}

class _BookAppointmentForClinicalTimingState
    extends State<BookAppointmentForClinicalTiming> {
  late ApiBuilderBloc bloc;

  DateTime cur = DateTime.now();
  DateTime? selection;
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = ApiBuilderBloc(
        path: 'BookAppointment_Future',
        query: {
          'F_Date':
              '${DateTime.now().month}/${DateTime.now().day}/${DateTime.now().year}',
          'Doctor_id': '${LocalStorage.getUID()}',
        },
        raw: true);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MScaffold(
      title: Text(
        "BOOK APPOINTMENT",
        style: TextStyle(
          fontSize: size.height * 0.0165,
        ),
      ),
      appBarBottom: Padding(
        padding: EdgeInsets.all(size.width * 0.035),
        child: Row(
          children: [
            CircleAvatar(
              radius: size.height * 0.05,
              backgroundColor: MTheme.THEME_COLOR,
              // Background color of the outer circle
              child: CircleAvatar(
                radius: size.height * 0.035,
                backgroundImage: AssetImage(
                    'assets/images/doctor.png'), // Replace this with the actual image asset path
              ),
            ),
            SizedBox(
              width: size.width * 0.035,
            ),
            SizedBox(
              width: size.width * 0.65,
              child: Text(
                widget.doctorsQualification,
                style: TextStyle(
                  fontSize: size.height * 0.0165,
                ),
              ),
            )
          ],
        ),
      ),
      paddingTop: size.height * 0.22,
      bottom: Container(
        constraints: BoxConstraints(maxWidth: 480),
        margin: EdgeInsets.symmetric(
            horizontal: context.getWPercent(10), vertical: 8),
        child: OutlinedButton(
          child: const Text('Book Appointment'),
          onPressed: () async {
            context.push(Routes.thankingPage, {
              'doctorsName': widget.doctorsName.toString(),
              'doctorsQualification': widget.doctorsQualification.toString(),
            });
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: size.width * 0.04,
            right: size.width * 0.04,
            bottom: size.height * 0.04
          ),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                size.width * 0.04,
              ),
            ),
            child: Column(
              children: [
                BlocProvider(
                  create: (context) => bloc..add(const Load()),
                  child: ApiBuilder<TimeListResponse>(
                      fromJson: TimeListResponse.fromJsonFactory,
                      loading: Shimmer.fromColors(
                          baseColor:
                              Theme.of(context).canvasColor.withOpacity(0.25),
                          highlightColor: Theme.of(context).highlightColor,
                          child: IgnorePointer(
                              ignoring: true,
                              child: UpdateTimingWidget(
                                date: cur,
                              ))),
                      customBuilder: (data, load) {
                        return UpdateTimingWidget(
                          timeList: data.first.timeList,
                          onSelect: (d) {
                            selection = d;
                            print(
                                'Printttttttttttttttttttttttt${d.hour}/${d.minute}/${d.second}');
                          },
                          date: cur,
                          onChanged: (d) {
                            setState(() {
                              cur = d;
                              print(
                                  'Printttttttttttttttttttttttttttttttttttttttttttttttttttttt${d.month}/${d.day}/${d.year}');
                              bloc.add(UpdateQuery({
                                'F_Date': '${d.month}/${d.day}/${d.year}',
                                'Doctor_id': '${LocalStorage.getUID()}',
                              }));
                              bloc.add(Refresh());
                            });
                          },
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
