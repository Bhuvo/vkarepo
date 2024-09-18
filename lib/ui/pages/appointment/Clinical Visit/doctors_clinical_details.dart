import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:timesmedlite/ui/widgets/m_scaffold.dart';
import 'package:timesmedlite/utils/local_storage.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../routes/routes.dart';
import '../../../theme/theme.dart';

class DoctorsClinicalListDetails extends StatefulWidget {
  final String doctorsName;
  final String doctorsQualification;

  const DoctorsClinicalListDetails({
    Key? key,
    required this.doctorsName,
    required this.doctorsQualification,
  }) : super(key: key);

  @override
  State<DoctorsClinicalListDetails> createState() =>
      _DoctorsClinicalListDetailsState();
}

class _DoctorsClinicalListDetailsState
    extends State<DoctorsClinicalListDetails> {
  int _selectedTextIndex = 0;

  Widget buildTextWithBottomColor(int index, String text, Size size) {
    bool isSelected = index == _selectedTextIndex;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTextIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.all(size.width * 0.025),
        decoration: BoxDecoration(
          color: isSelected ? MTheme.BUTTON_COLOR : Colors.transparent,
          border: Border(
              bottom: BorderSide(
                  color: MTheme.BUTTON_COLOR, width: isSelected ? 4.0 : 0.0)),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: size.height * 0.012,
            // color: isSelected ? MTheme.THEME_COLOR : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MScaffold(
      title: Text(
        "Dr. ${widget.doctorsName}",
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
      paddingTop: size.height * 0.25,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: size.width * 0.04,
            right: size.width * 0.04,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 2,
                child: Container(
                  padding: EdgeInsets.all(size.width * 0.02),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        HexColor("#ecf7f6"),
                        Colors.white,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(
                      size.width * 0.02,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildTextWithBottomColor(0, 'INFO', size),
                          buildTextWithBottomColor(1, 'FEEDBACK', size),
                          buildTextWithBottomColor(2, 'PHOTOS', size),
                          buildTextWithBottomColor(3, 'VIDEOS', size),
                          buildTextWithBottomColor(4, 'SERVICES', size),
                          buildTextWithBottomColor(5, 'MAP', size),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.0075,
                          bottom: size.height * 0.0075,
                        ),
                        child: Text(
                          "Passion for Dentistry Especially Implants. You can get the phone number of Dr. A. Joseph Anand on Timesmed.com.",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: size.height * 0.0165,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.0075,
                          bottom: size.height * 0.0075,
                        ),
                        child: Text(
                          "Mogappair-East - Chennai",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.bold,
                            fontSize: size.height * 0.02,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.0075,
                          bottom: size.height * 0.0075,
                        ),
                        child: Text(
                          "No: 82,Justice Rathnavel Pandian Road, Golden George Nagar,(Near Reliance Fresh / HDFC BANK ATM) Mogappair East, Chennai- 600 107",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: size.height * 0.0165,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Container(
                        width: size.width * 0.35,
                        height: size.height * 0.06,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            size.width * 0.02,
                          ),
                        ),
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Text(
                            'View Map',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: size.height * 0.0156,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(size.width * 0.02),
                ),
                child: Padding(
                  padding: EdgeInsets.all(size.width * 0.035),
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.calendarDays,
                        size: size.height * 0.035,
                        color: MTheme.BUTTON_COLOR,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        'Mon - Sat - 5:00PM - 9:00PM',
                        style: TextStyle(
                            fontSize: size.height * 0.018,
                            fontWeight: FontWeight.bold,
                            color: MTheme.THEME_COLOR),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(size.width * 0.02),
                ),
                child: Padding(
                  padding: EdgeInsets.all(size.width * 0.035),
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.calendarDays,
                        size: size.height * 0.035,
                        color: MTheme.BUTTON_COLOR,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        'Sun - 8:00PM - 9:00PM',
                        style: TextStyle(
                            fontSize: size.height * 0.018,
                            fontWeight: FontWeight.bold,
                            color: MTheme.THEME_COLOR),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Container(
                width: size.width,
                height: size.height * 0.075,
                child: OutlinedButton(
                  onPressed: () {
                    LocalStorage.setBool(LocalStorage.isFromPatient,true) ;
                    LocalStorage.setInt(LocalStorage.patientSearchDoctorId,178936) ;
                    context.push(Routes.bookingAppointment);
                    // context.push(Routes.BookAppointmentForClinicalTiming, {
                    //   'doctorsName': widget.doctorsName.toString(),
                    //   'doctorsQualification':
                    //       widget.doctorsQualification.toString(),
                    // });
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
            ],
          ),
        ),
      ),
    );
  }
}
