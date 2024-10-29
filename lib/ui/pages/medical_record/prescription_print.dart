import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:timesmedlite/ui/app/app_config.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/loading_widget.dart';

import '../../../const/consts.dart';
import '../../../model/appointment_data.dart';
import '../../../model/medical_record.dart';
import '../../../utils/local_storage.dart';
import '../../widgets/m_scaffold.dart';
import 'package:http/http.dart' as http;

import 'model/prescription_template_model.dart';

class PrescriptionPrint extends StatefulWidget {
  final List data;
  final List labTest;
  final MedicalRecord orgData;
  final AppointmentData? appointment;
  final String? appId;
  final String? docId;
  const PrescriptionPrint({Key? key, required this.data, this.appointment, required this.labTest, required this.orgData, this.appId, this.docId})
      : super(key: key);

  @override
  State<PrescriptionPrint> createState() => _PrescriptionPrintState();
}

PrescriptionTemplateModel prescriptionTemplateModel = PrescriptionTemplateModel();
 late pw.MemoryImage? logo;
 List<pw.MemoryImage?>? images = [];


 Future<pw.MemoryImage?> getImage(String url) async {
  var result = await http.get(Uri.parse(url));
  if(result.statusCode == 200){
    return pw.MemoryImage(result.bodyBytes);
  }
}

