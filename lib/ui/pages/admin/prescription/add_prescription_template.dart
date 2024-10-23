import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timesmedlite/ui/pages/medical_record/model/prescription_template_model.dart';
import 'package:timesmedlite/ui/widgets/loading_widget.dart';
import 'package:timesmedlite/ui/widgets/m_text_field.dart';
import 'package:timesmedlite/ui/widgets/space.dart';
import 'package:http/http.dart'as http;
import 'package:timesmedlite/utils/file_utils.dart';
import '../../../components/file_upload.dart';
import '../../../theme/theme.dart';

class AddPrescriptionTemplate extends StatefulWidget {
  const AddPrescriptionTemplate({super.key});

  @override
  State<AddPrescriptionTemplate> createState() => _AddPrescriptionTemplateState();
}

class _AddPrescriptionTemplateState extends State<AddPrescriptionTemplate> {

  PrescriptionTemplateModel model = PrescriptionTemplateModel();
  PlatformFile? logoImg;
  PlatformFile? acImg1;
  PlatformFile? acImg2;
  PlatformFile? awardImg;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: MTheme.THEME_COLOR,title: Text('Add New Template',
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18
          )),),
      body: SingleChildScrollView(
        child: Column(children: [
          Space(),
          MTextField(
            label: 'Hospital Address',
            maxLines: 4,
            onChanged: (val){
              model.hospitalAddress = val;
            },
          ),
          Space(),
          MTextField(
            label: 'Hospital Email' ,
            onChanged: (val){
              model.hospitalEmailid = val;
            },
          ),
          Space(),
          MTextField(
            label: 'Hospital Phone',
            onChanged: (val){
              model.hospitalPhoneNumber = val;
            },
          ),
          Space(),
          MTextField(
            label: 'Hospital Working Hours',
            onChanged: (val){
              model.hospitalWorkingHours = val;
            },
          ),
          Space(),
          Column(
            children: [
              Text('Hospital Logo',style: TextStyle(fontWeight: FontWeight.bold),),
              logoImg != null ? Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(File(logoImg?.path ?? '')),fit: BoxFit.cover
                  )
                ),
              ): Container(),
              FileUpload(
                title: 'Upload logo',
                allowedExtensions: [
                  'png' ,'jpg' ,'jpeg'
                ],
                onChanged: (val){
                  logoImg = val;
                },
              ),
            ],
          ),
          Space(),
          Column(
            children: [
              Text('Accreditation Image 1',style: TextStyle(fontWeight: FontWeight.bold),),
              acImg1 != null ? Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: FileImage(File(acImg1?.path ?? '')),fit: BoxFit.cover
                    )
                ),
              ): Container(),
              FileUpload(
                title: 'Upload Accreditation Image 1',
                allowedExtensions: [
                  'png' ,'jpg' ,'jpeg'
                ],
                onChanged: (val){
                  acImg1 = val;
                },
              ),
            ],
          ),
          Space(),
          Column(
            children: [
              Text('Accreditation Image 2',style: TextStyle(fontWeight: FontWeight.bold),),
              acImg2 != null ? Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: FileImage(File(acImg2?.path ?? '')),fit: BoxFit.cover
                    )
                ),
              ): Container(),
              FileUpload(
                title: 'Upload Accreditation Image 2',
                allowedExtensions: [
                  'png' ,'jpg' ,'jpeg'
                ],
                onChanged: (val){
                  acImg2 = val;
                },
              ),
            ],
          ),
          Space(),
          Column(
            children: [
              Text('Award Image',style: TextStyle(fontWeight: FontWeight.bold),),
              awardImg != null ? Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: FileImage(File(awardImg?.path ?? '')),fit: BoxFit.cover
                    )
                ),
              ): Container(),
              FileUpload(
                title: 'Upload Award Image',
                allowedExtensions: const [
                  'png' ,'jpg' ,'jpeg'
                ],
                onChanged: (val){
                  awardImg = val;
                },
              ),
            ],
          ),
          OutlinedButton(onPressed: ()async{
            setState(() {
              isLoading = true;
            });
            print('Pressed');
            var request = await http.MultipartRequest('POST', Uri.parse('https://doctor.timesmed.com/PrintLayout/Save_ImagePrint_API'));
            request.fields['Hospital_id'] = '41835';
            request.fields['Doctor_id'] = '0';
            request.fields['HospitalAddress'] = model.hospitalAddress ?? '';
            request.fields['HospitalEmailid'] = model.hospitalEmailid  ?? '';
            request.fields['Hospital_PhoneNumber'] = model.hospitalPhoneNumber ??'';
            request.fields['HospitalWorkingHours'] = model.hospitalWorkingHours  ?? '';
            var acFile1 = await http.MultipartFile.fromPath('accreditationImage1', logoImg?.path ?? '');
            var acFile2 = await http.MultipartFile.fromPath('accreditationImage2', logoImg?.path ?? '');
            var awardFile = await http.MultipartFile.fromPath('awardImage', logoImg?.path ?? '');
            var logoFile = await http.MultipartFile.fromPath('hospitalLogo', logoImg?.path ?? '');
            request.files.add(logoFile);
            request.files.add(awardFile);
            request.files.add(acFile2);
            request.files.add(acFile1);
            var response = await request.send();
            if(response.statusCode == 200){
              var responseData = await response.stream.bytesToString();
              print('Success: $responseData');
            }else{
              print('Failed: ${response.reasonPhrase}');
            }
            // var response = await http.post(Uri.parse('https://doctor.timesmed.com/PrintLayout/Save_ImagePrint_API?').replace(
            //   queryParameters: {
            //     'Hospital_id': '41835',
            //     'Doctor_id': '0',
            //     'HospitalAddress': model.hospitalAddress,
            //     'HospitalEmailid': model.hospitalEmailid,
            //     'Hospital_PhoneNumber': model.hospitalPhoneNumber,
            //     'HospitalWorkingHours': model.hospitalWorkingHours
            //   }
            // ));
            setState(() {
              isLoading = false;
            });
          }, child:isLoading ? const LoadingWidget() : const Text('Add Template'))
        ],),
      ),
    );
  }
}
