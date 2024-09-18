import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/ui/widgets/m_scaffold.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../routes/routes.dart';
import '../../../theme/theme.dart';
import 'model/doctor_model.dart';

class DoctorsListForClinicalVisit extends StatefulWidget {
  const DoctorsListForClinicalVisit({Key? key}) : super(key: key);

  @override
  State<DoctorsListForClinicalVisit> createState() =>
      _DoctorsListForClinicalVisitState();
}

class _DoctorsListForClinicalVisitState
    extends State<DoctorsListForClinicalVisit> {
  List<Doctor> doctors = [
    Doctor(
        name: "Santhosh",
        qualifications: "BDS, MDS - Periodontology and Oral Implantology",
        experience: "3",
        docSpeciality: "DENTIST - PERIODONTIST"),
    Doctor(
        name: "Arun",
        qualifications: "MBBS",
        experience: "4",
        docSpeciality: "DENTIST - PERIODONTIST"),
    Doctor(
        name: "MS Dhoni",
        qualifications: "BDS, MDS - Periodontology and Oral Implantology",
        experience: "5",
        docSpeciality: "DENTIST - PERIODONTIST"),
    Doctor(
        name: "Subash",
        qualifications: "MBBS",
        experience: "4",
        docSpeciality: "BDS, MDS - Periodontology and Oral Implantology"),
    Doctor(
        name: "Santhosh",
        qualifications: "BDS, MDS - Periodontology and Oral Implantology",
        experience: "3",
        docSpeciality: "DENTIST - PERIODONTIST"),
    Doctor(
        name: "Arun",
        qualifications: "MBBS",
        experience: "4",
        docSpeciality: "DENTIST - PERIODONTIST"),
    Doctor(
        name: "MS Dhoni",
        qualifications: "BDS, MDS - Periodontology and Oral Implantology",
        experience: "5",
        docSpeciality: "DENTIST - PERIODONTIST"),
    Doctor(
        name: "Subash",
        qualifications: "MBBS",
        experience: "4",
        docSpeciality: "BDS, MDS - Periodontology and Oral Implantology"),
    Doctor(
        name: "Santhosh",
        qualifications: "BDS, MDS - Periodontology and Oral Implantology",
        experience: "3",
        docSpeciality: "DENTIST - PERIODONTIST"),
    Doctor(
        name: "Arun",
        qualifications: "MBBS",
        experience: "4",
        docSpeciality: "DENTIST - PERIODONTIST"),
    Doctor(
        name: "MS Dhoni",
        qualifications: "BDS, MDS - Periodontology and Oral Implantology",
        experience: "5",
        docSpeciality: "DENTIST - PERIODONTIST"),
    Doctor(
        name: "Subash",
        qualifications: "MBBS",
        experience: "4",
        docSpeciality: "BDS, MDS - Periodontology and Oral Implantology"),
  ];

  DoctorModel doctorData = DoctorModel(
    data: [
      DoctorData(
        doctorId: 42180,
        specialization: null,
        doctorName: "Dr.Nagendra Boopathy",
        doctorNameTemp: "Dr-Nagendra-Boopathy",
        doctorQualification: "MBBS, MD - Internal Medicine, DM - Cardiology, Fellowship in Intracoronary imaging, Fellowship In Interventional Cardiology",
        doctorExperienceYears: 7,
        recommendations: 179,
        doctorDescription: "Dr. Nagendra Boopathy is a consultant general and interventional cardiologist with special interest in clinical cardiology, primary angioplasty (done during a heart attack), complex coronary artery stenting( including bifurcations, rotaablation, chronic total occlusions) and peripheral arterial stenting. After finishing his internal medicine training in the prestigious PGIMER, Chandigarh, he finished his cardiology training at the apex institution of our nation, All India Institute of Medical sciences, New Delhi where he was awarded a gold medal for the best outgoing student by HE President of India. Being trained at the Apex Institution of our country, he is well versed in all day today noninvasive cardiac procedures including echocardiogram, TMT, and Holter examination. Later, he underwent the most effective training in the field of interventional cardiology at the renowned Mount Sinai Hospital, New York where he got trained in all kind of coronary and peripheral vascular interventions. Considering his contribution in the field of cardiology, he has been awarded the fellowship in American College of Cardiology(FACC) by ACC, USA. He has over 20 publications to his credit in reputed international and national journals including the prestigious NEJM. Currently, he is working as a consultant general and interventional cardiology at Apollo Speciality Hospitals, Vanagram. You can book an instant appointment with Dr. Nagendra Boopathy on Timesmed.com.",
        doctorImage: "https://www.timesmed.com/images/doc-imgs/55bccd5aa6c01c74389ad3e3be60fed0afa2067a2aef6.jpg",
        doctorAddress: "",
        typeFlag: "H",
        feedBack: 4,
        clinicDoctorFee: 200,
        clinicName: "Apollo Specialty Hospitals Vanagaram",
        clinicNameTemp: "Apollo-Specialty-Hospitals-Vanagaram",
        clinicId: 40806,
        fromTime: "18:00:00",
        toTime: "21:30:00",
        locationId: 1260,
        locationName: "Vanagaram",
        locationNameTemp: "Vanagaram",
        days: null,
        dayslot: [
          Dayslot(
            time: "18:00:00.000000021:30:00.0000000",
            fromTime: "6:00PM",
            toTime: "9:30PM",
            day: ["1", "2", "3", "4", "5", "6", "7"],
            daysName: null,
            timeList: null,
          ),
        ],
      ),
      DoctorData(
        doctorId: 180236,
        specialization: null,
        doctorName: "Latha",
        doctorNameTemp: "Latha",
        doctorQualification: "",
        doctorExperienceYears: 15,
        recommendations: 1,
        doctorDescription: "ddefec",
        doctorImage: "https://www.timesmed.com/images/doc-imgs/brother-and-sister-fighting-for-remote.jpg",
        doctorAddress: "chennai",
        typeFlag: "H",
        feedBack: 2,
        clinicDoctorFee: 500,
        clinicName: "llatha clinic",
        clinicNameTemp: "llatha-clinic",
        clinicId: 173043,
        fromTime: "08:08:00",
        toTime: "23:08:00",
        locationId: 1256,
        locationName: "Abhiramapuram",
        locationNameTemp: "Abhiramapuram",
        days: null,
        dayslot: [
          Dayslot(
            time: "08:08:00.000000023:08:00.0000000",
            fromTime: "8:08AM",
            toTime: "11:08PM",
            day: ["1", "2", "3", "4"],
            daysName: null,
            timeList: null,
          ),
        ],
      ),
      DoctorData(
        doctorId: 172938,
        specialization: null,
        doctorName: "OP Unit 4",
        doctorNameTemp: "OP-Unit-4",
        doctorQualification: "MBBS",
        doctorExperienceYears: 15,
        recommendations: 150,
        doctorDescription: "1",
        doctorImage: "https://www.timesmed.com/images/doc-imgs/ChMC_Logo1.jpg",
        doctorAddress: "1",
        typeFlag: "H",
        feedBack: 2,
        clinicDoctorFee: 100,
        clinicName: "Chengalpattu Medical College Hospital",
        clinicNameTemp: "Chengalpattu-Medical-College-Hospital",
        clinicId: 160731,
        fromTime: "10:00:00",
        toTime: "18:00:00",
        locationId: 3758,
        locationName: "Chengalpattu",
        locationNameTemp: "Chengalpattu",
        days: null,
        dayslot: [
          Dayslot(
            time: "10:00:00.000000018:00:00.0000000",
            fromTime: "10:00AM",
            toTime: "6:00PM",
            day: ["1", "2", "3", "4", "5", "6"],
            daysName: null,
            timeList: null,
          ),
        ],
      ),
    ],
    responseCode: "200",
    responseMessage: "Doctors List",
  );

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
      body: SingleChildScrollView(
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
                  itemCount: doctorData.data?.length,
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
                                  backgroundImage: const AssetImage(
                                      'assets/images/doctor.png'), // Replace this with the actual image asset path
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
