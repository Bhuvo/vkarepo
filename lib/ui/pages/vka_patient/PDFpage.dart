import 'package:flutter/material.dart';
import 'package:timesmedlite/ui/pages/home/homepage_base.dart';
import 'package:timesmedlite/ui/pages/vka_patient/showPDF.dart';
import 'package:timesmedlite/ui/widgets/m_scaffold.dart';

import '../../app/app_config.dart';
import '../../components/patient_bottom_navigation.dart';

class PDFVKA extends StatelessWidget {
  const PDFVKA({super.key});

  @override
  Widget build(BuildContext context) {
    return  AppConfig.of(context)?.config == Config.patient?MScaffold(
        bottom: const PatientBottomNavigation(),
        body: PDFX(asset:AppConfig.of(context)?.config == Config.patient?'assets/VKA-FIX-P.pdf':'assets/VKA-FIX-D.pdf')):HomePageBase(body: PDFX(asset:AppConfig.of(context)?.config == Config.patient?'assets/VKA-FIX-P.pdf':'assets/VKA-FIX-D.pdf'), title: '',);
  }
}
