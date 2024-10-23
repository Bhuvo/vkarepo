import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:timesmedlite/di/dependency_injection.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder.dart';
import 'package:timesmedlite/ui/pages/admin/model/hospital_detail_model.dart';
import 'package:timesmedlite/ui/widgets/m_scaffold.dart';
import 'package:timesmedlite/ui/widgets/m_text_field.dart';
import 'package:timesmedlite/ui/widgets/space.dart';

import '../../../model/get_all_hospital_by_doctor.dart';
import '../../components/api_builder/api_builder_bloc.dart';
import '../../components/shimmer/drop_down_shimmer.dart';
import '../../widgets/m_dialog_down.dart';

class HospitalManage extends StatefulWidget {
  const HospitalManage({super.key});

  @override
  State<HospitalManage> createState() => _HospitalManageState();
}

class _HospitalManageState extends State<HospitalManage> {

  ApiBuilderBloc state_list_bloc = ApiBuilderBloc(
      path: 'StateByCountry', query: {'Country_id': 1}, api2: true);

  ApiBuilderBloc city_list_bloc =
  ApiBuilderBloc(path: 'CityByState', query: {'State_id': 31}, api2: true);

  ApiBuilderBloc location_list_bloc = ApiBuilderBloc(
      path: 'LocationByCity',
      query: {'City_id': 1, 'State_id': 31},
      api2: true);

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
      latitudeController = currentPosition!.latitude.toString();
      longitudeController = currentPosition.longitude.toString();
    });

    print('Latitude: ${currentPosition.latitude}');
    print('Longitude: ${currentPosition.longitude}');
  }

  String latitudeController = '';
  String longitudeController = '';
  String hospitalName = '';
  String hospitalPhone = '';
  String hospitalAddress = '';
  String hospitalAbout= '';
  String hospitaltime= '';
  String hospitalPassword= '';
  Map<String, dynamic>? city,state,locationname;
  var hospitalCountryID, hospitalLocationID, hospitalStateID, hospitalCityID;

   final bloc = ApiBuilderBloc(path: 'GetAllHospitalByAdmin' ,query: {'Admin_Id':'3'},timesmedApi: true,api2: true);

   @override
  void initState() {
     _getCurrentLocation();
     bloc..add(Load());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MScaffold(
      title:Text('Hospital details'),
      body: BlocProvider(
        create: (context) => bloc,
        child: ApiBuilder<GetAllHospitalByDoctor>(
          fromJson: GetAllHospitalByDoctor.fromJson,
          builder:(modelData ,i){
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Space(10),
                    MTextField(
                      label: 'Hospital Name',
                     value: modelData.hospitalName,
                     onChanged: (val){
                       hospitalName =val;
                     },
                    ),
                    Space(),
                    MTextField(
                      label: 'Hospital Phone Number',
                      value: modelData.hospitalPhoneNumber,
                      onChanged: (val){
                        hospitalPhone =val;
                      },
                    ),
                    Space(),
                    MTextField(label: 'Hospital Address',
                      value: modelData.hospitalAddress,
                      onChanged:(val){
                        hospitalAddress =val;
                      },
                      maxLines: 5,
                    ),
                    Space(),
                    MTextField(label: 'About Hospital',
                      value: modelData.aboutHospital,
                    onChanged:(val){
                      hospitalAbout = val;
                    },
                      maxLines: 7,
                    ),
                    Space(),
                    BlocProvider(
                      create: (_) => state_list_bloc..add(const Load()),
                      child: ApiBuilder(
                        loading: const DropDownShimmer(
                          label: 'State',
                        ),
                        jsonBuilder: (statelist, load) {
                          print('state Data ${statelist.map((e) => (e['State_id'] == modelData.stateId && e['State_Name'] == modelData.stateName) ? e : null).first}');
                          return MDialogDown<Map<String, dynamic>>(
                              items: statelist,
                              value: statelist.map((e) => (e['State_id'] == modelData.stateId && e['State_Name'] == modelData.stateName) ? e : null).first,
                              required: false,
                              label: 'State',
                              // controller: hospitalState,
                              onChanged: (d) {
                                setState(() {
                                  print('sjhd$d');
                                  state = d;
                                  hospitalStateID =
                                      d!['State_id'].toString();
                                  city_list_bloc = ApiBuilderBloc(
                                      path: 'CityByState',
                                      query: {'State_id': d['State_id']},
                                      api2: true);
                                 });
                              },
                              labelKey: 'State_Name');
                        },
                      ),
                    ),
                    Space(),
                    BlocProvider(
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
                              value: citylist.map((e) => (e['City_id'] == modelData.cityId && e['City_Name'] == modelData.cityName) ? e : null).first,
                              // value:{
                              //   'City_id' : modelData.cityId,
                              //   'City_Name' : modelData.cityName
                              // },
                              // controller: hospitalCity,
                              onChanged: (d) {
                                setState(() {
                                  city = d;
                                  hospitalCityID = d!['City_id'].toString();
                                  location_list_bloc = ApiBuilderBloc(
                                      path: 'LocationByCity',
                                      query: {
                                      'City_id': d['City_id'],
                                      'State_id': d['State_id']
                                      },
                                      api2: true);
                                   });
                              },
                              labelKey: 'City_Name');
                        },
                      ),
                    ),
                    Space(),
                    BlocProvider(
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
                              value: locationlist.map((e) => (e['Location_id'] == modelData.locationId && e['Location_Name'] == modelData.locationName) ? e : null).first,
                              // value: {
                              //   'Location_id' : modelData.locationId ??  '',
                              //   'Location_Name' : modelData.locationName ?? ''
                              // },
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
                              labelKey: 'Location_Name');
                        },
                      ),
                    ),
                    Space(),
                    Row(
                      children: [
                        Expanded(
                          child: MTextField(
                            label: 'Latitude',
                            type: MInputType.decimal,
                            value: modelData.latitude,
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: MTextField(
                            label: 'Longitude',
                            type: MInputType.decimal,
                            value: modelData.longitude,
                          ),
                        ),
                      ],
                    ),
                    Space(),
                    MTextField(label: 'Hospital Timing(ex."10:00 AM - 20:00 PM")',
                   value: modelData.timing,
                   onChanged: (val){
                     hospitaltime =val;
                   },
                    ),
                    Space(),
                    MTextField(label: 'Password',
                    value: modelData.password,
                    type: MInputType.password,
                    onChanged:(val){
                      hospitalPassword = val;
                    },),
                    Space(),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: OutlinedButton(onPressed: (){
                        Injector().apiService.post2(path:'VkaHospitalAdd',body: {
                          "Hospital_id": modelData.hospitalId ?? 0,
                          "Password":hospitalPassword,
                          "Hospital_Name": hospitalName,
                          "Longitude": longitudeController ??"10.24789",
                          "Latitude": latitudeController ??"10.235898",
                          "Country_id":1,
                          "City_id":hospitalCityID,
                          "State_id":hospitalStateID,
                          "Hospital_Address": hospitalAddress ?? "Amnjikarani,chennai,Tamilandu",
                          "AboutHospital": hospitalAbout ?? "10 yrs exp",
                          "Location_id":hospitalLocationID,
                          "Timing":hospitaltime,
                          "Hospital_PhoneNumber": hospitalPhone ?? "7874859685",
                          "Admin_Id":3
                        });
                      }, child:Text('Save')),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
