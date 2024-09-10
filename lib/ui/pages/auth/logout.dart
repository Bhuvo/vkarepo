import 'package:flutter/material.dart';
import 'package:timesmedlite/ui/components/confirm_dialog.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/utils/local_storage.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';


logOut(BuildContext context){
  showConfirmDialog(context: context, actions: {
    'Logout': (){
      LocalStorage.clear();
      backStack.clear();
      context.pushAndRemoveUntil(Routes.login, (_) => false);
    }
  }, message: 'Are you sure want to Logout?');
}