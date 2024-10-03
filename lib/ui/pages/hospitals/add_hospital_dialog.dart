import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:timesmedlite/ui/components/file_upload.dart';
import 'package:timesmedlite/ui/widgets/m_dialog.dart';
import 'package:timesmedlite/ui/widgets/m_phone_field.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../di/dependency_injection.dart';
import '../../../utils/local_storage.dart';
import '../../components/api_builder/api_builder.dart';
import '../../components/api_builder/api_builder_bloc.dart';
import '../../components/shimmer/drop_down_shimmer.dart';
import '../../components/show_message.dart';
import '../../components/waiting_dialog.dart';
import '../../routes/routes.dart';
import 'package:http/http.dart' as http;

class AddHospitalDialog extends StatefulWidget {
  AddHospitalDialog({Key? key, required this.blocGetAllHospitalByDoctor})
      : super(key: key);

  ApiBuilderBloc blocGetAllHospitalByDoctor;

  @override
  State<AddHospitalDialog> createState() => _AddHospitalDialogState();
}

class _AddHospitalDialogState extends State<AddHospitalDialog> {
  final GlobalKey<FormState> form = GlobalKey();

  var selectedfile;

  final TextEditingController hospitalType = TextEditingController();
  final TextEditingController hospitalName = TextEditingController();
  final TextEditingController hospitalPhoneNumber = TextEditingController();
  final TextEditingController hospitalPassword = TextEditingController();

  // final TextEditingController hospitalCountryID = TextEditingController();
  // final TextEditingController hospitalStateID = TextEditingController();
  // final TextEditingController hospitalCityID = TextEditingController();
  // final TextEditingController hospitalLocationID = TextEditingController();
  final TextEditingController hospitalCountry = TextEditingController();
  final TextEditingController hospitalState = TextEditingController();
  final TextEditingController hospitalCity = TextEditingController();
  final TextEditingController hospitalLocation = TextEditingController();
  TextEditingController hospitalLatitude = TextEditingController();
  TextEditingController hospitalLongitude = TextEditingController();
  final TextEditingController hospitalAddress = TextEditingController();

  var hospitalCountryID, hospitalLocationID, hospitalStateID, hospitalCityID;

  final ApiBuilderBloc country_list_bloc =
      ApiBuilderBloc(path: 'CoutryList', api2: true);

  ApiBuilderBloc state_list_bloc = ApiBuilderBloc(
      path: 'StateByCountry', query: {'Country_id': 1}, api2: true);

  ApiBuilderBloc city_list_bloc =
      ApiBuilderBloc(path: 'CityByState', query: {'State_id': 31}, api2: true);

  ApiBuilderBloc location_list_bloc = ApiBuilderBloc(
      path: 'LocationByCity',
      query: {'City_id': 1, 'State_id': 31},
      api2: true);

  Map<String, dynamic>? countryname, statename, cityname, locationname;

  late bool isLoading;
  var latitude;
  var longitude;

