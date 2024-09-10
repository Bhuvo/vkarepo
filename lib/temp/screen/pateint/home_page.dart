import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timesmedlite/temp/screen/pateint/patient_registration.dart';
import 'package:timesmedlite/temp/screen/pateint/total_pending_case.dart';



class PatientRegistrationPage extends StatefulWidget {
  PatientRegistrationPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _PatientRegistrationPageState createState() => _PatientRegistrationPageState();
}

class _PatientRegistrationPageState extends State<PatientRegistrationPage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late String email;
  late String password;
  late String name, fname, mname;
  late String number;
  bool _obscureText = true;
  late String gender;
  String groupValue = "male";
  final _formkey = GlobalKey<FormState>();

  valueChanged(e) {
    setState(() {
      if (e == "male") {
        groupValue = e;
        gender = e;
      } else if (e == "female") {
        groupValue = e;
        gender = e;
      }
    });
  }

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
                      Positioned(left: 0,child: Container(
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
                              "Patient Registration".toUpperCase(),
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
                decoration: new BoxDecoration(
                    color: Color.fromARGB(255, 246, 247, 250),
                    border: Border.all(
                        width: 0.0, color: Color.fromARGB(255, 246, 247, 250)),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(48),
                        bottomRight: Radius.circular(48))),
                child: Stack(
                  children: <Widget>[
                    Form(
                      key: _formkey,
                      child: ListView(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(top: 6.0),
                            margin: const EdgeInsets.only(
                                top: 2.0, left: 16.0, right: 16.0),
                            decoration: new BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    width: 0.0,
                                    color: Color.fromARGB(255, 172, 172, 172)),
                                borderRadius: BorderRadius.circular(12.0)),
                            width: double.infinity,
                            height: 55,
                            child: TextField(
                              controller: emailController,
                              decoration: new InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(0, 255, 255, 255),
                                        width: 0.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(0, 255, 255, 255),
                                        width: 0.0),
                                  ),
                                  hintText: 'Patient Registration Number',
                                  hintStyle: TextStyle(color: Colors.black45)),
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontFamily: 'Metropolis-Regular'),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 6.0),
                            margin: const EdgeInsets.only(
                                top: 12.0, left: 16.0, right: 16.0),
                            decoration: new BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    width: 1.0,
                                    color: Color.fromARGB(255, 172, 172, 172)),
                                borderRadius: BorderRadius.circular(12.0)),
                            width: double.infinity,
                            height: 55,
                            child: TextField(
                              controller: emailController,
                              decoration: new InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(0, 255, 255, 255),
                                        width: 0.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(0, 255, 255, 255),
                                        width: 0.0),
                                  ),
                                  hintText: 'First Name',
                                  hintStyle: TextStyle(color: Colors.black45)),
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontFamily: 'Metropolis-Regular'),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 6.0),
                            margin: const EdgeInsets.only(
                                top: 12.0, left: 16.0, right: 16.0),
                            decoration: new BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    width: 1.0,
                                    color: Color.fromARGB(255, 172, 172, 172)),
                                borderRadius: BorderRadius.circular(12.0)),
                            width: double.infinity,
                            height: 55,
                            child: TextField(
                              controller: emailController,
                              decoration: new InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(0, 255, 255, 255),
                                        width: 0.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(0, 255, 255, 255),
                                        width: 0.0),
                                  ),
                                  hintText: 'Last Name',
                                  hintStyle: TextStyle(color: Colors.black45)),
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontFamily: 'Metropolis-Regular'),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 6.0),
                            margin: const EdgeInsets.only(
                                top: 12.0, left: 16.0, right: 16.0),
                            decoration: new BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    width: 1.0,
                                    color: Color.fromARGB(255, 172, 172, 172)),
                                borderRadius: BorderRadius.circular(12.0)),
                            width: double.infinity,
                            height: 55,
                            child: TextField(
                              controller: emailController,
                              decoration: new InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(0, 255, 255, 255),
                                        width: 0.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(0, 255, 255, 255),
                                        width: 0.0),
                                  ),
                                  hintText: 'Age',
                                  hintStyle: TextStyle(color: Colors.black45)),
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontFamily: 'Metropolis-Regular'),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 12.0, left: 16.0),
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Gender",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14.0,
                                  fontFamily: 'Metropolis'),
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.only(top: 12.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                          height: 90,
                                          width: 134,
                                          margin: const EdgeInsets.only(
                                              left: 16.0, right: 6.0),
                                          alignment: Alignment.center,
                                          decoration: new BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  width: 1.0,
                                                  color: Color.fromARGB(
                                                      255, 172, 172, 172)),
                                              borderRadius:
                                              BorderRadius.circular(12.0)),
                                          child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: <Widget>[
                                                Container(
                                                    height: 24,
                                                    width: 24,
                                                    child: Image.asset(
                                                        'assets/malegender.png')),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 6.0),
                                                  child: Text(
                                                    "Male",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16.0,
                                                        fontFamily: 'Metropolis'),
                                                  ),
                                                )
                                              ]),
                                        )),
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                          height: 90,
                                          width: 134,
                                          margin: const EdgeInsets.only(
                                              left: 6.0, right: 16.0),
                                          alignment: Alignment.center,
                                          decoration: new BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  width: 1.0,
                                                  color: Color.fromARGB(
                                                      255, 172, 172, 172)),
                                              borderRadius:
                                              BorderRadius.circular(12.0)),
                                          child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: <Widget>[
                                                Container(
                                                    height: 24,
                                                    width: 24,
                                                    child: Image.asset(
                                                        'assets/femenine.png')),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 6.0),
                                                  child: Text(
                                                    "Female",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16.0,
                                                        fontFamily: 'Metropolis'),
                                                  ),
                                                )
                                              ]),
                                        ))
                                  ])),
                          Container(
                            padding: const EdgeInsets.only(top: 6.0),
                            margin: const EdgeInsets.only(
                                top: 12.0, left: 16.0, right: 16.0),
                            decoration: new BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    width: 1.0,
                                    color: Color.fromARGB(255, 172, 172, 172)),
                                borderRadius: BorderRadius.circular(12.0)),
                            width: double.infinity,
                            height: 55,
                            child: TextField(
                              controller: emailController,
                              decoration: new InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(0, 255, 255, 255),
                                        width: 0.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(0, 255, 255, 255),
                                        width: 0.0),
                                  ),
                                  hintText: 'Phone Number',
                                  hintStyle: TextStyle(color: Colors.black45)),
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontFamily: 'Metropolis-Regular'),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 6.0),
                            margin: const EdgeInsets.only(
                                top: 12.0, left: 16.0, right: 16.0),
                            decoration: new BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    width: 1.0,
                                    color: Color.fromARGB(255, 172, 172, 172)),
                                borderRadius: BorderRadius.circular(12.0)),
                            width: double.infinity,
                            height: 55,
                            child: TextField(
                              controller: emailController,
                              decoration: new InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(0, 255, 255, 255),
                                        width: 0.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(0, 255, 255, 255),
                                        width: 0.0),
                                  ),
                                  hintText: 'Watsapp Number',
                                  hintStyle: TextStyle(color: Colors.black45)),
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontFamily: 'Metropolis-Regular'),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 6.0),
                            margin: const EdgeInsets.only(
                                top: 12.0, left: 16.0, right: 16.0),
                            decoration: new BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    width: 1.0,
                                    color: Color.fromARGB(255, 172, 172, 172)),
                                borderRadius: BorderRadius.circular(12.0)),
                            width: double.infinity,
                            height: 55,
                            child: TextField(
                              controller: emailController,
                              decoration: new InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(0, 255, 255, 255),
                                        width: 0.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(0, 255, 255, 255),
                                        width: 0.0),
                                  ),
                                  hintText: 'Mail Id',
                                  hintStyle: TextStyle(color: Colors.black45)),
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontFamily: 'Metropolis-Regular'),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 6.0),
                            margin: const EdgeInsets.only(
                                top: 12.0, left: 16.0, right: 16.0),
                            decoration: new BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    width: 1.0,
                                    color: Color.fromARGB(255, 172, 172, 172)),
                                borderRadius: BorderRadius.circular(12.0)),
                            width: double.infinity,
                            height: 55,
                            child: TextField(
                              controller: emailController,
                              decoration: new InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(0, 255, 255, 255),
                                        width: 0.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(0, 255, 255, 255),
                                        width: 0.0),
                                  ),
                                  hintText: 'Password',
                                  hintStyle: TextStyle(color: Colors.black45)),
                              keyboardType: TextInputType.visiblePassword,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontFamily: 'Metropolis-Regular'),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 12.0, left: 16.0),
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Target INR",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14.0,
                                  fontFamily: 'Metropolis'),
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.only(top: 12.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        height: 55,
                                        width: 134,
                                        margin: const EdgeInsets.only(
                                            top: 6.0, left: 16.0, right: 6.0),
                                        alignment: Alignment.center,
                                        decoration: new BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                width: 1.0,
                                                color: Color.fromARGB(
                                                    255, 172, 172, 172)),
                                            borderRadius:
                                            BorderRadius.circular(12.0)),
                                        child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                alignment: Alignment.topLeft,
                                                margin: const EdgeInsets.only(
                                                    top: 6.0,
                                                    left: 16.0,
                                                    right: 6.0),
                                                child: Text(
                                                  "From",
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16.0,
                                                      fontFamily: 'Metropolis'),
                                                ),
                                              ),
                                            ]),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                          height: 55,
                                          width: 134,
                                          margin: const EdgeInsets.only(
                                              top: 6.0, left: 6.0, right: 16.0),
                                          alignment: Alignment.center,
                                          decoration: new BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  width: 1.0,
                                                  color: Color.fromARGB(
                                                      255, 172, 172, 172)),
                                              borderRadius:
                                              BorderRadius.circular(12.0)),
                                          child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: <Widget>[
                                                Container(
                                                  alignment: Alignment.topLeft,
                                                  margin: const EdgeInsets.only(
                                                      top: 6.0, left: 12.0),
                                                  child: Text(
                                                    "To",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16.0,
                                                        fontFamily: 'Metropolis'),
                                                  ),
                                                )
                                              ]),
                                        ))
                                  ])),
                          Container(
                              margin:
                              const EdgeInsets.only(top: 12.0, bottom: 16.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                        child: Container(
                                          height: 55,
                                          width: 134,
                                          margin: const EdgeInsets.only(
                                              left: 16.0, right: 6.0),
                                          alignment: Alignment.center,
                                          decoration: new BoxDecoration(
                                              color: Colors.pinkAccent,
                                              border: Border.all(
                                                  width: 0.0,
                                                  color: Color.fromARGB(
                                                      255, 172, 172, 172)),
                                              borderRadius:
                                              BorderRadius.circular(12.0)),
                                          child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: <Widget>[
                                                Container(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "Close",
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16.0,
                                                        fontFamily: 'Metropolis'),
                                                  ),
                                                ),
                                              ]),
                                        )),
                                    Expanded(
                                      child: Container(
                                        height: 55,
                                        width: 134,
                                        margin: const EdgeInsets.only(
                                            left: 6.0, right: 16.0),
                                        alignment: Alignment.center,
                                        decoration: new BoxDecoration(
                                            color: Colors.yellow,
                                            border: Border.all(
                                                width: 0.0,
                                                color: Color.fromARGB(
                                                    255, 172, 172, 172)),
                                            borderRadius:
                                            BorderRadius.circular(12.0)),
                                        child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                alignment: Alignment.center,
                                                child: TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                              TotalPendingCasePage1(title: '',)));
                                                    },
                                                    child: Text(
                                                      "Save",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                          fontFamily: 'Metropolis'),
                                                    )),
                                              )
                                            ]),
                                      ),
                                    )
                                  ]))
                        ],
                      ),
                    ),
                  ],
                )),
          ),
          bottomNavigationBar: BottomAppBar(
              color: Color.fromARGB(255, 246, 247, 250),
              elevation: 0,
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                      colors: [
                        Color.fromARGB(255, 11, 146, 156),
                        Color.fromARGB(255, 32, 208, 122)
                      ],
                    ),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(48))),
              )),
          // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}