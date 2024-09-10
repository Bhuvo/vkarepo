import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../components/user_info.dart';
import '../../../routes/routes.dart';
import '../../../theme/theme.dart';

class ThankingScreenClinicalVisit extends StatefulWidget {
  final String doctorsName;
  final String doctorsQualification;

  const ThankingScreenClinicalVisit({
    Key? key,
    required this.doctorsName,
    required this.doctorsQualification,
  }) : super(key: key);

  @override
  State<ThankingScreenClinicalVisit> createState() =>
      _ThankingScreenClinicalVisitState();
}

class _ThankingScreenClinicalVisitState
    extends State<ThankingScreenClinicalVisit> {
  String? formattedDate;
  String? formattedTime;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DateTime now = DateTime.now();
    formattedDate = DateFormat('dd/MM/yyyy').format(now);
    formattedTime = DateFormat('hh:mm a').format(now);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MScaffold(
      bottom: Padding(
        padding: EdgeInsets.only(
          left: size.width * 0.06,
          right: size.width * 0.06,
          top: size.width * 0.03,
          bottom: size.width * 0.03,
        ),
        child: SizedBox(
          width: size.width * 0.25,
          child: OutlinedButton(
            onPressed: () {
              context.push(Routes.bookAppointment);
            },
            child: Text(
              'Book Appointment',
              style: TextStyle(
                color: Colors.black,
                fontSize: size.height * 0.02,
              ),
            ),
          ),
        ),
      ),
      title: Text(
        "YOUR APPOINTMENT",
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: size.width * 0.04,
            right: size.width * 0.04,
          ),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                size.width * 0.04,
              ),
            ),
            elevation: 2,
            child: Padding(
              padding: EdgeInsets.only(
                left: size.width * 0.04,
                right: size.width * 0.04,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: size.height * 0.0075,
                      bottom: size.height * 0.0075,
                      left: size.width * 0.02,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Mogappair-East - Chennai",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.bold,
                          fontSize: size.height * 0.02,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: size.height * 0.0075,
                      bottom: size.height * 0.0075,
                      left: size.width * 0.02,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "No: 82,Justice Rathnavel Pandian Road, Golden George Nagar,(Near Reliance Fresh / HDFC BANK ATM) Mogappair East, Chennai- 600 107",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: size.height * 0.0165,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  Text(
                    'THANK YOU',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: MTheme.ICON_COLOR,
                      fontSize: size.height * 0.045,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    'Appointment Date and Time',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: size.height * 0.024,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87),
                  ),
                  MListTile(
                    borderColor: MTheme.THEME_COLOR,
                    child: Row(
                      children: [
                        Expanded(
                            child: UserInfo(
                          Info.custom,
                          icon: FontAwesomeIcons.solidCalendarDays,
                          lable: formattedDate,
                          textColor: MTheme.THEME_COLOR,
                        )),
                        Container(
                          height: size.height * 0.056,
                          width: 1,
                          color: MTheme.THEME_COLOR,
                        ),
                        Expanded(
                            child: UserInfo(Info.custom,
                                icon: FontAwesomeIcons.solidClock,
                                lable: formattedTime,
                                textColor: MTheme.THEME_COLOR)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: size.height * 0.0075,
                      bottom: size.height * 0.0075,
                      left: size.width * 0.02,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Appointment Confirmed",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: size.height * 0.018,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  Container(
                    padding: EdgeInsets.all(
                      size.width * 0.05,
                    ),
                    decoration: BoxDecoration(
                      color: HexColor("#ecf7f6"),
                      borderRadius: BorderRadius.circular(
                        size.width * 0.02,
                      ),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/timesmedlogo.png",
                          width: size.width * 0.35,
                        ),
                        SizedBox(
                          height: size.height * 0.015,
                        ),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'This Appointment is guaranteed by',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: size.height * 0.0165,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: ' Timesmed',
                                style: TextStyle(
                                  color: MTheme.THEME_COLOR,
                                  fontSize: size.height * 0.0165,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.015,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Name",
                            style: TextStyle(
                              color: Colors.grey.shade800,
                              fontSize: size.height * 0.0165,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.012,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Email Id",
                            style: TextStyle(
                              color: Colors.grey.shade800,
                              fontSize: size.height * 0.0165,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.012,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Mobile",
                            style: TextStyle(
                              color: Colors.grey.shade800,
                              fontSize: size.height * 0.0165,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.012,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Symptom Description",
                            style: TextStyle(
                              color: Colors.grey.shade800,
                              fontSize: size.height * 0.0165,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.035,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
