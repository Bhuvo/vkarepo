import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timesmedlite/temp/screen/pateint/doctor_profile.dart';
import 'package:timesmedlite/temp/screen/pateint/home_page.dart';
import 'package:timesmedlite/temp/screen/pateint/add_inr_details.dart';
import 'package:timesmedlite/temp/screen/pateint/patient_registration.dart';

import '../constant/colors.dart';
import '../widgets/circle_border.dart';
import 'curve_screen.dart';

class PatientInrScreen extends StatefulWidget {
  const PatientInrScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<PatientInrScreen> createState() => _PatientInrScreenState();
}

class _PatientInrScreenState extends State<PatientInrScreen> {
  bool _addPatientVisible = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 247, 250),

      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        titleSpacing: 0.00,
        title: Stack(
          children: <Widget>[
            Container(
              height: 80.0,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color.fromARGB(255, 11, 146, 156),
                      Color.fromARGB(255, 32, 208, 122)
                    ],
                  ),
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(48))),
              child: Stack(children: <Widget>[
                Positioned(
                    left: 0,
                    child: Container(
                        margin: const EdgeInsets.only(top: 12.0, left: 12.0),
                        height: 80,
                        width: 16,
                        alignment: Alignment.center,
                        child: Image.asset('assets/leftarrow.png'))),
                Center(
                  child: Container(
                      margin: const EdgeInsets.only(top: 12.0),
                      alignment: Alignment.center,
                      child: Text(
                        "Patient inr details".toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontFamily: 'Metropolis'),
                      )),
                )
              ]),
            )
          ],
        ),
        backgroundColor: Color.fromARGB(255, 246, 247, 250),
      ),

      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [
              Color.fromARGB(255, 11, 146, 156),
              Color.fromARGB(255, 32, 208, 122)
            ],
          ),
        ),
        child: Container(
            padding: const EdgeInsets.only(top: 22.0, bottom: 12.0),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 246, 247, 250),
                border: Border.all(
                    width: 0.0, color: Color.fromARGB(255, 246, 247, 250)),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(48),
                    bottomRight: Radius.circular(48))),
            child: Stack(
              children: <Widget>[
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 100,
                        margin: EdgeInsets.all(10),
                        width: double.infinity,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _addPatientVisible = true;
                            });
                          },
                          child: Card(
                            color: cardRed,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Time ",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                Text(
                                  "60 % ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                     _addPatientVisible? Container(
                       margin: EdgeInsets.all(10),
                       width: double.infinity,
                       child: Card(
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Container(
                               margin: EdgeInsets.all(10),
                               child: Row(
                                 children: [
                                   const SizedBox(
                                     width: 54,
                                     height: 54,
                                     child: CircleAvatar(
                                       backgroundImage: AssetImage(
                                           'assets/images/photo_circle.png'),
                                     ),
                                   ),
                                   Padding(
                                     padding: EdgeInsets.only(left: 5),
                                     child: Column(
                                       crossAxisAlignment:
                                       CrossAxisAlignment.start,
                                       children: const [
                                         Text(
                                           "Dr. Koushik Muthu Raja M",
                                           style: TextStyle(
                                               color: gray108,
                                               fontWeight: FontWeight.bold,
                                               fontSize: 24),
                                         ),

                                       ],
                                     ),
                                   ),

                                 ],
                               ),
                             ),
                             Container(
                               margin: EdgeInsets.all(5),
                               width: double.infinity,
                               height: 70,
                               decoration: BoxDecoration(
                                   color: gray215,
                                   borderRadius:
                                   BorderRadius.all(Radius.circular(10))),
                               child: Padding(
                                 padding: EdgeInsets.all(5),
                                 child: Column(
                                   children: [
                                     Row(
                                       children: [
                                         Icon(Icons.mail,color: Colors.yellow,),
                                         Padding(
                                           padding: EdgeInsets.only(left: 10),
                                           child: Text(
                                             "sksamy06@gmail.com",
                                             style: TextStyle(fontSize: 16),
                                           ),
                                         ),
                                       ],
                                     ),
                                     Padding(padding: EdgeInsets.only(top: 5),
                                       child:  Row(
                                         children: [
                                           Icon(Icons.phone,color: Colors.yellow,),
                                           Padding(
                                               padding: EdgeInsets.only(left: 10),
                                               child: Text(
                                                 "9543063103",
                                                 style: TextStyle(fontSize: 16),
                                               )),
                                           SizedBox(
                                             width: 10,
                                           ),
                                           Icon(Icons.phone,color: Colors.yellow,),
                                           Padding(
                                               padding: EdgeInsets.only(left: 10),
                                               child: Text(
                                                 "9543063103",
                                                 style: TextStyle(fontSize: 16),
                                               )),
                                           //,
                                         ],
                                       ),)
                                   ],
                                 ),
                               ),
                             ),

                             Container(
                               margin: EdgeInsets.all(10),
                               width: double.infinity,
                               child: Row(
                                 children: [
                                   _buildTargetText("Target INR:"),
                                   SizedBox(
                                     width: 2,
                                   ),
                                   _buildRange(),
                                   Spacer(),
                                   _buildTargetText("Target INR:"),
                                   _buildDateIcon(),
                                   _dateText()
                                   //,
                                 ],
                               ),
                             ),
                             Divider(
                               height: 2,
                               color: Colors.grey,
                             ),
                             Padding(
                               padding: EdgeInsets.all(10),
                               child: _column("", ""),
                             ),
                             Divider(
                               height: 2,
                               color: Colors.grey,
                             ),
                             Padding(
                               padding: EdgeInsets.all(10),
                               child: _column("", ""),
                             ),
                           ],
                         ),
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(10.0),
                         ),
                       ),
                     ):Text(""),
                      _addPatientVisible?Text(""):Container(
                        margin: EdgeInsets.all(10),
                        width: double.infinity,
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 64,
                                      height: 64,
                                      child: CircleAvatar(
                                        backgroundImage: AssetImage(
                                            'assets/images/photo_circle.png'),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "Aravind",
                                            style: TextStyle(
                                                color: gray108,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 24),
                                          ),
                                          Text(
                                            "Age:32",
                                            style: TextStyle(
                                                color: gray108, fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Icon(Icons.female),
                                    Text(
                                      "BH234",
                                      style: TextStyle(color: blue8),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(5),
                                width: double.infinity,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: gray215,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                                child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Row(
                                    children: [
                                      Icon(Icons.phone),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          "9543063103",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                      Spacer(),
                                      Text("Target INR:",
                                          style: TextStyle(fontSize: 16)),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      _buildRange()
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    _buildTargetText("Target INR:"),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    _buildRange(),
                                    Spacer(),
                                    _buildTargetText("Target INR:"),
                                    _buildDateIcon(),
                                    _dateText()
                                    //,
                                  ],
                                ),
                              ),
                              Divider(
                                height: 2,
                                color: Colors.grey,
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: _column("", ""),
                              ),
                              Divider(
                                height: 2,
                                color: Colors.grey,
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: _column("", ""),
                              ),
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        width: double.infinity,
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(
                                    right: 10, top: 10, bottom: 10),
                                child: Row(
                                  children: [
                                    _buildDateIcon(),
                                    _dateText(),
                                    Spacer(),
                                    CircleAvatar(
                                      backgroundColor: blue8,
                                      radius: 20,
                                      child: CircleAvatar(
                                        backgroundColor: green217,
                                        radius: 19,
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.edit),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Divider(
                                height: 2,
                                color: Colors.grey,
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    _buildPTText("P.T(Patient): "),
                                    _buildPtSec(),
                                    Spacer(),
                                    _buildPTText("P.T(Patient): "),
                                    _buildPtSec(),
                                    Spacer(),
                                    Divider(
                                      height: 2,
                                      color: Colors.grey,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 2),
                                      child: _buildPTText("INR:"),
                                    ),
                                    _buildPtSec(),
                                  ],
                                ),
                              ),
                              Table(
                                textDirection: TextDirection.rtl,
                                border: TableBorder.all(color: Colors.grey,),
                                children:  [
                                  TableRow(
                                      children: [
                                        _buildDayCell("SUN"),
                                        _buildDayCell("MON"),
                                        _buildDayCell("TUE"),
                                        _buildDayCell("WEB"),
                                        _buildDayCell("THU"),
                                        _buildDayCell("FRI"),
                                        _buildDayCell("SAT"),

                                      ]),
                                ],
                              ),
                              Table(
                                textDirection: TextDirection.rtl,
                                border: TableBorder.all(color: Colors.grey,),
                                children:  [
                                  TableRow(
                                      children: [
                                        _buildTabletCell("1 MG"),
                                        _buildTabletCell("1 MG"),
                                        _buildTabletCell("1 MG"),
                                        _buildTabletCell("1 MG"),
                                        _buildTabletCell("1 MG"),
                                        _buildTabletCell("1 MG"),
                                        _buildTabletCell("1 MG"),

                                      ]),
                                ],
                              )
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        width: double.infinity,
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(
                                    right: 10, top: 10, bottom: 10),
                                child: Row(
                                  children: [
                                    _buildDateIcon(),
                                    _dateText(),
                                    Spacer(),
                                    CircleAvatar(
                                      backgroundColor: blue8,
                                      radius: 20,
                                      child: CircleAvatar(
                                        backgroundColor: green217,
                                        radius: 19,
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.edit),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Divider(
                                height: 2,
                                color: Colors.grey,
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    _buildPTText("P.T(Patient): "),
                                    _buildPtSec(),
                                    Spacer(),
                                    _buildPTText("P.T(Patient): "),
                                    _buildPtSec(),
                                    Spacer(),
                                    Divider(
                                      height: 2,
                                      color: Colors.grey,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 2),
                                      child: _buildPTText("INR:"),
                                    ),
                                    _buildPtSec(),
                                  ],
                                ),
                              ),
                              Table(
                                textDirection: TextDirection.rtl,
                                border: TableBorder.all(color: Colors.grey,),
                                children:  [
                                  TableRow(
                                      children: [
                                        _buildDayCell("SUN"),
                                        _buildDayCell("MON"),
                                        _buildDayCell("TUE"),
                                        _buildDayCell("WEB"),
                                        _buildDayCell("THU"),
                                        _buildDayCell("FRI"),
                                        _buildDayCell("SAT"),

                                      ]),
                                ],
                              ),
                              Table(
                                textDirection: TextDirection.rtl,
                                border: TableBorder.all(color: Colors.grey,),
                                children:  [
                                  TableRow(
                                      children: [
                                        _buildTabletCell("1 MG"),
                                        _buildTabletCell("1 MG"),
                                        _buildTabletCell("1 MG"),
                                        _buildTabletCell("1 MG"),
                                        _buildTabletCell("1 MG"),
                                        _buildTabletCell("1 MG"),
                                        _buildTabletCell("1 MG"),

                                      ]),
                                ],
                              )
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
          bottomNavigationBar: BottomAppBar(
              color: Color.fromARGB(255, 246, 247, 250),
              elevation: 0,
              child: Container(
                  height: 76,
                  padding: const EdgeInsets.only(
                      left: 30.0, right: 30.0, top: 12.0, bottom: 12.0),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        colors: [
                          Color.fromARGB(255, 11, 146, 156),
                          Color.fromARGB(255, 32, 208, 122)
                        ],
                      ),
                      borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(48))),
                  child: _addPatientVisible?Container(
                    height: 1,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        border: Border.all(
                            width: 1.0, color: Color.fromARGB(255, 255, 255, 255)),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  PatientRegistrationPage(title: "kk")));
                        },
                        child: Text(
                          "Add "
                              "Patient Registration",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontFamily: 'Metropolis'),
                        )),
                  ):Text(""))),
      //
    ));
  }

  Widget _buildPtSec() {
    return Text("36 Sec", style: TextStyle(fontSize: 14, color: blue8));
  }
  Widget _buildDayCell(String day){
    return  TableCell(
      verticalAlignment:
      TableCellVerticalAlignment.middle,
      child: Padding(padding: EdgeInsets.all(6),child: Text(day, textAlign: TextAlign.center,
      style: TextStyle(color: Colors.grey,),),)
    );
}
  Widget _buildTabletCell(String day){
    return  TableCell(
        verticalAlignment:
        TableCellVerticalAlignment.middle,
        child: Padding(padding: EdgeInsets.all(6),child: Text(day, textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black54,),),)
    );
  }
  Widget _buildDateIcon() {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Icon(Icons.calendar_today),
    );
  }

  Widget _dateText() {
    return Text(
      "25 Feb 2022",
      style: TextStyle(color: blue8, fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildRange() {
    return Text("2.0 - 3.0",
        style: TextStyle(
            fontSize: 16, color: cardRed, fontWeight: FontWeight.bold));
  }

  Widget _column(String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Diagnosis:", style: TextStyle(fontSize: 16, color: Colors.cyan)),
        Padding(
          padding: EdgeInsets.only(top: 5),
          child: _buildTargetText(
              "Lorem Ipsum is simply dummy text of the printing"),
        )
      ],
    );
  }

  Widget _buildTargetText(String name) {
    return Text(name, style: TextStyle(fontSize: 16, color: gray164));
  }

  Widget _buildPTText(String name) {
    return Text(name, style: TextStyle(fontSize: 14, color: gray164));
  }
}