  void getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are disabled, handle accordingly
      return;
    }

    // Request location permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      // Permission is denied forever, handle accordingly
      return;
    }

    if (permission == LocationPermission.denied) {
      // Request permission to access location
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        // Permission denied, handle accordingly
        return;
      }
    }

    // Get the current position
    Position position;
    try {
      position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        latitude = position.latitude;
        longitude = position.longitude;

        hospitalLatitude = latitude;
        hospitalLongitude = longitude;
        isLoading = false;
        print(latitude);
        print(longitude);
      });
    } catch (e) {
      // Handle any error that occurred during location retrieval
      print(e.toString());
      setState(() {
        isLoading = false;
      });
    }
  }

  TextEditingController latitudeController = TextEditingController();
  TextEditingController longitudeController = TextEditingController();

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    Position? currentPosition;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Handle location services disabled
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        // Handle location permission denied
        return;
      }
    }

    currentPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      latitudeController.text = currentPosition!.latitude.toString();
      longitudeController.text = currentPosition.longitude.toString();
    });

    print('Latitude: ${currentPosition.latitude}');
    print('Longitude: ${currentPosition.longitude}');
  }

  @override
  void initState() {
    super.initState();
    print("get current location function starts");
    _getCurrentLocation();
    print("get current location function ends");
  }

  @override
  Widget build(BuildContext context) {
    print('Data below');
    print(countryname);
    print(statename);
    print(cityname);
    print(locationname);
    return MDialog(
      title: Row(
        children: [
          const Text('HOSPITAL ADD / DELETE'),
          const Spacer(),
          IconButton(
              onPressed: () {
                context.popDialog();
              },
              icon: const Icon(Icons.close_rounded))
        ],
      ),
      child: Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: form,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  MListTile(
                    margin: EdgeInsets.all(0),
                    padding: EdgeInsets.all(16),
                    child: MRadioChip<String>(
                      value: hospitalType.text,
                      onChanged: (d) {
                        setState(() {
                          hospitalType.text = d;
                          print(hospitalType.text);
                        });
                      },
                      items: const [
                        MRadioItem(
                            value: 'Own',
                            icon: FontAwesomeIcons.hospitalUser,
                            label: 'Own'),
                        MRadioItem(
                            value: 'Consultan Hospital',
                            icon: FontAwesomeIcons.hospital,
                            label: 'Consultan Hospital'),
                      ],
                      label: 'Hospital Type',
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  MTextField(
                    label: 'Hospital Name',
                    controller: hospitalName,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  // MPhoneField(
                  //   label: 'Mobile Number',
                  //   controller: hospitalPhoneNumber,
                  // ),
                  MTextField(
                    label: 'Mobile Number',
                    prefixIcon: const Icon(Icons.phone),
                    type: MInputType.phone,
                    controller: hospitalPhoneNumber,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  MTextField(
                    label: 'Password',
                    type: MInputType.password,
                    controller: hospitalPassword,
                    onChanged: (v) {
                      print(
                          "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::hospitalpassowrd$v");
                    },
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  BlocProvider(
                    create: (_) => country_list_bloc..add(const Load()),
                    child: ApiBuilder(
                      loading: const DropDownShimmer(
                        label: 'Country',
                      ),
                      jsonBuilder: (countrylist, load) {
                        return MDialogDown<Map<String, dynamic>>(
                            required: false,
                            items: countrylist,
                            label: 'Country',
                            // controller: hospitalCountry,
                            onChanged: (d) {
                              setState(() {
                                countryname = d;
                                statename = null;
                                cityname = null;
                                locationname = null;
                                print(
                                    "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::DDDDDDDDDDDDDDDDDDDDDDD$d");

                                hospitalCountryID = d!['Country_id'].toString();
                                state_list_bloc = ApiBuilderBloc(
                                    path: 'StateByCountry',
                                    query: {'Country_id': d!['Country_id']},
                                    api2: true);
                                print(
                                    "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::C  ${hospitalCountryID}");
                              });
                            },
                            value: countryname,
                            labelKey: 'Country_Name');
                      },
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  countryname == null
                      ? Container()
                      : BlocProvider(
                          create: (_) => state_list_bloc..add(const Load()),
                          child: ApiBuilder(
                            loading: const DropDownShimmer(
                              label: 'State',
                            ),
                            jsonBuilder: (statelist, load) {
                              return MDialogDown<Map<String, dynamic>>(
                                  items: statelist,
                                  required: false,
                                  label: 'State',
                                  // controller: hospitalState,
                                  onChanged: (d) {
                                    setState(() {
                                      statename = d;
                                      cityname = null;
                                      locationname = null;
                                      hospitalStateID =
                                          d!['State_id'].toString();
                                      city_list_bloc = ApiBuilderBloc(
                                          path: 'CityByState',
                                          query: {'State_id': d['State_id']},
                                          api2: true);
                                      print(
                                          "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::C  ${hospitalStateID}");
                                    });
                                  },
                                  value: statename,
                                  labelKey: 'State_Name');
                            },
                          ),
                        ),
                  SizedBox(
                    height: 12,
                  ),
                  statename == null
                      ? Container()
                      : BlocProvider(
                          create: (_) => city_list_bloc..add(const Load()),
                          child: ApiBuilder(
                            loading: const DropDownShimmer(
                              label: 'City',
                            ),
                            jsonBuilder: (citylist, load) {
                              return MDialogDown<Map<String, dynamic>>(
                                  items: citylist,
                                  required: false,
                                  label: 'City',
                                  // controller: hospitalCity,
                                  onChanged: (d) {
                                    setState(() {
                                      cityname = d;
                                      locationname = null;
                                      hospitalCityID = d!['City_id'].toString();
                                      location_list_bloc = ApiBuilderBloc(
                                          path: 'LocationByCity',
                                          query: {
                                            'City_id': d['City_id'],
                                            'State_id': d['State_id']
                                          },
                                          api2: true);

                                      print(
                                          "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::C  ${hospitalCityID}");
                                    });
                                  },
                                  value: cityname,
                                  labelKey: 'City_Name');
                            },
                          ),
                        ),
                  SizedBox(
                    height: 12,
                  ),
                  cityname == null
                      ? Container()
                      : BlocProvider(
                          create: (_) => location_list_bloc..add(const Load()),
                          child: ApiBuilder(
                            empty: Container(),
                            loading: const DropDownShimmer(
                              label: 'Location',
                            ),
                            jsonBuilder: (locationlist, load) {
                              return MDialogDown<Map<String, dynamic>>(
                                  items: locationlist,
                                  required: false,
                                  label: 'Location',
                                  // controller: hospitalLocation,
                                  onChanged: (d) {
                                    setState(() {
                                      locationname = d;
                                      hospitalLocationID =
                                          d!['Location_id'].toString();
                                      print(
                                          "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::C  ${hospitalLocationID}");
                                    });
                                  },
                                  value: locationname,
                                  labelKey: 'Location_Name');
                            },
                          ),
                        ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Current Location',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: MTextField(
                          label: 'Latitude',
                          type: MInputType.decimal,
                          controller: latitudeController,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: MTextField(
                          label: 'Longitude',
                          type: MInputType.decimal,
                          controller: longitudeController,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  MTextField(
                    label: 'Hospital Address',
                    controller: hospitalAddress,
                    minLines: 3,
                    maxLines: 5,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    height: 50,
                    child: OutlinedButton(
                        onPressed: () async {
                          print(hospitalLocationID);
                          print(hospitalCityID);
                          print(hospitalStateID);
                          print(hospitalCountryID);
                          hospitalLocationID == null
                              ? hospitalLocationID = 1915.toString()
                              : null;
                          hospitalCityID == null
                              ? hospitalCityID = 1.toString()
                              : null;
                          hospitalStateID == null
                              ? hospitalStateID = 31.toString()
                              : null;
                          hospitalCountryID == null
                              ? hospitalCountryID = 1.toString()
                              : null;
                          print(hospitalLocationID);
                          print(hospitalCityID);
                          print(hospitalStateID);
                          print(hospitalCountryID);
                          if (form.currentState!.validate()) {
                            showWaitingDialog(context: context);
                            final res = await Injector()
                                .apiService
                                .post2(path: 'HospitalAdd', query: {
                              //"Doctor_Id": 38371,
                              "Doctor_Id": LocalStorage.getUID(),
                              "Hospital_id": 0,
                              "Password": hospitalPassword.text,
                              "Hospital_Name": hospitalName.text,
                              "Latitude": hospitalLatitude.text,
                              "Longitude": hospitalLongitude.text,
                              "Location_id": hospitalLocationID,
                              "City_id": hospitalCityID,
                              "State_id": hospitalStateID,
                              "Country_id": hospitalCountryID,
                              "Hospital_Address": hospitalAddress.text,
                              "AboutHospital": "",
                              "Hospital_Image": "",
                              "Timing": "24X4",
                              "Hospital_PhoneNumber": hospitalPhoneNumber.text,
                              "Hospital_Type": hospitalType.text,
                              "Active_Flag": "A",
                              "Type_Flag": null,
                              "Services_Name": "",
                              "Email_Id": null
                            });
                            widget.blocGetAllHospitalByDoctor.add(Refresh());
                            context.pop();
                            print("RES   $res");
                            if (res.isSuccessful) {
                              print(
                                  ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::res.isSuccessful");
                              print(
                                  ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::${res.body}");
                              if (res.body?.code.toString() == '1') {
                                context.pop();
                                context.replace(Routes.hospitalsBasedOnDoctor);
                                print(
                                    ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::${res.body?.message}");
                              }
                              showMessage(
                                  context: context,
                                  message: res.body?.message ?? '');
                            } else {
                              context.pop();
                            }
                          }
                        },
                        child: const Text('Save Hospital Details')),
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
