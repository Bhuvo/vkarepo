import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/model/get_doctor_details.dart';
import 'package:timesmedlite/ui/components/compare_upload.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../di/dependency_injection.dart';
import '../../../facade/api_facade.dart';
import '../../../main_doctor.dart';
import '../../../service/firebase/messaging_monitor.dart';
import '../../../utils/local_storage.dart';
import '../../app/app_config.dart';
import '../../components/api_builder/api_builder.dart';
import '../../components/api_builder/api_builder_bloc.dart';
import '../../components/file_upload.dart';
import '../../components/shimmer/drop_down_shimmer.dart';
import '../../components/waiting_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:chopper/chopper.dart';

import '../../routes/routes.dart';
import '../../theme/theme.dart';
import '../appointment/Clinical Visit/controller/controller.dart';
import '../appointment/Clinical Visit/model/city_model.dart';

class AddNewDoctor extends StatefulWidget {
  const AddNewDoctor({super.key});

  @override
  State<AddNewDoctor> createState() => _AddNewDoctorState();
}

class _AddNewDoctorState extends State<AddNewDoctor> {
  GetDoctorDetails data = GetDoctorDetails(
    categoryList: [],
    cityList: [],
    langList: [],
    docList: [],
      doctorList: [],
      qualificationList: []
  );

  final ApiBuilderBloc Language_Qualification_Category_bloc =
  ApiBuilderBloc(path: 'Language_Qualification_Category', api2: true);
  final _formkey = GlobalKey<FormState>();
  TextEditingController categorycontroller = TextEditingController();
  TextEditingController subcategorycontroller = TextEditingController();
  TextEditingController languagecontroller = TextEditingController();
  TextEditingController qualificationcontroller = TextEditingController();

  var language, Qualification;
  List subCategoryListthatisAddedByUser = [];
  List LanguageListthatisAddedByUser = [];

  var selectedfile;

  ImageUpload(DoctorId) async {
    var request = http.MultipartRequest('POST',
        Uri.parse('https://api.timesmed.com/WebAPI2/DoctorProfileImage'));
    request.fields['DoctorId'] = DoctorId.toString();
    request.files.add(await http.MultipartFile.fromPath(
      selectedfile.name,
      selectedfile.path,
    ));
    var res = await request.send().then((response) {
      if (response.statusCode == 200) {
        response.stream.transform(utf8.decoder).listen((value) {
          print("XXXXXXX$value");
        });
      }
      ;
    });
  }
  ClinicalVisitController controller = ClinicalVisitController();

