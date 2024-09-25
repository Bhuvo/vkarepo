import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../../const/consts.dart';
import '../../../model/appointment_data.dart';
import '../../../utils/local_storage.dart';
import '../../widgets/m_scaffold.dart';

class PrescriptionPrint extends StatefulWidget {
  final List data;
  final AppointmentData? appointment;

  const PrescriptionPrint({Key? key, required this.data, this.appointment})
      : super(key: key);

  @override
  State<PrescriptionPrint> createState() => _PrescriptionPrintState();
}

Future<Uint8List> _generatePdfWhenNumberofItemsIsLessThan15(
    AppointmentData? appointment, List data) async {
  final pdf = pw.Document();

  final image = await imageFromAssetBundle('assets/images/timesmedlogo.png');

  pdf.addPage(pw.Page(
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
                  "Date & Time : ${DateFormat('dd/MM/yyyy – kk:mm a').format(DateTime.now())}",
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
                    TableRowItems(
                      LocalStorage.getCursorPatient().gender.toString(),
                    ),
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

  return pdf.save();
}

Future<Uint8List> _generatePdfWhenNumberofItemsIsGreaterThan15(
    AppointmentData? appointment, List data) async {
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
                  "Date & Time : ${DateFormat('MM/dd/yyyy – kk:mm a').format(DateTime.now())}",
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
                  "Date & Time : ${DateFormat('MM/dd/yyyy – kk:mm a').format(DateTime.now())}",
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
      body: Padding(
        padding: EdgeInsets.all(size.width * 0.05),
        child: PdfPreview(
          build: (format) => widget.data.length < 15
              ? _generatePdfWhenNumberofItemsIsLessThan15(
                  widget.appointment, widget.data)
              : _generatePdfWhenNumberofItemsIsGreaterThan15(
                  widget.appointment, widget.data),
        ),
      ),
    );
  }
}