Future<Uint8List> _generatePdfWithPagination(
    bool isPatient ,
    AppointmentData? appointment,String appId, List data, MedicalRecord orgData, List labTest) async {
  log('data note : ${data}');
  final pdf = pw.Document();
  final image = await imageFromAssetBundle('assets/images/timesmedlogo.png');

  // Define the maximum number of items per page
  const int itemsPerPage = 10;

  // Split the data into chunks for pagination
  for (int i = 0; i < data.length +labTest.length; i += itemsPerPage) {
    final currentItems = data.skip(i).take(itemsPerPage).toList();
    bool isLastPage = (i + itemsPerPage) >= data.length;
    bool isLastPage2 = (i + itemsPerPage) >= data.length+labTest.length;
    log('current ${currentItems.first}');
    pdf.addPage(
        pw.Page(
            theme: pw.ThemeData.withFont(
              // base: await PdfGoogleFonts.varelaRoundRegular(),
              // bold: await PdfGoogleFonts.varelaRoundRegular(),
              icons: await PdfGoogleFonts.materialIcons(),
              // boldItalic: await PdfGoogleFonts.varelaRoundRegular(),
              // italic: await PdfGoogleFonts.varelaRoundRegular(),
            ),
            pageFormat: PdfPageFormat.a4,
            build: (pw.Context context) {
              return pw.Padding(
                padding: const pw.EdgeInsets.all(8),
                child: pw.Column(children: [
                  pw.Row(
                    children: [
                      pw.Spacer(),
                      pw.Padding(
                        padding: const pw.EdgeInsets.only(right: 25,
                        ),child:  pw.Image(
                        logo ?? image,
                        width: 140,
                        height: 50,
                        fit: pw.BoxFit.contain,
                      ),
                      ),

                      // pw.Spacer(),
                    ],
                  ),
                  pw.SizedBox(
                    height: 5,
                  ),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text('${prescriptionTemplateModel.doctorName ??'Doctor Name'} ${prescriptionTemplateModel.doctorQualification ??'Doctor Qualification'}', style: pw.TextStyle(fontSize: 12,fontWeight: pw.FontWeight.bold),),
                            pw.Text(prescriptionTemplateModel.specializations ??'Doctor Specialization', style: pw.TextStyle(fontSize: 12,fontWeight: pw.FontWeight.bold),),
                            pw.Text(prescriptionTemplateModel.doctorPhoneNumber ??'Doctor Phone', style: pw.TextStyle(fontSize: 12,fontWeight: pw.FontWeight.bold),),
                            // pw.Text('9:00 AM - 12:00 PM', style: pw.TextStyle(fontSize: 12,fontWeight: pw.FontWeight.bold),),
                          ]
                      ),
                      //  pw.Spacer(),
                      pw.Container(
                          width: 100,
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text(prescriptionTemplateModel.hospitalAddress ?? '43-landmark road ,sholinganallur, chennai - 600119',textAlign: pw.TextAlign.start, style: pw.TextStyle(fontSize: 8)),
                              pw.Text('Phone :${prescriptionTemplateModel.hospitalPhoneNumber ??  1234567890}', style: pw.TextStyle(fontSize: 8),textAlign: pw.TextAlign.start),
                              pw.Text('Email : ${prescriptionTemplateModel.hospitalEmailid ??'0p6wT@example.com' }', style: pw.TextStyle(fontSize: 8),textAlign: pw.TextAlign.start),
                            ],
                          )
                      ) // pw.Spacer(),
                    ],
                  ),
                  pw.SizedBox(
                    height: 5,
                  ),
                  pw.Row(
                    children: [
                      pw.Spacer(),
                      pw.ListView.builder(
                        // shrinkWrap: true,
                        // padding: pw.EdgeInsets.only(right: 16),
                        direction: pw.Axis.horizontal,
                        itemBuilder: (context, index) {
                          return pw.Padding(
                              padding: pw.EdgeInsets.fromLTRB(2,0,5,0),
                              child: pw.Container(
                                height: 30,
                                width: 30,
                                decoration: pw.BoxDecoration(
                                    shape: pw.BoxShape.circle,
                                    image: pw.DecorationImage(image: images?[index] ?? image, fit: pw.BoxFit.cover)),
                              )
                          );
                        },
                        itemCount: images?.length ?? 0,
                      ),
                    ],
                  ),
                  pw.SizedBox(
                    height: 10,
                  ),
                  pw.Divider(
                    height: 3,
                    color: PdfColor.fromInt(0xff35b8b0),
                  ),
                  pw.SizedBox(
                    height: 20,
                  ),
                  pw.Text(
                    'PRESCRIPTION',
                    // Consts.PRESCRIPTION_FORM,
                    style: pw.TextStyle(
                        fontSize: 17,
                        color: PdfColors.grey,
                        fontWeight: pw.FontWeight.bold),
                  ),
                  pw.SizedBox(
                    height: 20,
                  ),
                  pw.Row(
                    children: [
                      pw.Text(
                        // "Doctor Name : ${appointment?.doctorName}",
                        isPatient ? '${LocalStorage.getCursorPatient().userId} : ${LocalStorage.getCursorPatient().patientName} (${LocalStorage.getCursorPatient().age} / ${LocalStorage.getCursorPatient().gender.toString()}) - ${LocalStorage.getCursorPatient().phone}' :
                          LocalStorage.isAdmin?
                        '${LocalStorage.getCursorPatient().userId ?? LocalStorage.getUID()} : ${LocalStorage.getCursorPatient().patientName ?? LocalStorage.getUser().firstname} (${LocalStorage.getCursorPatient().age?? LocalStorage.getUser().age} / ${LocalStorage.getCursorPatient().gender.toString()}) - ${LocalStorage.getCursorPatient().phone?? ''}'
                        : '${orgData.User_id} : ${orgData.User_Name}',
                        style: const pw.TextStyle(fontSize: 10),
                      ),
                      pw.Spacer(),
                      pw.Text(
                        "Date & Time : ${DateFormat('dd/MM/yyyy  kk:mm a').format(DateTime.now())}",
                        style: const pw.TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                  pw.SizedBox(
                    height: 10,
                  ),
                  pw.SizedBox(
                    height: 10,
                  ),
                  pw.Table(
                      defaultColumnWidth: const pw.IntrinsicColumnWidth(),
                      border: pw.TableBorder.all(color: PdfColors.grey200),
                      // Allows to add a border decoration around your table
                      children: [
                        pw.TableRow(
                            decoration: const pw.BoxDecoration(
                              color: PdfColors.grey200,
                            ),
                            children: [
                              TableRowItems('Qty'),
                              TableRowItems('Drug Name'),
                              TableRowItems('Frequency'),
                              TableRowItems('M|A|N'),
                              TableRowItems('Days'),
                              // TableRowItems('Dosage M|A|N'),
                              TableRowItems('Food Instruction'),
                              TableRowItems('Doctor Instruction'),
                            ]),
                        for (var item in currentItems)
                          pw.TableRow(children: [
                            TableRowItems(item['dosage'].toString()),
                            TableRowItems(item['drug_name'].toString()),
                            TableRowItems(item['frequency'].toString()),
                            TableRowItems(
                                '${item['MorningTime'].toString()} | \n${item['AfternoonTime'].toString()} | \n${item['NightTime'].toString()}'),
                            TableRowItems(item['duration'].toString()),
                            // TableRowItems(
                            //     '${item['Morning'] ?? ''.toString()}${item['Morning'] == null ? '' : '|'}${item['Afternoon'] ?? ''.toString()}${item['Morning'] == null ? '' : '|'}${item['Night'] ?? ''.toString()}'),
                            TableRowItems(item['instruction'].toString()),
                            TableRowItems(item['FoodInstr'] == null||item['FoodInstr'] == '' ? '' : item['FoodInstr'].toString()),
                          ]),
                      ]),

                  // pw.Divider(
                  //   height: 3,
                  //   color: PdfColor.fromInt(0xff35b8b0),
                  // ),
                  pw.SizedBox(
                      height: 10
                  ),
                  !isLastPage ? pw.Container() : pw.Column(
                    children: [
                      labTest.length == 0 ? pw.Container(): pw.Row(
                          children: [
                            pw.Text('Lab Tests', style: pw.TextStyle(fontSize: 13),textAlign: pw.TextAlign.start),
                          ]
                      ),
                      labTest.length == 0 ? pw.Container(): pw.SizedBox(
                          height: 3
                      ),
                      labTest.length == 0 ? pw.Container() : pw.Table(
                          defaultColumnWidth: const pw.IntrinsicColumnWidth(),
                          border: pw.TableBorder.all(color: PdfColors.grey200),
                          // Allows to add a border decoration around your table
                          children: [
                            pw.TableRow(
                                decoration: const pw.BoxDecoration(
                                  color: PdfColors.grey200,
                                ),
                                children: [
                                  TableRowItems('Dept Name'),
                                  TableRowItems('Test Name'),
                                  TableRowItems('Instructions'),
                                ]),
                            for (int i = 0; i < labTest.length; i++)
                              pw.TableRow(children: [
                                TableRowItems(labTest[i]['DeptName'].toString()),
                                TableRowItems(labTest[i]['test_name'].toString()),
                                TableRowItems(labTest[i]['finding'].toString()),
                              ]),
                          ]),
                      pw.SizedBox(
                          height: 10
                      ),
                    ]
                  ),
                !isLastPage2 ?  pw.Container(): pw.Column(
                   children: [
                     // pw.Container(color: PdfColors.red, width: double.infinity ,height: 40),
                     orgData.Revisit_Appointment_id == ''|| orgData.Revisit_Appointment_id == 0 ? pw.Container(): pw.Column(
                         crossAxisAlignment: pw.CrossAxisAlignment.start,
                         children: [
                           pw.Container(color: PdfColors.red, width: double.infinity ,height: 40),
                           pw.Row(),
                           pw.Text('Revisit - ${orgData.reApp_Date} -${orgData.reApp_Time}', style: pw.TextStyle(fontSize: 10),textAlign: pw.TextAlign.start),
                           pw.SizedBox(
                               height: 3
                           ),
                           pw.Text('Revisit Appointment Id - ${orgData.Revisit_Appointment_id}', style: pw.TextStyle(fontSize: 10),textAlign: pw.TextAlign.start),
                         ]
                     ),
                   ]
                 ),
                  pw.Spacer(),
                  pw.Divider(
                    height: 3,
                    color: PdfColor.fromInt(0xff35b8b0),
                  ),

                  pw.SizedBox(
                    height: 10,
                  ),
                  pw.Row(
                    children: [
                      //pw.Icon(const pw.IconData(0xe3ab)),
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            prescriptionTemplateModel.hospitalName ??"Timesmed HealthSoft Inc.,",
                            style: pw.TextStyle(
                                fontSize: 10, fontWeight: pw.FontWeight.bold),
                          ),
                          pw.Text(
                            prescriptionTemplateModel.hospitalAddress ?? "Suite 21060 Homestead Road, 170, Cupertino,CA 95014, USA",
                            style: const pw.TextStyle(fontSize: 8),
                          )
                        ],
                      ),
                      pw.Spacer(),
                      //pw.Icon(Icons.phone,color: Colors.green,size: 12),
                      pw.Text(
                        '${appointment?.id??((appId !='') ? appId : "Appointment Id")}',
                        style: pw.TextStyle(
                            fontSize: 10, fontWeight: pw.FontWeight.bold),
                      ),
                    ],
                  )
                ]),
              );
              // Center
            }));
  }

  return pdf.save();
}