  @override
  void initState() {
    getData();
    super.initState();
  }
  getData() async {
   await controller.getCityList(31);
   setState(() {   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MTheme.THEME_COLOR,
        title: Text('Create Doctor',style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18
        )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Form(
            key: _formkey,
            child: Column(
              children:  [
                // CompareUpload(
                //   oldimagefromApi:
                //   'https://www.timesmed.com/images/doc-imgs/${data.doctorImage}',
                //   newiamgeuplaodfromdevice: selectedfile,
                //   onChanged: (selectedFile) async {
                //     setState(() {
                //       selectedfile = selectedFile;
                //     });
                //     print(
                //         "selected file::::::::::::::::::::::::::::::::::::$selectedFile");
                //   },
                //   onChangedRemove: () async {
                //     setState(() {
                //       selectedfile = null;
                //     });
                //   },
                // ),
                //
                // SizedBox(
                //   height: 16,
                // ),
                MTextField(
                  label: 'First Name',
                  value: data.doctorName,
                  onChanged: (v) => data = data.copyWith(doctorName: v),
                ),
                SizedBox(
                  height: 12,
                ),
                MTextField(
                  label: 'Middle Name',
                  value: data.middleName,
                  onChanged: (v) => data = data.copyWith(middleName: v),
                ),
                SizedBox(
                  height: 12,
                ),
                MTextField(
                  label: 'Last Name',
                  value: data.lastName,
                  onChanged: (v) => data = data.copyWith(lastName: v),
                ),
                SizedBox(
                  height: 12,
                ),
                Autocomplete<CityModel>(
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
                    return MTextField(
                      controller: textEditingController,
                      focusNode: focusNode,
                      label:'Select City',
                      suffixIcon:Icon(
                        FontAwesomeIcons.angleDown,
                        color: Colors.grey.shade500,
                        size: MediaQuery.of(context).size.height * 0.025,
                      ),
                      validator: (val){
                        if(controller.selectedState.stateId == null){
                          return 'Please select state';
                        }else{
                          return '';
                        }
                      },
                      onChanged: (val)async{
                      },
                      // decoration: InputDecoration(
                      //   labelText: 'Select City',
                      //   suffixIcon: Icon(
                      //     FontAwesomeIcons.angleDown,
                      //     color: Colors.grey.shade500,
                      //     size: size.height * 0.025,
                      //   ),
                      // ),

                    );
                  },
                  onSelected: (var selection) async {
                    // await controller.getLocationList(controller.selectedState.stateId?? 31, selection.cityId?? 1);
                    setState(() {
                      controller.selectedCity = selection;
                      data = data.copyWith(cityId: selection.cityId,cityName: selection.cityName);
                    });
                    // controller.selectedCity = selection;
                    print('You selected: $selection');
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                MRadioChip<String>(
                  value: data.gender == 'Male' ? 'Male' : 'Female',
                  onChanged: (v) {
                    print('${data.gender}');
                    setState(() {
                      data = data.copyWith(gender: v);
                    });
                  },
                  items: const [
                    MRadioItem(
                        value: 'Male',
                        icon: FontAwesomeIcons.person,
                        label: 'Male'),
                    MRadioItem(
                        value: 'Female',
                        icon: FontAwesomeIcons.personDress,
                        label: 'Female'),
                  ],
                  label: 'Gender',
                ),
                SizedBox(
                  height: 16,
                ),
                MDateTimePicker(
                  label: 'DOB',
                  onChanged: (v) {
                    print(data.doctorDob);
                    data =
                        data.copyWith(doctorAge: DateTime.now().year - v!.year);
                    print("${DateTime.now().year - v!.year}");
                    data = data.copyWith(
                        doctorDob:
                        DateFormat("MM/dd/yyyy").format(v!).toString());
                  },
                  start: DateTime(1900),
                  end: DateTime.now(),
                  // initial:
                  //     DateFormat("dd/MM/yyyy").parse(data.doctorDob.toString()),
                ),
                SizedBox(
                  height: 12,
                ),
                MPhoneField(
                  code: data.doctorMobileCountrycode.toString(),
                  label: 'Mobile Number',
                  value: data.doctorPhoneNumber,
                  onChanged: (v) => data = data.copyWith(doctorPhoneNumber: v),
                ),
                SizedBox(
                  height: 12,
                ),
                MTextField(
                  label: 'Password',
                  type: MInputType.password,
                  value: data.password,
                  onChanged: (v) => data = data.copyWith(password: v),
                ),
                SizedBox(
                  height: 12,
                ),
                MTextField(
                  label: 'Email',
                  type: MInputType.email,
                  value: data.emailId,
                  onChanged: (v) => data = data.copyWith(emailId: v),
                ),

                SizedBox(
                  height: 12,
                ),
                MCounterField(
                  label: 'Experience',
                  key: ValueKey('Experince::${data.doctorExperienceYears}'),
                  value: data.doctorExperienceYears,
                  onChanged: (d) {
                    setState(() {
                      data = data.copyWith(doctorExperienceYears: d);
                    });
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                MSearchDown<Map<String, dynamic>>(
                  label: 'Qualification',
                  hint: 'Search Qualification',
                  labelKey: 'Name',
                  //subTitleKey: 'DoctorCategory_id',
                  suffixIcon: const Icon(CupertinoIcons.search),

                  onSearched: (String d) async {
                    print(d);
                    final res = await Injector()
                        .apiService
                        .get2(path: 'Language_Qualification_Category');
                    List<Map<String, dynamic>> list = [];
                    if (res.isSuccessful) {
                      print("SUCCESS");
                      print("${res.body?.data['QualificationList']}");

                      if (res.body?.data['QualificationList'] is List) {
                        print("res.bodyString is List");
                        for (var e
                        in res.body?.data['QualificationList'] as List) {
                          list.add(e as Map<String, dynamic>);
                        }
                      }
                    }
                    return list;
                  },
                  onChanged: (d) {
                    print("XXXXXXXXXXXXXX${d}");
                    setState(() {
                      data = data.copyWith(qualificationName: d!['Name']);
                      data = data.copyWith(doctorQualificationCode: d!['Id']);
                    });
                  },
                  controller: qualificationcontroller
                    ..text = data.qualificationName ?? '',
                ),
                SizedBox(
                  height: 12,
                ),

                MSearchDown<Map<String, dynamic>>(
                  label: 'Specialisation (e.g Dental, Cardiologist)',
                  hint: 'Search Specialisation',
                  labelKey: 'SubCategory_Name',
                  //subTitleKey: 'DoctorCategory_id',
                  suffixIcon: const Icon(CupertinoIcons.search),

                  onSearched: (String d) async {
                    print(d);
                    final res = await Injector().apiService.get2(
                        path: 'DoctorSubCategorySearch', query: {'term': d});
                    List<Map<String, dynamic>> list = [];
                    if (res.isSuccessful) {
                      print("SUCCESS");

                      if (res.body?.data is List) {
                        print("res.bodyString is List");
                        for (var e in res.body!.data as List) {
                          list.add(e as Map<String, dynamic>);
                        }
                      }
                    }
                    return list;
                  },
                  onChanged: (d) {
                    print("XXXXXXXXXXXXXX${d}");
                    setState(() {
                      subCategoryListthatisAddedByUser.add({
                        'SubCategory_Name': d!['SubCategory_Name'],
                        'SubCategory_id': d!['SubCategory_id'],
                      });
                      data = data.copyWith(
                          subCategoryName: d!['SubCategory_Name']);
                      data = data.copyWith(
                          subCategoryId: d!['SubCategory_id'].toString());
                    });
                  },
                  controller: subcategorycontroller
                    ..text = data.subCategoryName ?? '',
                ),
                Wrap(
                  spacing: 5,
                  children: List.generate(
                    (data.docList !=null) ?
                    data.docList?.length :0 ,
                        (index) {
                      return Chip(
                        backgroundColor: MTheme.BUTTON_COLOR,
                        label: Text(data.docList[index]['SubCategory_Name']),
                        onDeleted: () {
                          setState(() {
                            print("SSSSSSSSSS${data.docList[index]}");
                            data.docList.removeAt(index);
                          });
                        },
                      );
                    },
                  ),
                ),
                Wrap(
                  spacing: 5,
                  children: List.generate(
                    subCategoryListthatisAddedByUser.length,
                        (index) {
                      return Chip(
                        backgroundColor: MTheme.BUTTON_COLOR,
                        label: Text(subCategoryListthatisAddedByUser[index]
                        ['SubCategory_Name']),
                        onDeleted: () {
                          setState(() {
                            print(
                                "SSSSSSSSSS${subCategoryListthatisAddedByUser[index]}");
                            subCategoryListthatisAddedByUser.removeAt(index);
                          });
                        },
                      );
                    },
                  ),
                ),

                SizedBox(
                  height: 12,
                ),

                MSearchDown<Map<String, dynamic>>(
                  label:
                  'Category (e.g Pediatric Dentist, Preventive Dentistry)',
                  hint: 'Search Category',
                  labelKey: 'DoctorCategory_Name',
                  //subTitleKey: 'DoctorCategory_id',
                  suffixIcon: const Icon(CupertinoIcons.search),

                  onSearched: (String d) async {
                    print(d);
                    final res = await Injector()
                        .apiService
                        .get2(path: 'DoctorCategorySearch', query: {'term': d});
                    List<Map<String, dynamic>> list = [];
                    if (res.isSuccessful) {
                      print("SUCCESS");

                      if (res.body?.data is List) {
                        print("res.bodyString is List");
                        for (var e in res.body!.data as List) {
                          list.add(e as Map<String, dynamic>);
                        }
                      }
                    }
                    return list;
                  },
                  onChanged: (d) {
                    print("XXXXXXXXXXXXXX${d}");
                    setState(() {
                      data = data.copyWith(
                          doctorCategoryName: d!['DoctorCategory_Name']);
                      data = data.copyWith(
                          doctorCategoryId: d!['DoctorCategory_id']);
                    });
                  },
                  controller: categorycontroller
                    ..text = data.doctorCategoryName ?? '',
                ),
                SizedBox(
                  height: 12,
                ),
                BlocProvider(
                  create: (_) =>
                  Language_Qualification_Category_bloc..add(const Load()),
                  child: ApiBuilder(
                    loading: const DropDownShimmer(
                      label: 'Language',
                    ),
                    jsonBuilder: (langlsit, load) {
                      print("data:  ${langlsit[0]['LanguageList']}");
                      var langlist = langlsit[0]['LanguageList'];

                      return MDialogDown<dynamic>(

                          items: langlist,
                          label: 'Language',
                          onChanged: (q) {
                            setState(() {
                              print("Onchanges    $q");
                              print(
                                  "::::::::::::::::::::::::::::::::::::::::::::::::::::::$langlsit");
                              LanguageListthatisAddedByUser.add({
                                'Name': q!['Name'],
                                'Id': q!['Id'],
                              });
                              print("LanguageListthatisAddedByUser         $LanguageListthatisAddedByUser");
                              language = q;
                              data = data.copyWith(languageName: q!['Name']);
                              data = data.copyWith(languageId: q!['Id']);
                            });
                          },
                          value: language,
                          //controller: languagecontroller..text='Tamil'??'',
                          labelKey: 'Name');
                    },
                  ),
                ),

                Wrap(
                  spacing: 5,
                  children: List.generate(
                    data.langList.length,
                        (index) {
                      return Chip(
                        backgroundColor: MTheme.BUTTON_COLOR,
                        label: Text(data.langList[index]['Language_Name']),
                        onDeleted: () {
                          setState(() {
                            print("SSSSSSSSSS${data.langList[index]}");
                            data.docList.langList(index);
                          });
                        },
                      );
                    },
                  ),
                ),
                Wrap(
                  spacing: 5,
                  children: List.generate(
                    LanguageListthatisAddedByUser.length,
                        (index) {
                      print("LanguageListthatisAddedByUser         $LanguageListthatisAddedByUser");
                      return Chip(
                        backgroundColor: MTheme.BUTTON_COLOR,
                        label:
                        Text(LanguageListthatisAddedByUser[index]['Name']),
                        onDeleted: () {
                          setState(() {
                            print(
                                "SSSSSSSSSS${LanguageListthatisAddedByUser[index]}");
                            LanguageListthatisAddedByUser.removeAt(index);
                          });
                        },
                      );
                    },
                  ),
                ),

                SizedBox(
                  height: 12,
                ),

                SizedBox(
                  height: 12,
                ),
                MTextField(
                  label: 'Address',
                  minLines: 3,
                  maxLines: 5,
                  value: data.doctorAddress,
                  onChanged: (v) => data = data.copyWith(doctorAddress: v),
                ),
                SizedBox(
                  height: 12,
                ),
                MTextField(
                  label: 'Description',
                  minLines: 5,
                  maxLines: 10,
                  value: data.doctorDescription,
                  onChanged: (v) => data = data.copyWith(doctorDescription: v),
                ),
                SizedBox(
                  height: 12,
                ),
                // MTextField(
                //   label: 'Search by Insurance Name',
                //   suffixIcon: Icon(CupertinoIcons.search),
                // ),
                Divider(
                  indent: 0,
                  endIndent: 0,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Bank Details',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(
                  height: 8,
                ),
                MTextField(
                  label: 'Bank Name',
                  value: data.bankName,
                  onChanged: (v) => data = data.copyWith(bankName: v),
                ),
                SizedBox(
                  height: 12,
                ),
                MTextField(
                  label: 'Account Name',
                  value: data.accountName,
                  onChanged: (v) => data = data.copyWith(accountName: v),
                ),
                SizedBox(
                  height: 12,
                ),
                MTextField(
                  label: 'Account No',
                  type: MInputType.numeric,
                  value: data.accountNo,
                  onChanged: (v) => data = data.copyWith(accountNo: v),
                ),
                SizedBox(
                  height: 12,
                ),
                MTextField(
                  label: 'IFSC Code',
                  value: data.ifscCode,
                  onChanged: (v) => data = data.copyWith(ifscCode: v),
                ),
                SizedBox(
                  height: 12,
                ),
                MTextField(
                  label: 'Branch Name',
                  value: data.branchName,
                  onChanged: (v) => data = data.copyWith(branchName: v),
                ),
                SizedBox(
                  height: 12,
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 50,
                  child: OutlinedButton(
                      onPressed: () async {
                        var map = data.toJson();
                        map['Admin_Id'] = '3';
                        map['Doctor_id'] =0;
                        final call = Injector()
                            .apiService
                        //     .get2(path: 'DoctorSave', query: {
                        //       'Admin_Id' : '3',
                        //   'Active_Flag' :'A',
                        //   'Doctor_Name': data.doctorName,
                        //   'Doctor_id': data.doctorId ?? 0,
                        //   'Gender': data.gender,
                        //   'Doctor_PhoneNumber': data.doctorPhoneNumber,
                        //   'Email_id': data.emailId,
                        //   'Password': data.password,
                        //   'Doctor_Address': data.doctorAddress,
                        //   'Doctor_Age': data.doctorAge,
                        //   'DoctorExperience_Years': data.doctorExperienceYears,
                        //   'Doctor_Description': data.doctorDescription,
                        //   'Doctor_Image': data.doctorImage,
                        //   'AccountNo': data.accountNo,
                        //   'IFSCCode': data.ifscCode,
                        //   'BranchName': data.branchName,
                        //   'Online': data.online,
                        //   'AccountName': data.accountName,
                        //   'BankName': data.bankName,
                        //   'Virtual': data.virtual,
                        //   'Service': data.service,
                        //   'DoctorCategory_id': data.doctorCategoryId,
                        //   'Doctor_DOB': data.doctorDob,
                        //   'Middle_Name': data.middleName,
                        //   'Last_Name': data.lastName,
                        //   'City_id': data.cityId,
                        //   'City_Name': data.cityName,
                        //   'Doctor_QualificationCode':
                        //   data.doctorQualificationCode,
                        // });
                            .get2(path: 'DoctorSave',
                            query:map);
                        print(call.then((res) {
                          print("response ${res.base.request?.url}");
                        }));
                        final res = await ApiFacade.callApi(
                            context: context, call: call);
                        print("xx${res?.base.request?.url}");
                        List listofcatcode = [];
                        String doctorId = res?.body.data.toString() ?? '0';
                        print('Doctor id is $doctorId');
                        if (res?.body.code.toString() == '1') {

                          for (int i = 0; i < data.docList.length; i++) {
                            listofcatcode
                                .add(data.docList[i]['SubCategory_id']);
                          }
                          for (int i = 0;
                          i < subCategoryListthatisAddedByUser.length;
                          i++) {
                            listofcatcode.add(
                                subCategoryListthatisAddedByUser[i]
                                ['SubCategory_id']);
                          }
                          String str = '$listofcatcode';
                          String s =
                          str.replaceAll("[", "").replaceAll("]", "");
                          print('DoctorSubCategoryUpdate $s');
                          final call = Injector()
                              .apiService
                              .get2(path: 'DoctorSubCategoryUpdate', query: {
                            'Param': s,
                            'DoctorId': doctorId ?? 0,
                          });
                          final res = await showWaitingDialog(
                              context: context, call: call);
                          print("xx${res}");
                          if (res?.body.code.toString() == '1') {
                            List listoflangcode = [];
                            for (int i = 0; i < data.langList.length; i++) {
                              listoflangcode.add(data.langList[i]['Id']);
                            }
                            for (int i = 0;
                            i < LanguageListthatisAddedByUser.length;
                            i++) {
                              listoflangcode
                                  .add(LanguageListthatisAddedByUser[i]['Id']);
                            }
                            String str = '$listoflangcode';
                            String s =
                            str.replaceAll("[", "").replaceAll("]", "");
                            print('DoctorLanguageUpdate $s');
                            final call = Injector()
                                .apiService
                                .get2(path: 'DoctorLanguageUpdate', query: {
                              'Param': s,
                              'DoctorId':doctorId??0,
                            });
                            // await ImageUpload(data.doctorId);
                            final res = await showWaitingDialog(
                                context: context, call: call);
                            print("xx${res}");
                            if (res?.body.code.toString() == '1') {
                              print("UPDATED ALL");
                              final call = Injector().apiService.login(
                                  path: 'DoctorLogin',
                                  doctorPhone: data.doctorPhoneNumber.toString(),
                                  password: data.password.toString());
                              final Response? res = await ApiFacade.callApi(
                                  context: context, call: call);
                              if (res != null) {
                                // saveInfo(res, context: context);
                              }
                              print("UPDATED Image");
                              context.pop();
                              main();
                            }
                          }
                        }
                      },
                      child: const Text('Save')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
