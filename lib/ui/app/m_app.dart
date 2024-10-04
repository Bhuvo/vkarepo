import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:timesmedlite/ui/app/app_config.dart';
import 'package:timesmedlite/ui/app/app_scroll.dart';
import 'package:timesmedlite/ui/bloc/patient/patient_bloc.dart';
import 'package:timesmedlite/ui/components/connectivity/connectivity_bloc.dart';
import 'package:timesmedlite/ui/pages/demo/demo_flow_select.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/ui/routes/routes_generator.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:firebase_notifications_handler/firebase_notifications_handler.dart';

import 'package:flutter/cupertino.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../main_doctor.dart';

final GlobalKey<ScaffoldMessengerState> snackbarKey = GlobalKey<ScaffoldMessengerState>();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MApp extends StatelessWidget {
  const MApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildWithBlocs(child: MaterialApp(
      title: '${AppConfig.of(context)?.appDisplayName}',
      theme: MTheme.lightTheme,
      //darkTheme: MTheme.darkTheme,
       scaffoldMessengerKey: snackbarKey, // <
      navigatorKey:navigatorKey ,// = this
      // scrollBehavior: const ScrollBehaviorModified(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        DefaultCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en')
      ],
      locale: const Locale('en'),
      initialRoute: Routes.splash,
      onGenerateRoute: RouteGenerator.generateRoute,
    ));
  }

  Widget buildWithBlocs({required Widget child}){
    return BlocProvider<ConnectivityBloc>(
      create: (c) => ConnectivityBloc(),
      child: BlocProvider<PatientBloc>(
        create: (c) => PatientBloc(),
        child: Portal(
          child: child,
        ),
      ),
    );
  }
}

// FCMhandling(context) {
//   //FOREGROUND MESSAGES
//   FirebaseMessaging.onMessage.listen((message) {
//     print("MESSAGE::::::::::::::::::::::::::::: $message");
//
//     //_showSnackBar(message: message);
//     Scaffold.of(context).showSnackBar(snackBar);
//   });
//   //BACKGROUND MESSAGES - ONRESUME
//   FirebaseMessaging.onMessageOpenedApp.listen((message) {
//     //Detect your current screen if you wish when "onResume" called.
//     // if( currentScreenPath == 'FirstScreen' ){
//     //   Navigator.push(context, MaterialPageRoute(builder: (context)=>FCMMessageDoctorAcceptorRejectUserInstantRequest()));
//     // } else {
//     //   debugPrint('Specific screen is already foreground!');
//     //   _showSnackBar(message: message);
//     // }
//     Navigator.push(context, MaterialPageRoute(builder: (context) =>
//         FCMMessageDoctorAcceptorRejectUserInstantRequest()));
//   });
//   //BACKGROUND MESSAGES - ONLAUNCH
//   if (FirebaseMessaging.instance != null) {
//     FirebaseMessaging.instance!.getInitialMessage().then((message) {
//       if (null != message) {
//         // _navigateSpecificScreen();
//         Navigator.push(context, MaterialPageRoute(builder: (context) =>
//             FCMMessageDoctorAcceptorRejectUserInstantRequest()));
//       }
//     });
//   }
// }

