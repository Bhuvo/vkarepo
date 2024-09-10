import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/ui/components/file_upload.dart';
import 'package:timesmedlite/ui/widgets/m_dialog.dart';
import 'package:timesmedlite/ui/widgets/m_phone_field.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../di/dependency_injection.dart';
import '../../../model/get_all_hospital_by_doctor.dart';
import '../../components/api_builder/api_builder.dart';
import '../../components/api_builder/api_builder_bloc.dart';
import '../../components/shimmer/drop_down_shimmer.dart';
import '../../components/show_message.dart';
import '../../components/waiting_dialog.dart';
import '../../routes/routes.dart';
import 'package:http/http.dart' as http;

class EditHospitalDialog extends StatefulWidget {
  final GetAllHospitalByDoctor getAllHospitalByDoctor;

  EditHospitalDialog(
      {Key? key,
      this.getAllHospitalByDoctor = const GetAllHospitalByDoctor(
        hospitalId: 0,
      )})
      : super(key: key);

  @override
  State<EditHospitalDialog> createState() =>
      _EditHospitalDialogState(getAllHospitalByDoctor);
}

class _EditHospitalDialogState extends State<EditHospitalDialog> {
  final GlobalKey<FormState> form = GlobalKey();

  GetAllHospitalByDoctor data;