Future<Uint8List> _generatePdfWhenNumberofItemsIsLessThan15(
    AppointmentData? appointment, List data, MedicalRecord orgData, List labTest) async {
  final pdf = pw.Document();
  final image = await imageFromAssetBundle('assets/images/timesmedlogo.png');

  pdf.addPage(
      pw.Page(
      theme: pw.ThemeData.withFont(
        // base: await PdfGoogleFonts.varelaRoundRegular(),
        // bold: await PdfGoogleFonts.varelaRoundRegular(),
        icons: await PdfGoogleFonts.materialIcons(),
        // boldItalic: await PdfGoogleFonts.varelaRoundRegular(),
        // italic: await PdfGoogleFonts.varelaRoundRegular(),
      ),
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Padding(
          padding: const pw.EdgeInsets.all(8),
          child: pw.Column(children: [
            pw.Row(
              children: [
                pw.Spacer(),
                pw.Padding(
                  padding: const pw.EdgeInsets.only(right: 25,
                  ),child:  pw.Image(
                  logo ?? image,
                  width: 140,
                  height: 50,
                  fit: pw.BoxFit.contain,
                ),
                ),

                // pw.Spacer(),
              ],
            ),
            pw.SizedBox(
              height: 5,
            ),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('${prescriptionTemplateModel.doctorName ??'Doctor Name'} ${prescriptionTemplateModel.doctorQualification ??'Doctor Qualification'}', style: pw.TextStyle(fontSize: 12,fontWeight: pw.FontWeight.bold),),
                    pw.Text(prescriptionTemplateModel.specializations ??'Doctor Specialization', style: pw.TextStyle(fontSize: 12,fontWeight: pw.FontWeight.bold),),
                    pw.Text(prescriptionTemplateModel.doctorPhoneNumber ??'Doctor Phone', style: pw.TextStyle(fontSize: 12,fontWeight: pw.FontWeight.bold),),
                    // pw.Text('9:00 AM - 12:00 PM', style: pw.TextStyle(fontSize: 12,fontWeight: pw.FontWeight.bold),),
                  ]
                ),
              //  pw.Spacer(),
                pw.Container(
                  width: 100,
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(prescriptionTemplateModel.hospitalAddress ?? '43-landmark road ,sholinganallur, chennai - 600119',textAlign: pw.TextAlign.start, style: pw.TextStyle(fontSize: 8)),
                      pw.Text('Phone :${prescriptionTemplateModel.hospitalPhoneNumber ??  1234567890}', style: pw.TextStyle(fontSize: 8),textAlign: pw.TextAlign.start),
                      pw.Text('Email : ${prescriptionTemplateModel.hospitalEmailid ??'0p6wT@example.com' }', style: pw.TextStyle(fontSize: 8),textAlign: pw.TextAlign.start),
                    ],
                  )
                ) // pw.Spacer(),
              ],
            ),
            pw.SizedBox(
              height: 5,
            ),
            pw.Row(
              children: [
               pw.Spacer(),
               pw.ListView.builder(
                 // shrinkWrap: true,
                 // padding: pw.EdgeInsets.only(right: 16),
                 direction: pw.Axis.horizontal,
                 itemBuilder: (context, index) {
                   return pw.Padding(
                     padding: pw.EdgeInsets.fromLTRB(2,0,5,0),
                     child: pw.Container(
                         height: 30,
                         width: 30,
                         decoration: pw.BoxDecoration(
                             shape: pw.BoxShape.circle,
                             image: pw.DecorationImage(image: images?[index] ?? image, fit: pw.BoxFit.cover)),
                         )
                     );
                 },
                 itemCount: images?.length ?? 0,
               ),
              ],
            ),
            pw.SizedBox(
              height: 10,
            ),
            pw.Divider(
              height: 3,
              color: PdfColor.fromInt(0xff35b8b0),
            ),
            pw.SizedBox(
              height: 20,
            ),
            pw.Text(
              'PRESCRIPTION',
              // Consts.PRESCRIPTION_FORM,
              style: pw.TextStyle(
                  fontSize: 17,
                  color: PdfColors.grey,
                  fontWeight: pw.FontWeight.bold),
            ),
            pw.SizedBox(
              height: 20,
            ),
            pw.Row(
              children: [
                pw.Text(
                  // "Doctor Name : ${appointment?.doctorName}",
                  '${LocalStorage.getCursorPatient().userId ?? LocalStorage.getUID()} : ${LocalStorage.getCursorPatient().patientName ?? LocalStorage.getUser().firstname} (${LocalStorage.getCursorPatient().age?? LocalStorage.getUser().age} / ${LocalStorage.getCursorPatient().gender.toString()}) - ${LocalStorage.getCursorPatient().phone?? ''}',
                  style: const pw.TextStyle(fontSize: 10),
                ),
                pw.Spacer(),
                pw.Text(
                  "Date & Time : ${DateFormat('dd/MM/yyyy  kk:mm a').format(DateTime.now())}",
                  style: const pw.TextStyle(fontSize: 10),
                ),
              ],
            ),
            pw.SizedBox(
              height: 10,
            ),
            pw.SizedBox(
              height: 10,
            ),
            pw.Table(
                defaultColumnWidth: const pw.IntrinsicColumnWidth(),
                border: pw.TableBorder.all(color: PdfColors.grey200),
                // Allows to add a border decoration around your table
                children: [
                  pw.TableRow(
                      decoration: const pw.BoxDecoration(
                        color: PdfColors.grey200,
                      ),
                      children: [
                        TableRowItems('Qty'),
                        TableRowItems('Drug Name'),
                        TableRowItems('Frequency'),
                        TableRowItems('M|A|N'),
                        TableRowItems('Days'),
                        // TableRowItems('Dosage M|A|N'),
                        TableRowItems('Food Instruction'),
                        TableRowItems('Doctor Instruction'),
                      ]),
                  for (int i = 0; i < data.length; i++)
                    pw.TableRow(children: [
                      TableRowItems(data[i]['dosage'].toString()),
                      TableRowItems(data[i]['drug_name'].toString()),
                      TableRowItems(data[i]['frequency'].toString()),
                      TableRowItems(
                          '${data[i]['MorningTime'].toString()} | \n${data[i]['AfternoonTime'].toString()} | \n${data[i]['NightTime'].toString()}'),
                      TableRowItems(data[i]['duration'].toString()),
                      // TableRowItems(
                      //     '${data[i]['Morning'] ?? ''.toString()}${data[i]['Morning'] == null ? '' : '|'}${data[i]['Afternoon'] ?? ''.toString()}${data[i]['Morning'] == null ? '' : '|'}${data[i]['Night'] ?? ''.toString()}'),
                      TableRowItems(data[i]['instruction'].toString()),
                      TableRowItems(data[i]['Doctor_Notes'] == "" || data[i]['Doctor_Notes'] == null
                          ? "No specific\ninstructions given"
                          : data[i]['Doctor_Notes']),
                    ]),
                ]),

            // pw.Divider(
            //   height: 3,
            //   color: PdfColor.fromInt(0xff35b8b0),
            // ),
            pw.SizedBox(
                height: 6
            ),
            labTest.length == 0 ? pw.Container(): pw.Row(
              children: [
                pw.Text('Lab Tests', style: pw.TextStyle(fontSize: 13),textAlign: pw.TextAlign.start),
              ]
            ),
            labTest.length == 0 ? pw.Container(): pw.SizedBox(
                height: 3
            ),
            labTest.length == 0 ? pw.Container() : pw.Table(
                defaultColumnWidth: const pw.IntrinsicColumnWidth(),
                border: pw.TableBorder.all(color: PdfColors.grey200),
                // Allows to add a border decoration around your table
                children: [
                  pw.TableRow(
                      decoration: const pw.BoxDecoration(
                        color: PdfColors.grey200,
                      ),
                      children: [
                        TableRowItems('Dept Name'),
                        TableRowItems('Test Name'),
                        TableRowItems('Instructions'),
                      ]),
                  for (int i = 0; i < labTest.length; i++)
                    pw.TableRow(children: [
                      TableRowItems(labTest[i]['DeptName'].toString()),
                      TableRowItems(labTest[i]['test_name'].toString()),
                      TableRowItems(labTest[i]['finding'].toString()),
                    ]),
                ]),
            pw.SizedBox(
                height: 10
            ),
            orgData.Revisit_Appointment_id == ''|| orgData.Revisit_Appointment_id == 0 ? pw.Container(): pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Row(),
                pw.Text('Revisit - ${orgData.reApp_Date} -${orgData.reApp_Time}', style: pw.TextStyle(fontSize: 10),textAlign: pw.TextAlign.start),
                pw.SizedBox(
                    height: 3
                ),
                pw.Text('Revisit Appointment Id - ${orgData.Revisit_Appointment_id}', style: pw.TextStyle(fontSize: 10),textAlign: pw.TextAlign.start),
              ]
            ),
            pw.Spacer(),
            pw.Divider(
              height: 3,
              color: PdfColor.fromInt(0xff35b8b0),
            ),

            pw.SizedBox(
              height: 10,
            ),
            pw.Row(
              children: [
                //pw.Icon(const pw.IconData(0xe3ab)),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      prescriptionTemplateModel.hospitalName ??"Timesmed HealthSoft Inc.,",
                      style: pw.TextStyle(
                          fontSize: 10, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      prescriptionTemplateModel.hospitalAddress ?? "Suite 21060 Homestead Road, 170, Cupertino,CA 95014, USA",
                      style: const pw.TextStyle(fontSize: 8),
                    )
                  ],
                ),
                pw.Spacer(),
                //pw.Icon(Icons.phone,color: Colors.green,size: 12),
                pw.Text(
                  '${appointment?.id?? "Appointment Id"}',
                  style: pw.TextStyle(
                      fontSize: 10, fontWeight: pw.FontWeight.bold),
                ),
              ],
            )
          ]),
        );
        // Center
      }));

  return pdf.save();
}

