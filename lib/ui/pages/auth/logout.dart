import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timesmedlite/ui/bloc/patient/patient_bloc.dart';
import 'package:timesmedlite/ui/components/confirm_dialog.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/utils/local_storage.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../model/patient.dart';
import '../../components/api_builder/api_builder.dart';
import '../../components/api_builder/api_builder_bloc.dart';
import '../../providers/patient_provider.dart';
import '../../theme/theme.dart';
import '../../widgets/m_list_tile.dart';
import '../appointment/book_appointment_page.dart';


logOut(BuildContext context){
  showConfirmDialog(context: context, actions: {
    'Logout': (){
      LocalStorage.clear();
      backStack.clear();
      context.pushAndRemoveUntil(Routes.login, (_) => false);
    }
  }, message: 'Are you sure want to Logout?');
}