  _EditHospitalDialogState(this.data);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedfile = data.hospitalImage;
    state_list_bloc = ApiBuilderBloc(
        path: 'StateByCountry',
        query: {'Country_id': data.countryId},
        api2: true);
    city_list_bloc = ApiBuilderBloc(
        path: 'CityByState', query: {'State_id': data.stateId}, api2: true);
    location_list_bloc = ApiBuilderBloc(
        path: 'LocationByCity',
        query: {'City_id': data.cityId, 'State_id': data.locationId},
        api2: true);
  }

  var selectedfile;

  ApiBuilderBloc country_list_bloc =
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

  ImageUpload(HID) async {
    var request = http.MultipartRequest('POST',
        Uri.parse('https://api.timesmed.com/WebAPI2/HospitalSaveImage'));
    request.fields['HospitalId'] = HID.toString();
    request.files.add(await http.MultipartFile.fromPath(
      selectedfile.name,
      selectedfile.path,
    ));
    var res = await request.send().then((response) {
      if (response.statusCode == 200) {
        response.stream.transform(utf8.decoder).listen((value) {
          print(value);
        });
      }
      ;
    });
  }

  @override
  Widget build(BuildContext context) {
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
            child: BlocProvider(
                create: (context) => ApiBuilderBloc(
                    path: 'HospitalDetails',
                    query: {'HospitalId': data.hospitalId},
                    api2: true)
                  ..add(const Load()),
                child: ApiBuilder<GetAllHospitalByDoctor>(
                    jsonBuilder: (data1, load) {
                      data=data.copyWith(countryName: data1.first['Country_Name'],countryId:data1.first['Country_id'],stateName: data1.first['State_Name'] ,stateId:data1.first['State_id'],cityId:data1.first['City_id'],cityName: data1.first['City_Name'],locationId: data1.first['Location_id'],locationName: data1.first['Location_Name'],password: data1.first['Password']);


                      print("asdfasdf asdf sd f$data");
                      return Form(
                        key: form,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            (selectedfile == null || selectedfile == '')
                                ? FileUpload(
                                    margin: EdgeInsets.all(0),
                                    title: 'Upload Hospital Image',
                                    subTitle: 'Choose your image to upload',
                                    onChanged: (selected) async {
                                      setState(() {
                                        selectedfile = selected;
                                      });
                                      print(
                                          "selected file::::::::::::::::::::::::::::::::::::$selectedfile");
                                    },
                                  )
                                : Center(
                                    child: Stack(
                                      children: <Widget>[
                                        Container(
                                          width: 250.0,
                                          height: 320.0,
                                          child: data.hospitalImage == ''
                                              ? Image.file(File(
                                                  selectedfile.path.toString()))
                                              : Image.network(
                                                  "https://www.timesmed.com/images/doc-imgs/${data.hospitalImage!}"),
                                        ),
                                        Positioned(
                                          right: 5.0,
                                          child: InkWell(
                                            child: const Icon(
                                              Icons
                                                  .remove_circle_outline_outlined,
                                              size: 30,
                                              color: Colors.red,
                                            ),
                                            // This is where the _image value sets to null on tap of the red circle icon
                                            onTap: () {
                                              setState(
                                                () {
                                                  data = data.copyWith(
                                                      hospitalImage: '');
                                                  selectedfile = null;
                                                },
                                              );
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                            SizedBox(
                              height: 16,
                            ),
                            MListTile(
                              margin: EdgeInsets.all(0),
                              padding: EdgeInsets.all(16),
                              child: MRadioChip<String>(
                                value: (data.hospitalType == 'Own')
                                    ? data.hospitalType
                                    : 'Consultan Hospital',
                                onChanged: (d) {
                                  setState(() {
                                    data = data.copyWith(hospitalType: d);
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
                              value: data.hospitalName,
                              onChanged: (d) {
                                data = data.copyWith(hospitalName: d);
                              },
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            MTextField(
                              label: 'Mobile Number',
                              value: data.hospitalPhoneNumber,
                              prefixIcon: const Icon(Icons.phone),
                              type: MInputType.phone,
                              onChanged: (d) {
                                data = data.copyWith(hospitalPhoneNumber: d);
                              },
                            ),
                            // MPhoneField(
                            //   label: 'Mobile Number',
                            //   value: data.hospitalPhoneNumber,
                            //   onChanged: (d) {
                            //     data = data.copyWith(hospitalPhoneNumber: d);
                            //   },
                            // ),
                            SizedBox(
                              height: 12,
                            ),
                            MTextField(
                              label: 'Password',
                              type: MInputType.password,
                              value: data.password,
                              onChanged: (d) {
                                data = data.copyWith(password: d);
                              },
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text("Country : ${data.countryName}"),
                            Text("State : ${data.stateName}"),
                            Text("city : ${data.cityName}"),
                            Text("location : ${data.locationName}"),
                            BlocProvider(
                              create: (_) =>
                                  country_list_bloc..add(const Load()),
                              child: ApiBuilder(
                                loading: const DropDownShimmer(
                                  label: 'Country',
                                ),
                                jsonBuilder: (countrylist, load) {
                                  //return DropDownShimmer(label: 'Select Patient',);
                                  return MDialogDown<Map<String, dynamic>>(
                                      items: countrylist,
                                      label: 'Country',
                                      onChanged: (d) {
                                        setState(() {
                                          print(
                                              "asdfasdfasdfsdfsadfsdfsdfsdfsdfsd$d");
                                          countryname = d;
                                          statename = null;
                                          cityname = null;
                                          locationname = null;
                                          print(
                                              "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::DDDDDDDDDDDDDDDDDDDDDDD$d");

                                          data = data.copyWith(
                                              countryName: d!['Country_Name']);
                                          data = data.copyWith(
                                              countryId: d!['Country_id']);
                                          state_list_bloc = ApiBuilderBloc(
                                              path: 'StateByCountry',
                                              query: {
                                                'Country_id': d!['Country_id']
                                              },
                                              api2: true);
                                          //statename?.clear();
                                          print(
                                              "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::C  ${data.countryName}  ${data.countryId}");
                                        });
                                      },
                                      value:countryname??countrylist.firstWhere((element) {element.values==data.countryName;return true; }),
                                      labelKey: 'Country_Name');
                                },
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            BlocProvider(
                              create: (_) => state_list_bloc..add(const Load()),
                              child: ApiBuilder(
                                loading: const DropDownShimmer(
                                  label: 'State',
                                ),
                                jsonBuilder: (statelist, load) {
                                  print(
                                      "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::  ${statelist}");
                                  //return DropDownShimmer(label: 'Select Patient',);
                                  return MDialogDown<Map<String, dynamic>>(
                                      items: statelist,
                                      label: 'State',
                                      onChanged: (d) {
                                        setState(() {
                                          statename = d;
                                          cityname = null;
                                          locationname = null;
                                          data = data.copyWith(
                                              stateName: d!['State_Name']);
                                          data = data.copyWith(
                                              stateId: d!['State_id']);
                                          city_list_bloc = ApiBuilderBloc(
                                              path: 'CityByState',
                                              query: {
                                                'State_id': d['State_id']
                                              },
                                              api2: true);
                                        });
                                      },
                                      value: statename ??
                                          statelist.firstWhere((element) {
                                            element.values == data.stateName;
                                            return true;
                                          }),
                                      labelKey: 'State_Name');
                                },
                              ),
                            ),

                            SizedBox(
                              height: 12,
                            ),
                            BlocProvider(
                              create: (_) => city_list_bloc..add(const Load()),
                              child: ApiBuilder(
                                loading: const DropDownShimmer(
                                  label: 'City',
                                ),
                                jsonBuilder: (citylist, load) {
                                  print(
                                      "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::  ${citylist}");
                                  //return DropDownShimmer(label: 'Select Patient',);
                                  return MDialogDown<Map<String, dynamic>>(
                                      items: citylist,
                                      label: 'City',
                                      onChanged: (d) {
                                        setState(() {
                                          cityname = d;
                                          locationname = null;
                                          data = data.copyWith(
                                              cityName: d!['City_Name']);
                                          data = data.copyWith(
                                              cityId: d!['City_id']);
                                          location_list_bloc = ApiBuilderBloc(
                                              path: 'LocationByCity',
                                              query: {
                                                'City_id': d['City_id'],
                                                'State_id': d['State_id']
                                              },
                                              api2: true);
                                        });
                                      },
                                      value: cityname ??
                                          citylist.firstWhere((element) {
                                            element.values == data.stateName;
                                            return true;
                                          }),
                                      labelKey: 'City_Name');
                                },
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            BlocProvider(
                              create: (_) =>
                                  location_list_bloc..add(const Load()),
                              child: ApiBuilder(
                                empty: Container(),
                                loading: const DropDownShimmer(
                                  label: 'Location',
                                ),
                                jsonBuilder: (locationlist, load) {
                                  print(
                                      "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::  ${locationlist}");
                                  //return DropDownShimmer(label: 'Select Patient',);
                                  return MDialogDown<Map<String, dynamic>>(
                                      items: locationlist,
                                      label: 'Location',
                                      onChanged: (d) {
                                        setState(() {
                                          locationname = d;
                                          data = data.copyWith(
                                              locationName:
                                                  d!['Location_Name']);
                                          data = data.copyWith(
                                              locationId: d!['Location_id']);
                                        });
                                      },
                                      value: locationname ??
                                          locationlist.firstWhere((element) {
                                            element.values == data.stateName;
                                            return true;
                                          }),
                                      labelKey: 'Location_Name');
                                },
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Current Location',
                              style: Theme.of(context).textTheme.caption,
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
                                    value: data.latitude,
                                    onChanged: (d) {
                                      data = data.copyWith(latitude: d);
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: MTextField(
                                    label: 'Longitude',
                                    type: MInputType.decimal,
                                    value: data.longitude,
                                    onChanged: (d) {
                                      data = data.copyWith(longitude: d);
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            MTextField(
                              label: 'Hospital Address',
                              value: data.hospitalAddress,
                              onChanged: (d) {
                                data = data.copyWith(hospitalAddress: d);
                              },
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
                                    selectedfile == null
                                        ? null
                                        : ImageUpload(data.hospitalId);
                                    print(
                                        "::::::::::::::::::::::::::::::::::::::::::::::::::::Hospitalid:${data.hospitalId}");
                                    showWaitingDialog(context: context);
                                    final res = await Injector()
                                        .apiService
                                        .post2(path: 'HospitalAdd', query: {
                                      "Doctor_Id": data.doctorId,
                                      "Hospital_id": data.hospitalId,
                                      "Password": data.password,
                                      "Hospital_Name": data.hospitalName,
                                      "Latitude": data.latitude,
                                      "Longitude": data.longitude,
                                      "Location_id": data.locationId ?? 1915,
                                      "City_id": data.cityId ?? 1,
                                      "State_id": data.stateId ?? 31,
                                      "Country_id": data.countryId ?? 1,
                                      "Hospital_Address": data.hospitalAddress,
                                      "AboutHospital": data.aboutHospital,
                                      "Hospital_Image": data.hospitalImage,
                                      "Timing": data.timing,
                                      "Hospital_PhoneNumber":
                                          data.hospitalPhoneNumber,
                                      "Hospital_Type": data.hospitalType,
                                      "Active_Flag": data.activeFlag,
                                      "Type_Flag": data.typeFlag,
                                      "Services_Name": data.servicesName,
                                      "Email_Id": data.emailId
                                    });
                                    context.pop();

                                    if (res.isSuccessful) {
                                      print(
                                          ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::res.isSuccessful");
                                      print(
                                          ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::${res.body?.code}");
                                      if (res.body?.code.toString() == '1') {
                                        context.pop(data);
                                        context.replace(
                                            Routes.hospitalsBasedOnDoctor);
                                        print(
                                            ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::${res.body?.message}");
                                      }
                                      showMessage(
                                          context: context,
                                          message: res.body?.message ?? '');
                                    } else {
                                      showMessage(
                                          context: context,
                                          message:
                                              'Request failed, Please check your connection.');
                                    }
                                  },
                                  child: const Text('Save Hospital Details')),
                            ),
                          ],
                        ),
                      );
                    })),
          ),
        ),
      ),
    );
  }
}