Future<Uint8List> _generatePdfWhenNumberofItemsIsGreaterThan15(
    AppointmentData? appointment, List data ,List labTest, MedicalRecord orgData) async {
  final pdf = pw.Document();

  final image = await imageFromAssetBundle('assets/images/timesmedlogo.png');

  pdf.addPage(pw.Page(
      theme: pw.ThemeData.withFont(
        // base: await PdfGoogleFonts.varelaRoundRegular(),
        // bold: await PdfGoogleFonts.varelaRoundRegular(),
        icons: await PdfGoogleFonts.materialIcons(),
      ),
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Padding(
          padding: const pw.EdgeInsets.all(8),
          child: pw.Column(children: [
            pw.Row(
              children: [
                pw.Spacer(),
                pw.Image(
                  logo ?? image,
                  width: 140,
                  height: 50,
                  fit: pw.BoxFit.contain,
                ),
                // pw.Spacer(),
              ],
            ),
            pw.SizedBox(
              height: 5,
            ),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(prescriptionTemplateModel.doctorName ??'Dr. Ashok Test', style: pw.TextStyle(fontSize: 12,fontWeight: pw.FontWeight.bold),),
                      pw.Text(prescriptionTemplateModel.specializations ??'Cardiologist', style: pw.TextStyle(fontSize: 12,fontWeight: pw.FontWeight.bold),),
                      pw.Text(prescriptionTemplateModel.doctorPhoneNumber ??'8038836782', style: pw.TextStyle(fontSize: 12,fontWeight: pw.FontWeight.bold),),
                      // pw.Text('9:00 AM - 12:00 PM', style: pw.TextStyle(fontSize: 12,fontWeight: pw.FontWeight.bold),),
                    ]
                ),
                //  pw.Spacer(),
                pw.Container(
                    width: 130,
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(prescriptionTemplateModel.hospitalAddress ?? '43-landmark road ,sholinganallur, chennai - 600119',textAlign: pw.TextAlign.start, style: pw.TextStyle(fontSize: 8)),
                        pw.Text('Phone :${prescriptionTemplateModel.hospitalPhoneNumber ??  1234567890}', style: pw.TextStyle(fontSize: 8),textAlign: pw.TextAlign.start),
                        pw.Text('Email : ${prescriptionTemplateModel.hospitalEmailid ??'0p6wT@example.com' }', style: pw.TextStyle(fontSize: 8),textAlign: pw.TextAlign.start),
                      ],
                    )
                ) // pw.Spacer(),
              ],
            ),
            pw.SizedBox(
              height: 5,
            ),
            pw.Row(
              children: [
                pw.Spacer(),
                pw.ListView.builder(
                  // shrinkWrap: true,
                  padding: pw.EdgeInsets.only(right: 5),
                  direction: pw.Axis.horizontal,
                  itemBuilder: (context, index) {
                    return pw.Padding(
                        padding: pw.EdgeInsets.fromLTRB(2,0,5,0),
                        child: pw.Container(
                          height: 30,
                          width: 30,
                          decoration: pw.BoxDecoration(
                              shape: pw.BoxShape.circle,
                              image: pw.DecorationImage(image: images?[index] ?? image, fit: pw.BoxFit.cover)),
                        )
                    );
                  },
                  itemCount: images?.length ?? 0,
                ),
              ],
            ),
            pw.SizedBox(
              height: 10,
            ),
            pw.Divider(
              height: 3,
              color: PdfColor.fromInt(0xff35b8b0),
            ),
            pw.SizedBox(
              height: 20,
            ),
            pw.Text(
              'PRESCRIPTION',
              // Consts.PRESCRIPTION_FORM,
              style: pw.TextStyle(
                  fontSize: 17,
                  color: PdfColors.grey,
                  fontWeight: pw.FontWeight.bold),
            ),
            pw.SizedBox(
              height: 20,
            ),
            pw.Row(
              children: [
                pw.Text(
                  '${LocalStorage.getCursorPatient().userId.toString()} : ${LocalStorage.getCursorPatient().patientName.toString()} (${LocalStorage.getCursorPatient().age.toString()} / ${LocalStorage.getCursorPatient().gender.toString()}) - ${LocalStorage.getCursorPatient().phone?? ''}',
                  // "Doctor Name : ${appointment?.doctorName}",
                  style: const pw.TextStyle(fontSize: 10),
                ),
                pw.Spacer(),
                pw.Text(
                  "Date & Time : ${DateFormat('MM/dd/yyyy  kk:mm a').format(DateTime.now())}",
                  style: const pw.TextStyle(fontSize: 10),
                ),
              ],
            ),
            pw.SizedBox(
              height: 10,
            ),
            // pw.Table(
            //     border: pw.TableBorder.all(color: PdfColors.grey200),
            //     // Allows to add a border decoration around your table
            //     children: [
            //       pw.TableRow(
            //           decoration: const pw.BoxDecoration(
            //             color: PdfColors.grey200,
            //           ),
            //           children: [
            //             TableRowItems('Patient Name'),
            //             TableRowItems('Patient ID'),
            //             TableRowItems('Age'),
            //             TableRowItems('Gender'),
            //           ]),
            //       pw.TableRow(children: [
            //         TableRowItems(
            //             LocalStorage.getCursorPatient().patientName.toString()),
            //         TableRowItems(
            //             LocalStorage.getCursorPatient().userId.toString()),
            //         TableRowItems(
            //             LocalStorage.getCursorPatient().age.toString()),
            //         TableRowItems(LocalStorage.getCursorPatient().gender ??
            //             ''.toString()),
            //       ]),
            //     ]),
            pw.SizedBox(
              height: 10,
            ),
            pw.Table(
                defaultColumnWidth: const pw.IntrinsicColumnWidth(),
                border: pw.TableBorder.all(color: PdfColors.grey200),
                // Allows to add a border decoration around your table
                children: [
                  pw.TableRow(
                      decoration: const pw.BoxDecoration(
                        color: PdfColors.grey200,
                      ),
                      children: [
                        TableRowItems('Qty'),
                        TableRowItems('Drug Name'),
                        TableRowItems('Frequency'),
                        TableRowItems('M|A|N'),
                        TableRowItems('Days'),
                        // TableRowItems('Dosage M|A|N'),
                        TableRowItems('Instruction'),
                        TableRowItems('Doctor Instruction'),
                      ]),
                  for (int i = 0; i < 15; i++)
                    pw.TableRow(children: [
                      TableRowItems(data[i]['dosage'].toString()),
                      TableRowItems(data[i]['drug_name'].toString()),
                      TableRowItems(data[i]['frequency'].toString()),
                      TableRowItems(
                          '${data[i]['MorningTime'].toString()}|\n${data[i]['AfternoonTime'].toString()}|\n${data[i]['NightTime'].toString()}'),
                      TableRowItems(data[i]['duration'].toString()),
                      // TableRowItems(
                      //     '${data[i]['Morning'] ?? ''.toString()}${data[i]['Morning'] == null ? '' : '|'}${data[i]['Afternoon'] ?? ''.toString()}${data[i]['Morning'] == null ? '' : '|'}${data[i]['Night'] ?? ''.toString()}'),
                      TableRowItems(data[i]['FoodInstr'] == ""
                          ? "No specific food\ninstructions given"
                          : data[i]['FoodInstr']),

                      TableRowItems(data[i]['instruction'].toString()),
                    ]),
                ]),
            pw.SizedBox(
                height: 6
            ),
            labTest.length == 0 ? pw.Container(): pw.Row(
                children: [
                  pw.Text('Lab Tests', style: pw.TextStyle(fontSize: 13),textAlign: pw.TextAlign.start),
                ]
            ),
            labTest.length == 0 ? pw.Container(): pw.SizedBox(
                height: 3
            ),
            labTest.length == 0 ? pw.Container() : pw.Table(
                defaultColumnWidth: const pw.IntrinsicColumnWidth(),
                border: pw.TableBorder.all(color: PdfColors.grey200),
                // Allows to add a border decoration around your table
                children: [
                  pw.TableRow(
                      decoration: const pw.BoxDecoration(
                        color: PdfColors.grey200,
                      ),
                      children: [
                        TableRowItems('Dept Name'),
                        TableRowItems('Test Name'),
                        TableRowItems('Instructions'),
                      ]),
                  for (int i = 0; i < labTest.length; i++)
                    pw.TableRow(children: [
                      TableRowItems(labTest[i]['DeptName'].toString()),
                      TableRowItems(labTest[i]['test_name'].toString()),
                      TableRowItems(labTest[i]['finding'].toString()),
                    ]),
                ]),
            pw.SizedBox(
                height: 6
            ),
            orgData.Revisit_Appointment_id == ''|| orgData.Revisit_Appointment_id == 0 ? pw.Container():  pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Row(),
                  pw.Text('Revisit - ${orgData.reApp_Date} -${orgData.reApp_Time}', style: pw.TextStyle(fontSize: 13),textAlign: pw.TextAlign.start),
                  pw.SizedBox(
                      height: 3
                  ),
                  pw.Text('Revisit Appointment Id - ${orgData.Revisit_Appointment_id}', style: pw.TextStyle(fontSize: 13),textAlign: pw.TextAlign.start),
                ]
            ),
            pw.Spacer(),
            pw.Divider(
              height: 3,
              color: PdfColor.fromInt(0xff35b8b0),
            ),
            pw.SizedBox(
              height: 10,
            ),
            pw.Row(
              children: [
                //pw.Icon(const pw.IconData(0xe3ab)),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      "Timesmed HealthSoft Inc.,",
                      style: pw.TextStyle(
                          fontSize: 10, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      "Suite 21060 Homestead Road, 170, Cupertino,CA 95014, USA",
                      style: const pw.TextStyle(fontSize: 8),
                    )
                  ],
                ),
                pw.Spacer(),
                //pw.Icon(Icons.phone,color: Colors.green,size: 12),
                pw.Text(
                  "408 316 7025",
                  style: pw.TextStyle(
                      fontSize: 10, fontWeight: pw.FontWeight.bold),
                ),
              ],
            )
          ]),
        );
        // Center
      }));

  pdf.addPage(pw.Page(
      theme: pw.ThemeData.withFont(
        // base: await PdfGoogleFonts.varelaRoundRegular(),
        // bold: await PdfGoogleFonts.varelaRoundRegular(),
        icons: await PdfGoogleFonts.materialIcons(),
      ),
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Padding(
          padding: const pw.EdgeInsets.all(8),
          child: pw.Column(children: [
            pw.Row(
              children: [
                pw.Image(
                  image,
                  height: 20,
                ),
                pw.Spacer(),
              ],
            ),
            pw.SizedBox(
              height: 10,
            ),
            pw.Divider(
              height: 2,
              color: PdfColors.grey,
            ),
            pw.SizedBox(
              height: 20,
            ),
            pw.Text(
              Consts.PRESCRIPTION_FORM,
              style: pw.TextStyle(
                  fontSize: 17,
                  color: PdfColors.grey,
                  fontWeight: pw.FontWeight.bold),
            ),
            pw.SizedBox(
              height: 20,
            ),
            pw.Row(
              children: [
                pw.Text(
                  "Doctor Name : ${appointment?.doctorName}",
                  style: const pw.TextStyle(fontSize: 10),
                ),
                pw.Spacer(),
                pw.Text(
                  "Date & Time : ${DateFormat('MM/dd/yyyy  kk:mm a').format(DateTime.now())}",
                  style: const pw.TextStyle(fontSize: 10),
                ),
              ],
            ),
            pw.SizedBox(
              height: 10,
            ),
            pw.Table(
                border: pw.TableBorder.all(color: PdfColors.grey200),
                // Allows to add a border decoration around your table
                children: [
                  pw.TableRow(
                      decoration: const pw.BoxDecoration(
                        color: PdfColors.grey200,
                      ),
                      children: [
                        TableRowItems('Patient Name'),
                        TableRowItems('Patient ID'),
                        TableRowItems('Age'),
                        TableRowItems('Gender'),
                      ]),
                  pw.TableRow(children: [
                    TableRowItems(
                        LocalStorage.getCursorPatient().patientName.toString()),
                    TableRowItems(
                        LocalStorage.getCursorPatient().userId.toString()),
                    TableRowItems(
                        LocalStorage.getCursorPatient().age.toString()),
                    TableRowItems(LocalStorage.getCursorPatient().gender ??
                        ''.toString()),
                  ]),
                ]),
            pw.SizedBox(
              height: 10,
            ),
            pw.Table(
                defaultColumnWidth: const pw.IntrinsicColumnWidth(),
                border: pw.TableBorder.all(color: PdfColors.grey200),
                // Allows to add a border decoration around your table
                children: [
                  pw.TableRow(
                      decoration: const pw.BoxDecoration(
                        color: PdfColors.grey200,
                      ),
                      children: [
                        TableRowItems('Qty'),
                        TableRowItems('Drug Name'),
                        TableRowItems('Frequency'),
                        TableRowItems('M|A|N'),
                        TableRowItems('Days'),
                        // TableRowItems('Dosage M|A|N'),
                        TableRowItems('Instruction'),
                        TableRowItems('Docotor Instruction'),
                      ]),
                  for (int i = 15; i < data.length; i++)
                    pw.TableRow(children: [
                      TableRowItems(data[i]['dosage'].toString()),
                      TableRowItems(data[i]['drug_name'].toString()),
                      TableRowItems(data[i]['frequency'].toString()),
                      TableRowItems(
                          '${data[i]['MorningTime'].toString()}|\n${data[i]['AfternoonTime'].toString()}|\n${data[i]['NightTime'].toString()}'),
                      TableRowItems(data[i]['duration'].toString()),
                      // TableRowItems(
                      //     '${data[i]['Morning'] ?? ''.toString()}${data[i]['Morning'] == null ? '' : '|'}${data[i]['Afternoon'] ?? ''.toString()}${data[i]['Morning'] == null ? '' : '|'}${data[i]['Night'] ?? ''.toString()}'),
                      TableRowItems(data[i]['FoodInstr'] == ""
                          ? "No specific food\ninstructions given"
                          : data[i]['FoodInstr']),

                      TableRowItems(data[i]['instruction'].toString()),
                    ]),
                ]),
            pw.Spacer(),
            pw.Divider(
              height: 2,
              color: PdfColors.grey,
            ),
            pw.SizedBox(
              height: 10,
            ),
            pw.Row(
              children: [
                //pw.Icon(const pw.IconData(0xe3ab)),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      prescriptionTemplateModel.hospitalName ?? "Timesmed HealthSoft Inc.,",
                      style: pw.TextStyle(
                          fontSize: 10, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      prescriptionTemplateModel.hospitalAddress ??  "Suite 21060 Homestead Road, 170, Cupertino,CA 95014, USA",
                      style: const pw.TextStyle(fontSize: 8),
                    )
                  ],
                ),
                pw.Spacer(),
                //pw.Icon(Icons.phone,color: Colors.green,size: 12),
                pw.Text(
                  appointment?.id.toString() ?? "408 316 7025",
                  style: pw.TextStyle(
                      fontSize: 10, fontWeight: pw.FontWeight.bold),
                ),
              ],
            )
          ]),
        );
        // Center
      }));

  return pdf.save();
}

