import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../routes/routes.dart';
import '../../../theme/theme.dart';
import '../../../widgets/m_scaffold.dart';
import '../../dashboard/dashboard_header.dart';

class BookAnAppointmentClinicalVisit extends StatefulWidget {
  const BookAnAppointmentClinicalVisit({Key? key}) : super(key: key);

  @override
  State<BookAnAppointmentClinicalVisit> createState() =>
      _BookAnAppointmentClinicalVisitState();
}

class _BookAnAppointmentClinicalVisitState
    extends State<BookAnAppointmentClinicalVisit> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MScaffold(
      title: Text(
        Consts.BOOK_AN_APPOINTMENT,
        style: TextStyle(
          fontSize: size.height * 0.0165,
        ),
      ),
      // appBarBottom:  Container(height: MediaQuery.of(context).size.height * 0.025,),
      paddingTop: MediaQuery.of(context).size.height * 0.1,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: size.width * 0.04,
            right: size.width * 0.04,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: size.width * 0.65,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Select City',
                            suffixIcon: Icon(
                              FontAwesomeIcons.angleDown,
                              color: Colors.grey.shade500,
                              size: size.height * 0.025,
                            ), // Replace this with the desired icon
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      SizedBox(
                        width: size.width * 0.65,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Select Location',
                            suffixIcon: Icon(
                              FontAwesomeIcons.angleDown,
                              color: Colors.grey.shade500,
                              size: size.height * 0.025,
                            ), // Replace this with the desired icon
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: size.width * 0.05,
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(size.width * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: size.height * 0.022,
                          ),
                          const Icon(
                            FontAwesomeIcons.locationDot,
                            color: MTheme.BUTTON_COLOR,
                          ),
                          SizedBox(
                            height: size.height * 0.015,
                          ),
                          const Text("Near Me"),
                          SizedBox(
                            height: size.height * 0.022,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.018,
              ),
              SizedBox(
                width: size.width,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Search By Hospital Name ',
                    suffixIcon: Icon(
                      FontAwesomeIcons.magnifyingGlass,
                      size: size.height * 0.025,
                    ), // Replace this with the desired icon
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.018,
              ),
              SizedBox(
                width: size.width,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Select Speciality',
                    suffixIcon: Icon(
                      FontAwesomeIcons.angleDown,
                      color: Colors.grey.shade500,
                      size: size.height * 0.025,
                    ), // Replace this with the desired icon
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.4,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: size.width * 0.045,
                  vertical: size.height * 0.01,
                ),
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height * 0.07,
                child: OutlinedButton(
                  onPressed: () {
                    context.push(Routes.DoctorsListForClinicalVisit);
                  },
                  child: Text(
                    'Select Doctor for Clinical Appointment',
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
