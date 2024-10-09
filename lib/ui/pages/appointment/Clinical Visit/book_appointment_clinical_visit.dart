import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/widgets/m_text_field.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../routes/routes.dart';
import '../../../theme/theme.dart';
import '../../../widgets/m_row_text_radio_widget.dart';
import '../../../widgets/m_scaffold.dart';
import '../../dashboard/dashboard_header.dart';
import 'controller/controller.dart';
import 'model/city_model.dart';
import 'model/location_model.dart';
import 'model/speciality_model.dart';
import 'model/state_model.dart';

class BookAnAppointmentClinicalVisit extends StatefulWidget {
  const BookAnAppointmentClinicalVisit({Key? key}) : super(key: key);

  @override
  State<BookAnAppointmentClinicalVisit> createState() =>
      _BookAnAppointmentClinicalVisitState();
}

class _BookAnAppointmentClinicalVisitState
    extends State<BookAnAppointmentClinicalVisit> {
  final List<String> cityList = ['New York', 'Los Angeles', 'Chicago', 'Houston', 'Phoenix', 'San Antonio'];

  Widget optionBuilder(Iterable<String> options,AutocompleteOnSelected<String> onSelected) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Material(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: ListView.builder(
            itemCount: options.length,
            itemBuilder: (BuildContext context, int index) {
              final String option = options.elementAt(index);
              return GestureDetector(
                onTap: () => onSelected(option),
                child: ListTile(
                  title: Text(option),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  ClinicalVisitController controller = ClinicalVisitController();

  @override
  void initState() {
    getData();
    super.initState();
  }

  String choose = 'Chennai';

  void getData() async{
    await controller.getStateList();

    setState(() {

    });
  }
   GlobalKey<FormState> form1 = GlobalKey();
   GlobalKey<FormState> form2 = GlobalKey();
   GlobalKey<FormState> form3 = GlobalKey();
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
              MRowTextRadioWidget(enabled: true,initialValue: 'Chennai',isneedDivider: false,onChanged: (val){
                setState(() {
                  choose = val;
                });
              },title: 'Select City',options: ['Chennai' ,'Other City'],),
              if(choose == 'Other City')...{
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: size.width * 0.65,
                          child:  Autocomplete<StateModel>(
                            // optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
                            //   return optionBuilder( options, onSelected);
                            // },
                            optionsBuilder: (TextEditingValue textEditingValue) {
                              // return controller.stateData;
                              if (textEditingValue.text.isEmpty) {
                                return const Iterable<StateModel>.empty();
                              }
                              return controller.stateData.where((StateModel state) {
                                return state.stateName?.toLowerCase().contains(textEditingValue.text.toLowerCase()) ?? false;
                              });
                            },
                            fieldViewBuilder: (BuildContext context, TextEditingController textEditingController, FocusNode focusNode, VoidCallback onFieldSubmitted) {
                              return MTextField(
                                controller: textEditingController,
                                focusNode: focusNode,
                                label:'Select State',
                                suffixIcon:Icon(
                                  FontAwesomeIcons.angleDown,
                                  color: Colors.grey.shade500,
                                  size: size.height * 0.025,
                                ) ,
                                // decoration: InputDecoration(
                                //   labelText: 'Select State',
                                //   suffixIcon: Icon(
                                //     FontAwesomeIcons.angleDown,
                                //     color: Colors.grey.shade500,
                                //     size: size.height * 0.025,
                                //   ),
                                // ),

                              );
                            },
                            onSelected: (var selection) async {
                              await controller.getCityList(selection.stateId ?? 31);
                              setState(() {
                                controller.selectedState = selection;
                              });
                              print('You selected: $selection');
                            },
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.015,
                        ),SizedBox(
                          width: size.width * 0.65,
                          child:  Autocomplete<CityModel>(
                            // optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
                            //   return optionBuilder( options, onSelected);
                            // },
                            optionsBuilder: (TextEditingValue textEditingValue) {
                              // return controller.cityData;
                              if (textEditingValue.text.isEmpty) {
                                return const Iterable<CityModel>.empty();
                              }
                              return controller.cityData.where((CityModel city) {
                                return city.cityName?.toLowerCase().contains(textEditingValue.text.toLowerCase()) ?? false;
                              });
                            },
                            fieldViewBuilder: (BuildContext context, TextEditingController textEditingController, FocusNode focusNode, VoidCallback onFieldSubmitted) {
                              return Form(
                                key: form1,
                                child: MTextField(
                                  controller: textEditingController,
                                  focusNode: focusNode,
                                  label:'Select City',
                                  suffixIcon:Icon(
                                    FontAwesomeIcons.angleDown,
                                    color: Colors.grey.shade500,
                                    size: size.height * 0.025,
                                  ),
                                  validator: (val){
                                    if(controller.selectedState.stateId == null){
                                      return 'Please select state';
                                    }else{
                                      return '';
                                    }
                                  },
                                  onChanged: (val)async{
                                    if(controller.selectedState.stateId == null){
                                      if(form1.currentState!.validate()){
                                        print('form validated');
                                      }else{
                                        textEditingController.clear();
                                        print('form not validated');
                                      }
                                    }else{
                                    }

                                  },
                                  // decoration: InputDecoration(
                                  //   labelText: 'Select City',
                                  //   suffixIcon: Icon(
                                  //     FontAwesomeIcons.angleDown,
                                  //     color: Colors.grey.shade500,
                                  //     size: size.height * 0.025,
                                  //   ),
                                  // ),

                                ),
                              );
                            },
                            onSelected: (var selection) async {
                              // await controller.getLocationList(controller.selectedState.stateId?? 31, selection.cityId?? 1);
                              setState(() {
                                controller.selectedCity = selection;
                              });
                              // controller.selectedCity = selection;
                              print('You selected: $selection');
                            },
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.015,
                        ),
                        // SizedBox(
                        //   width: size.width * 0.65,
                        //   child: Autocomplete<LocationModel>(
                        //     // optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
                        //     //   return optionBuilder( options, onSelected);
                        //     // },
                        //     optionsBuilder: (TextEditingValue textEditingValue) {
                        //       //return cityList;
                        //       if (textEditingValue.text.isEmpty) {
                        //         return const Iterable<LocationModel>.empty();
                        //       }
                        //       return controller.locationData.where((LocationModel location) {
                        //         return location.locationName?.toLowerCase().contains(textEditingValue.text.toLowerCase()) ?? false;
                        //       });
                        //     },
                        //     fieldViewBuilder: (BuildContext context, TextEditingController textEditingController, FocusNode focusNode, VoidCallback onFieldSubmitted) {
                        //       return Form(
                        //         key: form2,
                        //         child: MTextField(
                        //           controller: textEditingController,
                        //           focusNode: focusNode,
                        //           // decoration: InputDecoration(
                        //           //   labelText: 'Select Location',
                        //           //   suffixIcon: Icon(
                        //           //     FontAwesomeIcons.angleDown,
                        //           //     color: Colors.grey.shade500,
                        //           //     size: size.height * 0.025,
                        //           //   ),
                        //           // ),
                        //
                        //           label:'Select Location',
                        //           suffixIcon:Icon(
                        //             FontAwesomeIcons.angleDown,
                        //             color: Colors.grey.shade500,
                        //             size: size.height * 0.025,
                        //           ),
                        //           validator: (val){
                        //             if(controller.selectedCity.cityId == null){
                        //               return 'Please select city';
                        //             }else{
                        //               return '';
                        //             }
                        //           },
                        //           onChanged: (val)async{
                        //            if(controller.selectedCity.cityId == null){
                        //              if(form2.currentState!.validate()){
                        //                // await controller.getLocationList(controller.selectedState.stateId ?? 31, controller.selectedCity.cityId?? 1);
                        //                print('form validated');
                        //              }else{
                        //                textEditingController.clear();
                        //                print('form not validated');
                        //              }
                        //            }else{
                        //
                        //            }
                        //           },
                        //         ),
                        //       );
                        //     },
                        //     onSelected: (var selection) {
                        //       controller.selectedLocation = selection;
                        //       print('You selected: $selection');
                        //     },
                        //   ),
                        // )
                      ],
                    ),
                    // SizedBox(
                    //   width: size.width * 0.05,
                    // ),
                    // Card(
                    //   child: Padding(
                    //     padding: EdgeInsets.all(size.width * 0.02),
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.center,
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         SizedBox(
                    //           height: size.height * 0.022,
                    //         ),
                    //         const Icon(
                    //           FontAwesomeIcons.locationDot,
                    //           color: MTheme.BUTTON_COLOR,
                    //         ),
                    //         SizedBox(
                    //           height: size.height * 0.015,
                    //         ),
                    //         const Text("Near Me"),
                    //         SizedBox(
                    //           height: size.height * 0.022,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // )
                  ],
                ),
                SizedBox(
                  height: size.height * 0.018,
                ),
              },
              // SizedBox(
              //   width: size.width,
              //   child: TextField(
              //     decoration: InputDecoration(
              //       labelText: 'Search By Hospital Name ',
              //       suffixIcon: Icon(
              //         FontAwesomeIcons.magnifyingGlass,
              //         size: size.height * 0.025,
              //       ), // Replace this with the desired icon
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: size.height * 0.018,
              // ),
              // SizedBox(
              //   width: size.width,
              //   child: TextField(
              //     decoration: InputDecoration(
              //       labelText: 'Select Speciality',
              //       suffixIcon: Icon(
              //         FontAwesomeIcons.angleDown,
              //         color: Colors.grey.shade500,
              //         size: size.height * 0.025,
              //       ), // Replace this with the desired icon
              //     ),
              //   ),
              // ),
              Autocomplete<SpecialityModel>(
                // key: ValueKey('speciality::${controller.specialityData.length}'),
                // optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
                //   return optionBuilder( options, onSelected);
                // },
                optionsBuilder: (TextEditingValue textEditingValue) async {
                  //return cityList;

                  await controller.getSpecialityList(textEditingValue.text);

                  if (textEditingValue.text.isEmpty) {
                    return const Iterable<SpecialityModel>.empty();
                  }

                  return controller.specialityData;

                  print('specialityData: ${controller.specialityData}');
                  final queried = controller.specialityData.where((SpecialityModel speciality) {
                    return speciality.subCategoryName?.toLowerCase().contains(textEditingValue.text.toLowerCase()) ?? false;
                  });
                  print('queried: $queried');

                  return queried;
                },
                fieldViewBuilder: (BuildContext context, TextEditingController textEditingController, FocusNode focusNode, VoidCallback onFieldSubmitted) {
                  return MTextField(
                      controller: textEditingController,
                      focusNode: focusNode,
                      label:'Select Speciality',
                      suffixIcon:Icon(
                        FontAwesomeIcons.angleDown,
                        color: Colors.grey.shade500,
                        size: size.height * 0.025,
                      ),
                      validator: (val){
                        if(choose  ==' Chennai'){
                          return null;
                        }
                        if(controller.selectedCity.cityId == null){
                          return 'Please select city';
                        }else{
                          return null;
                        }
                      },
                      onChanged: (val) async {
                        if(kDebugMode){
                          print('Select speciality onChanged: $val');
                        }


                          // await Future.delayed(Duration(seconds: 1));
                          // setState(() {
                          // });
                      }
                  );
                },
                onSelected: (var selection) {
                  controller.selectedSpeciality = selection;
                  print('You selected: $selection');
                },
              ),
              SizedBox(
                height: size.height * 0.018,
              ),
              SizedBox(
                height: size.height * 0.4,
              ),
              // Container(
              //   margin: EdgeInsets.symmetric(
              //     horizontal: size.width * 0.045,
              //     vertical: size.height * 0.01,
              //   ),
              //   width: double.maxFinite,
              //   height: MediaQuery.of(context).size.height * 0.07,
              //   child: ,
              // ),
              ],
          ),
        ),
      ),
      bottom: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
        child: OutlinedButton(
          onPressed: () {
            if(choose == 'Chennai'){
              controller.selectedCity = CityModel( cityId: 1, cityName: 'Chennai');
              controller.selectedState = StateModel( stateId: 31, stateName: 'Tamil Nadu');
              context.push(Routes.DoctorsListForClinicalVisit, {
                'controller' : controller
              });
            }
            context.push(Routes.DoctorsListForClinicalVisit, {
              'controller' : controller
            });
          },
          child: Text(
            'Select Doctor',
            style: TextStyle(
              color: Colors.black,
              fontSize: size.height * 0.02,
            ),
          ),
        ),
      ),
    );

  }
}