TableRowItems(child) {
  return pw.Text(
    child,
    style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8),
  );
  return pw.Padding(
    padding: const pw.EdgeInsets.all(4),
    child: pw.Text(
      child,
      style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8),
    ),
  );
}

class _PrescriptionPrintState extends State<PrescriptionPrint> {
  Future<void> getTemplate() async {
    images?.clear();
    print('layout Api Url : ${'https://doctor.timesmed.com/PrintLayout/Get_Prescription_Layout_API?Hospital_Id=193976&Doctor_Id=${widget.appointment?.doctorId ?? widget.docId}&Admin_Id=0'}');
    var response = await http.get(Uri.parse('https://doctor.timesmed.com/PrintLayout/Get_Prescription_Layout_API?Hospital_Id=193976&Doctor_Id=${widget.appointment?.doctorId?? widget.docId}&Admin_Id=0'));
    if(response.statusCode == 200){

      var result =jsonDecode(response.body);
      List<dynamic> data = result.map((e) => e['Active_Flag'] == 'A' && e['DisplayFlag'] == 'A' ? e : null).toList();
      print('template body ${data}');
      if(data.length > 0){
        prescriptionTemplateModel = PrescriptionTemplateModel.fromJson(data[0]);
        logo = await getImage(prescriptionTemplateModel.hospitalLogo ?? '');
        images?.add(await getImage(prescriptionTemplateModel.accreditationImage1 ?? ''));
        images?.add(await getImage(prescriptionTemplateModel.accreditationImage2 ?? ''));
        images?.add(await getImage(prescriptionTemplateModel.awardImage ?? ''));
      }
    }else{
      print('error');
    }
  }
  bool isLoading = false;
  @override
  void initState() {
  print(widget.appointment?.doctorId);
  getData();
    super.initState();
  }
  getData()async{
    setState(() {
      isLoading = true;
    });
   await getTemplate();
   setState(() {
     isLoading = false;
   });
  }

  @override
  Widget build(BuildContext context) {
    print("name :    ${widget.data}");
    Size size = MediaQuery.of(context).size;
    return MScaffold(
      title: Text(
        Consts.PDF_PREVIEW.toUpperCase(),
        style: TextStyle(
          fontSize: size.height * 0.0165,
        ),
      ),
      body: isLoading ? LoadingWidget() : Padding(
        padding: EdgeInsets.all(size.width * 0.05),
        child: PdfPreview(
          // build: (format) => widget.data.length < 15
              // ? _generatePdfWhenNumberofItemsIsLessThan15(
              //     widget.appointment, widget.data,widget.orgData,widget.labTest)
              // : _generatePdfWhenNumberofItemsIsGreaterThan15(
              //     widget.appointment, widget.data,widget.labTest,widget.orgData),
          build:(format) => _generatePdfWithPagination(AppConfig.of(context)?.config == Config.patient, widget.appointment,widget.appId ??'', widget.data,widget.orgData,widget.labTest) ,
        ),
      ),
    );
  }
}
