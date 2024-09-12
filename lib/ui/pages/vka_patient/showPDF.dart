import 'dart:io';

import 'package:document_file_save_plus/document_file_save_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdfx/pdfx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/di/dependency_injection.dart';
import 'package:timesmedlite/facade/api_facade.dart';
import 'package:timesmedlite/model/api_response.dart';
import 'package:timesmedlite/service/firebase/messaging_monitor.dart';
import 'package:timesmedlite/ui/app/app_config.dart';
import 'package:timesmedlite/ui/pages/auth/doctor_sign_up_page.dart';
import 'package:timesmedlite/ui/pages/auth/otp_dialog.dart';
import 'package:timesmedlite/ui/components/login_header.dart';
import 'package:timesmedlite/ui/components/show_message.dart';
import 'package:timesmedlite/ui/components/waiting_dialog.dart';
import 'package:timesmedlite/ui/pages/auth/patient_sign_up_page.dart';
import 'package:timesmedlite/ui/pages/demo/demo_flow_select.dart';
import 'package:timesmedlite/ui/providers/flow_provider.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/local_storage.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';
import 'package:timesmedlite/utils/size_utils.dart';
import 'package:chopper/chopper.dart';

import '../../../model/patient.dart';
import '../../bloc/patient/patient_bloc.dart';
import '../../widgets/m_password_text_field.dart';
import 'package:flutter/services.dart' show rootBundle;

class PDFX extends StatefulWidget {
  final String asset;

  const PDFX({Key? key, this.asset='assets/VKA-FIX-P.pdf'}) : super(key: key);

  @override
  _PDFXState createState() => _PDFXState();
}

class _PDFXState extends State<PDFX> {
  static const int _initialPage = 1;
  late PdfController _pdfController;

  Future<void> _downloadPdf() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/downloaded_pdf.pdf');

    final data = await rootBundle.load(widget.asset);
    await file.writeAsBytes(data.buffer.asUint8List());
    await DocumentFileSavePlus().saveFile(data.buffer.asUint8List(), 'vka.pdf', "appliation/pdf");



    Fluttertoast.showToast(msg: 'PDF Downloaded to Downloads folder');
  }

  @override
  void initState() {
    super.initState();
    _pdfController = PdfController(
      document: PdfDocument.openAsset(widget.asset),
      initialPage: _initialPage,
    );
  }

  @override
  void dispose() {
    _pdfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade300,
        centerTitle: false,
        leading: Container(),
        title:  Text(widget.asset.split('/').last.toString(), style: TextStyle( fontWeight: FontWeight.w700)),
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: IconButton(
              icon: const Icon(Icons.download, color: Colors.white),
              onPressed: _downloadPdf,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.navigate_before),
            onPressed: () {
              _pdfController.previousPage(
                curve: Curves.ease,
                duration: const Duration(milliseconds: 100),
              );
            },
          ),
          PdfPageNumber(
            controller: _pdfController,
            builder: (_, loadingState, page, pagesCount) => Container(
              alignment: Alignment.center,
              child: Text(
                '$page/${pagesCount ?? 0}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            onPressed: () {
              _pdfController.nextPage(
                curve: Curves.ease,
                duration: const Duration(milliseconds: 100),
              );
            },
          ),
        ],
      ),
      body: PdfView(
        builders: PdfViewBuilders<DefaultBuilderOptions>(
          options: const DefaultBuilderOptions(),
          documentLoaderBuilder: (_) =>
          const Center(child: CircularProgressIndicator()),
          pageLoaderBuilder: (_) =>
          const Center(child: CircularProgressIndicator()),
        ),
        controller: _pdfController,
      ),
    );
  }
}
