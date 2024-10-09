import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/ui/widgets/loading_widget.dart';
import 'package:timesmedlite/ui/widgets/m_scaffold.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../routes/routes.dart';
import '../../../theme/theme.dart';
import 'controller/controller.dart';
import 'model/doctor_model.dart';

class DoctorsListForClinicalVisit extends StatefulWidget {
  final ClinicalVisitController controller;
  const DoctorsListForClinicalVisit({Key? key, required this.controller}) : super(key: key);

  @override
  State<DoctorsListForClinicalVisit> createState() =>
      _DoctorsListForClinicalVisitState();
}

class _DoctorsListForClinicalVisitState
    extends State<DoctorsListForClinicalVisit> {
  bool isLoading = false;

  // List<Doctor> doctors = [
  //   Doctor(
  //       name: "Santhosh",
  //       qualifications: "BDS, MDS - Periodontology and Oral Implantology",
  //       experience: "3",
  //       docSpeciality: "DENTIST - PERIODONTIST"),
  //   Doctor(
  //       name: "Arun",
  //       qualifications: "MBBS",
  //       experience: "4",
  //       docSpeciality: "DENTIST - PERIODONTIST"),
  //   Doctor(
  //       name: "MS Dhoni",
  //       qualifications: "BDS, MDS - Periodontology and Oral Implantology",
  //       experience: "5",
  //       docSpeciality: "DENTIST - PERIODONTIST"),
  //   Doctor(
  //       name: "Subash",
  //       qualifications: "MBBS",
  //       experience: "4",
  //       docSpeciality: "BDS, MDS - Periodontology and Oral Implantology"),
  //   Doctor(
  //       name: "Santhosh",
  //       qualifications: "BDS, MDS - Periodontology and Oral Implantology",
  //       experience: "3",
  //       docSpeciality: "DENTIST - PERIODONTIST"),
  //   Doctor(
  //       name: "Arun",
  //       qualifications: "MBBS",
  //       experience: "4",
  //       docSpeciality: "DENTIST - PERIODONTIST"),
  //   Doctor(
  //       name: "MS Dhoni",
  //       qualifications: "BDS, MDS - Periodontology and Oral Implantology",
  //       experience: "5",
  //       docSpeciality: "DENTIST - PERIODONTIST"),
  //   Doctor(
  //       name: "Subash",
  //       qualifications: "MBBS",
  //       experience: "4",
  //       docSpeciality: "BDS, MDS - Periodontology and Oral Implantology"),
  //   Doctor(
  //       name: "Santhosh",
  //       qualifications: "BDS, MDS - Periodontology and Oral Implantology",
  //       experience: "3",
  //       docSpeciality: "DENTIST - PERIODONTIST"),
  //   Doctor(
  //       name: "Arun",
  //       qualifications: "MBBS",
  //       experience: "4",
  //       docSpeciality: "DENTIST - PERIODONTIST"),
  //   Doctor(
  //       name: "MS Dhoni",
  //       qualifications: "BDS, MDS - Periodontology and Oral Implantology",
  //       experience: "5",
  //       docSpeciality: "DENTIST - PERIODONTIST"),
  //   Doctor(
  //       name: "Subash",
  //       qualifications: "MBBS",
  //       experience: "4",
  //       docSpeciality: "BDS, MDS - Periodontology and Oral Implantology"),
  // ];

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async{
    setState(() {
      isLoading = true;
    });
    await widget.controller.getDoctorList(
        widget.controller.selectedSpeciality.subCategoryId ?? 0,
        widget.controller.selectedState.stateId ?? 0,
        widget.controller.selectedCity.cityId ?? 0,
        1
    );
    doctorData = widget.controller.doctorData ;
    setState(() {
      isLoading = false;
    });
  }
  DoctorModel doctorData = DoctorModel();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MScaffold(
      title: Text(
        "LIST OF BEST DOCTORS",
        style: TextStyle(
          fontSize: size.height * 0.0165,
        ),
      ),
      appBarBottom: Padding(
        padding: EdgeInsets.all(size.width * 0.035),
        child: SizedBox(
          width: size.width * 0.9,
          child: TextField(
            onChanged: (value) {
              doctorData.data = widget.controller.doctorData.data?.map((element) => element).where((element) {
                return element.doctorName?.toLowerCase().contains(value.toLowerCase())?? false;
              }).toList() as List<DoctorData>;
              setState(() {

              });
            },
            decoration: InputDecoration(
              labelText: 'Search For Doctor Appointment',
              suffixIcon: Icon(
                FontAwesomeIcons.magnifyingGlass,
                color: MTheme.BUTTON_COLOR,
                size: size.height * 0.025,
              ), // Replace this with the desired icon
            ),
          ),
        ),
      ),
      body:isLoading ? LoadingWidget() : SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: size.width * 0.04,
            right: size.width * 0.04,
          ),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.12,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: doctorData.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: size.height * 0.022,
                                  backgroundImage:  NetworkImage('${doctorData.data?[index].doctorImage}'), // Replace this with the actual image asset path
                                ),
                                SizedBox(
                                  width: size.width * 0.03,
                                ),
                                Text(
                                  "${doctorData.data?[index].doctorName.toString()}",
                                  style: TextStyle(
                                    fontSize: size.height * 0.022,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: size.height * 0.012),
                            Container(
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
                              child: Padding(
                                padding: EdgeInsets.all(size.width * 0.012),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: size.height * 0.012),
                                    Text(
                                      doctorData.data?[index].doctorQualification ?? '',
                                      style: TextStyle(
                                        fontSize: size.height * 0.0165,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(height: size.height * 0.012),
                                    const Divider(),
                                    SizedBox(height: size.height * 0.012),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: size.width * 0.4,
                                              child: Text(
                                                '${doctorData.data?[index].doctorExperienceYears}Years Experience',
                                                style: TextStyle(
                                                  fontSize: size.height * 0.015,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                                height: size.height * 0.012),
                                            SizedBox(
                                              width: size.width * 0.4,
                                              child: Text(
                                                '${doctorData.data?[index].specialization}',
                                                style: TextStyle(
                                                  fontSize: size.height * 0.015,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          child: OutlinedButton(
                                            onPressed: () {
                                              context.push(
                                                  Routes
                                                      .DoctorsClinicalListDetails,
                                                  {
                                                    'doctorsName':
                                                        doctorData.data?[index]
                                                            .doctorName
                                                            .toString(),
                                                    'doctorsQualification':
                                                        doctorData.data?[index]
                                                            .doctorQualification
                                                            .toString(),
                                                    'doctorData' : doctorData.data?[index]
                                                  });
                                            },
                                            child: Text(
                                              'Book Appointment',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: size.height * 0.015,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class Doctor {
  final String? name;
  final String? qualifications;
  final String? experience;
  final String? docSpeciality;

  Doctor({
    this.name,
    this.qualifications,
    this.experience,
    this.docSpeciality,
  });
}
