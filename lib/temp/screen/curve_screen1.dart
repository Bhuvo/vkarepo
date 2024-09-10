import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timesmedlite/temp/screen/patient_inr_screen.dart';
import 'package:timesmedlite/temp/screen/patient_inr_screen.dart';
import 'package:timesmedlite/temp/widgets/circle_border.dart';

import '../constant/colors.dart';

class ClippingApp1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(

          appBar: AppBar(
            elevation: 0,
            toolbarHeight: 140,
            titleSpacing: 0.00,
            title: Stack(
              children: <Widget>[
                Container(
                    height: 140.0,
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
                      Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: const EdgeInsets.only(top: 24.0, left: 12.0),
                            height: 16,
                            width: 16,
                            alignment: Alignment.center,
                            child: IconButton(
                              icon: Icon(Icons.menu, color: Colors.white),
                              onPressed: () {},
                            ),
                          )),
                      Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                              margin: const EdgeInsets.only(top: 36.0),
                              child: Text(
                                "Patient Profile".toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Metropolis'),
                              ))),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              margin:
                              const EdgeInsets.only(left: 24.0, right: 24.0),
                              child: SizedBox(
                                  height: 0.5,
                                  width: double.infinity,
                                  child: const DecoratedBox(
                                    decoration:
                                    const BoxDecoration(color: Colors.white),
                                  )))),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Row(children: <Widget>[
                            Container(
                                margin:
                                const EdgeInsets.only(left: 18.0, bottom: 16.0),
                                height: 32,
                                width: 32,
                                alignment: Alignment.center,
                                decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(255, 113, 226, 240),
                                  border: Border.all(
                                      width: 1.0,
                                      color: Color.fromARGB(255, 255, 255, 255)),
                                ),
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  alignment: Alignment.center,
                                  child: Image.asset('assets/profile_user.png'),
                                )),
                            Container(
                                margin:
                                const EdgeInsets.only(left: 6.0, bottom: 12.0),
                                child: Text(
                                  "Admin",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Metropolis'),
                                ))
                          ])),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                              width: 100,
                              margin: const EdgeInsets.only(right: 18.0),
                              child: Row(children: <Widget>[
                                Container(
                                    margin: const EdgeInsets.only(
                                        left: 18.0, bottom: 16.0),
                                    height: 32,
                                    width: 32,
                                    alignment: Alignment.center,
                                    decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromARGB(255, 64, 212, 142),
                                      border: Border.all(
                                          width: 1.0,
                                          color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                    ),
                                    child: Container(
                                      height: 16,
                                      width: 16,
                                      alignment: Alignment.center,
                                      child: Image.asset('assets/profile_icon.png'),
                                    )),
                                Container(
                                    margin: const EdgeInsets.only(
                                        left: 18.0, bottom: 16.0),
                                    height: 32,
                                    width: 32,
                                    alignment: Alignment.center,
                                    decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromARGB(255, 64, 212, 142),
                                      border: Border.all(
                                          width: 1.0,
                                          color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                    ),
                                    child: Container(
                                      height: 16,
                                      width: 16,
                                      alignment: Alignment.center,
                                      child: Image.asset('assets/logout.png'),
                                    ))
                              ])))
                    ])),
              ],
            ),
            backgroundColor: Color.fromARGB(255, 246, 247, 250),
          ),
          backgroundColor: Color.fromARGB(255, 246, 247, 250),
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
                  padding: const EdgeInsets.only(top: 24.0, bottom: 18.0),
                  decoration: new BoxDecoration(
                      color: Color.fromARGB(255, 246, 247, 250),
                      border: Border.all(
                          width: 0.0, color: Color.fromARGB(255, 246, 247, 250)),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(48),
                          bottomRight: Radius.circular(48))),
                  child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1 / .6,
                      shrinkWrap: true,
                      children: List.generate(4, (index) {
                        return Container(
                          height: 100,
                          child: Card(
                            color: _cardColor(index),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children:  [
                                _buildPrice(),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text("Total Patient",
                                      style: TextStyle(color: Colors.white)),
                                ),
                                _buildRegesitration()
                              ],
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        );
                      }),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const PatientInrScreen(title: "safsdf")),
                        );
                      },
                      child: Container(
                        height: 100,
                        width: double.infinity,
                        child: Card(
                          color: Colors.red,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _buildPrice(),
                              Padding(
                                padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                                child: Text("Total Patient",
                                    style: TextStyle(color: Colors.white)),
                              ),
                              _buildRegesitration()
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    )
                  ]))),
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
  Widget _buildPrice(){
    return  Padding(
      padding: EdgeInsets.all(10),
      child: Text(
        "10",
        style: TextStyle(color: Colors.white,fontSize: 20),
      ),
    );
  }
  Widget _buildRegesitration(){
    return  Align(
        alignment: Alignment.bottomRight,
        child:Padding(padding: EdgeInsets.only(left: 10,right: 10),
          child:  Text("Total Patient",
            style: TextStyle(color: Colors.white),
          ),
        )
    );
  }
  Color _cardColor(int index) {
    if (index == 0) return cardBlue;
    if (index == 1) return cardDarkBlue;
    if (index == 2) return cardGreen;
    if (index == 3) return cardYellow;
    return cardRed;
  }
}


