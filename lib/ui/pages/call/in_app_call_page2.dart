// import 'dart:io';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:opentok_flutter/opentok.dart';
// import 'package:opentok_flutter/opentok_view.dart';
// import 'package:timesmedlite/di/dependency_injection.dart';
// import 'package:timesmedlite/ui/components/doctor_header.dart';
// import 'package:timesmedlite/ui/pages/call/call_actions.dart';
// import 'package:timesmedlite/ui/pages/call/extend_call_dialog.dart';
// import 'package:timesmedlite/ui/routes/routes.dart';
// import 'package:timesmedlite/ui/theme/theme.dart';
// import 'package:timesmedlite/ui/widgets/widgets.dart';
// import 'package:timesmedlite/utils/local_storage.dart';
// import 'package:timesmedlite/utils/navigator_utils.dart';
// import 'package:timesmedlite/utils/string_utils.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'call_bloc.dart';
//
// class InCallAppPage2 extends StatefulWidget {
//   final bool doctor;
//   final String? token, session, apId, title, keyId;
//   final int? patID;
//   const InCallAppPage2({Key? key, this.patID ,this.doctor = false, this.session, this.token, this.apId, this.title, this.keyId}) : super(key: key);
//
//   @override
//   State<InCallAppPage2> createState() => _InCallAppPage2State();
// }
//
// class _InCallAppPage2State extends State<InCallAppPage2> with WidgetsBindingObserver {
//   final CallBloc bloc = CallBloc();
//   final GlobalKey<ExpandableFabState> fab = GlobalKey();
//
//   late OpenTokConfig config;
//   OpenTokController? controller;
//   String appointmentID="157224";
//
//   GlobalKey<MTimerState> timer = GlobalKey();
//   Duration maximum = const Duration(minutes: 15);
//
//   late DocumentReference session;
//
//   @override
//   void initState() {
//     session = FirebaseFirestore.instance.collection('session').doc(widget.session != '' ? widget.session :'mia');
//     config = OpenTokConfig(apiKey:'45704562', sessionId: widget.session!, token: widget.token!);
//     controller = OpenTokController();
//     appointmentID = widget.apId ?? appointmentID;
//     WidgetsBinding.instance.addObserver(this);
//     initFirestore();
//     _initSession();
//     super.initState();
//   }
//
//   initFirestore() async {
//     final r = await session.get();
//
//
//     if(r.exists){
//       await session.update({widget.doctor ? 'doctor' : 'patient': true}, );
//     } else {
//       await session.set({widget.doctor ? 'doctor' : 'patient': true});
//     }
//
//     session.snapshots().listen((event) {
//       final data = event.data();
//       if(data is Map){
//         if(data[widget.doctor ? 'patient' : 'doctor'] == true){
//
//         }
//         if(data[widget.doctor ? 'patient-reject' : 'doctor-reject'] == true){
//           if(mounted){
//             onEnded();
//           }
//         }
//         if(data[widget.doctor ? 'patient-streamed' : 'doctor-streamed'] == true){
//           if(mounted){
//             Injector().apiService.get(path: 'TimeTracker', query: {
//               'Appointment_Id': widget.apId
//             });
//             timer.currentState?.start();
//           }
//         }
//       }
//     });
//
//   }
//   onEnded() async  {
//     context.pop();
//     if(widget.doctor){
//       context.push(Routes.updateCallStatus, {'appointmentIDFromCallScreen':'${appointmentID}','currentCallKey':'${widget.keyId}'});
//     } else {
//       context.push(Routes.feedbackPage);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final double paddingTop = widget.doctor ? 76 : 0;
//
//     return BlocProvider(
//       create: (context) => bloc,
//       child: BlocConsumer<CallBloc, CallState>(
//         listener: (context, state) {
//           if (state is EndCall) {}
//         },
//         builder: (context, state) {
//           final read = context.watch<CallBloc>();
//
//           return MScaffold(
//             title: Text((widget.title ?? '').toUpperCase()),
//             appBarBottom: widget.doctor ? const DoctorHeader() : null,
//             actions: [
//               IconButton(
//                   onPressed: () {
//                     bloc.add(const SwitchCamera());
//                     controller?.toggleCamera();
//                   },
//                   icon: const FaIcon(Icons.flip_camera_ios_outlined))
//             ],
//             bodyPadding: EdgeInsets.only(top: paddingTop),
//             body: Stack(
//               children: [
//                 OpenTokView(
//                   controller: controller!,
//                   padding: const EdgeInsets.only(bottom: 10),
//                   onFullScreenButtonTap: null,
//                   onEndButtonTap: null,
//                   onCameraButtonTap: null,
//                   onMicButtonTap: null,
//                   onVideoButtonTap: null,
//                 ),
//                 // read.view ? buildUserCam(context) : buildOppositeCam(context),
//                 //
//                 // Positioned(
//                 //   top: 80,
//                 //   right: 16,
//                 //   child: Stack(
//                 //     children: [
//                 //       Material(
//                 //         shape: const CircleBorder(
//                 //             side: BorderSide(color: Colors.white)),
//                 //         clipBehavior: Clip.antiAlias,
//                 //         elevation: 4.0,
//                 //         child: read.view ? buildOppositeCam(context, small: true): buildUserCam(context, small: true),
//                 //       ),
//                 //       Positioned(
//                 //         bottom: 0,
//                 //         right: 0,
//                 //         child: MIconButton(
//                 //           onTap: () {
//                 //             bloc.add(const ToggleView());
//                 //           },
//                 //           solid: Colors.white,
//                 //           color: MTheme.THEME_COLOR,
//                 //           padding: const EdgeInsets.all(4),
//                 //           child: const Icon(
//                 //             Icons.sync,
//                 //             color: Colors.grey,
//                 //             size: 20,
//                 //           ),
//                 //         ),
//                 //       )
//                 //     ],
//                 //   ),
//                 // ),
//                 Positioned(
//                   top: 90,
//                   left: 32,
//                   child: MTimer(
//                     key: timer,
//                     autoStart: false,
//                     maximum: maximum, builder: (d){
//                       final rem = maximum - d;
//
//                     return Wrap(
//                       spacing: 8,
//                       children: [
//                         Material(
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(4)),
//                           clipBehavior: Clip.antiAlias,
//                           color: Colors.white30,
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 5, vertical: 2),
//                             child: Row(
//                               children: [
//                                 Container(
//                                   width: 8,
//                                   height: 8,
//                                   decoration: const BoxDecoration(
//                                       shape: BoxShape.circle, color: Colors.red),
//                                 ),
//                                 const SizedBox(
//                                   width: 4,
//                                 ),
//                                 Text(
//                                   printDuration(d),
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .caption
//                                       ?.copyWith(fontSize: 13),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         if(widget.doctor)...[
//                           Material(
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(4)),
//                             clipBehavior: Clip.antiAlias,
//                             color: Colors.green.withOpacity(0.5),
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 5, vertical: 2),
//                               child: Text(
//                                 printDuration(maximum),
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .caption
//                                     ?.copyWith(fontSize: 13),
//                               ),
//                             ),
//                           ),
//                           Material(
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(4)),
//                             clipBehavior: Clip.antiAlias,
//                             color: Colors.red.withOpacity(0.5),
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 5, vertical: 2),
//                               child: Text(
//                                 printDuration(rem),
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .caption
//                                     ?.copyWith(fontSize: 13),
//                               ),
//                             ),
//                           ),
//                           Material(
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(4)),
//                             clipBehavior: Clip.antiAlias,
//                             color: Colors.amber,
//                             child: InkWell(
//                               borderRadius: BorderRadius.circular(4),
//                               onTap: () async {
//                                 final res = await showDialog(context: context, builder: (c) =>  ExtendCallDialog(appointmentID: appointmentID,));
//                                 if(res is String){
//                                   if(res.contains(':')){
//                                     final l = res.split(':');
//                                     if(l.length == 2){
//                                       final h = int.parse(l[0]);
//                                       final m = int.parse(l[1]);
//                                       final now = DateTime.now();
//                                       final n = DateTime(now.year, now.month, now.day, now.hour, now.minute);
//                                       final e = DateTime(n.year, n.month, n.day, h, m);
//                                       final d = n.difference(e).abs();
//                                       setState(() {
//                                         maximum += d;
//                                       });
//                                       timer.currentState?.extend(d);
//                                     }
//                                   }
//                                 }
//                               },
//                               child: Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 5, vertical: 2),
//                                 child: Text(
//                                   'Extend',
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .caption
//                                       ?.copyWith(fontSize: 13),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ]
//                       ],
//                     );
//                   },),
//                 ),
//                 if(widget.doctor)CallActions(appointmentid: widget.apId ,fab: fab,docID: LocalStorage.getUID(),patID: widget.patID,)
//
//               ],
//             ),
//             bottom: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   MIconButton(
//                     child:
//                         Icon(read.video ? Icons.videocam : Icons.videocam_off),
//                     onTap: () {
//                       bloc.add(const ToggleVideo());
//                       controller!.toggleCamera();
//                     },
//                   ),
//                   MIconButton(
//                     onTap: () {
//                       bloc.add(const ToggleMic());
//                       controller!.toggleAudio(read.mute);
//                     },
//                     solid: Colors.white,
//                     color: MTheme.THEME_COLOR,
//                     child: Icon(
//                         read.mute
//                             ? CupertinoIcons.mic_slash_fill
//                             : CupertinoIcons.mic_fill,
//                         color: MTheme.THEME_COLOR),
//                   ),
//                   MIconButton(
//                     solid: Colors.red,
//                     onTap: onEnded,
//                     padding: const EdgeInsets.all(16),
//                     forceBorder: true,
//                     child: const Icon(
//                       Icons.phone_disabled,
//                       size: 30,
//                     ),
//                   ),
//                   MIconButton(
//                     onTap: () {
//                       bloc.add(const ToggleSpeaker());
//
//                     },
//                     solid: Colors.white,
//                     color: MTheme.THEME_COLOR,
//                     child: Icon(
//                         read.speaker
//                             ? CupertinoIcons.volume_up
//                             : CupertinoIcons.volume_off,
//                         color: MTheme.THEME_COLOR),
//                   ),
//                   // MIconButton(
//                   //   onTap: () {
//                   //     context.push(Routes.inAppChatPage);
//                   //   },
//                   //   solid: Colors.white,
//                   //   color: MTheme.THEME_COLOR,
//                   //   child: const Icon(CupertinoIcons.chat_bubble_fill,
//                   //       color: MTheme.THEME_COLOR),
//                   // ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   bool _sessionInited = false;
//   bool _isPublishing = false;
//
//   int _pluginViewId = -1;
//
//
//
//   Future<void> _initSession() async {
//     if (_isPublishing) {
//       _unpublishStream();
//     }
//     if (_sessionInited) {
//       controller?.endSession();
//     }
//     final res = controller?.initSession(config);
//     debugPrint('INIT OPENTOK');
//     setState(() {
//       _sessionInited = true;
//       _isPublishing = false;
//     });
//     await Future.delayed(const Duration(milliseconds: 3000));
//     await _publishStream();
//
//     timer.currentState?.start();
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
//       Map<Permission, PermissionStatus> statuses = await [
//         Permission.camera,
//         Permission.microphone,
//       ].request();
//       final isGranted = statuses[Permission.camera] == PermissionStatus.granted &&
//           statuses[Permission.microphone] == PermissionStatus.granted;
//       if (isGranted) {
//
//       } else {
//         debugPrint("Camera or Microphone permission or both denied by the user!");
//       }
//     });
//
//   }
//
//   Future<void> _publishStream() async {
//     //String ret = await controller?.;
//     if(mounted) {
//       setState(() {
//       _isPublishing = true;
//     });
//     }
//   }
//
//   Future<void> _unpublishStream() async {
//
//     if(mounted) {
//       setState(() {
//       _isPublishing = false;
//     });
//     }
//   }
//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     switch (state) {
//       case AppLifecycleState.resumed:
//         controller?.resume();
//         break;
//       case AppLifecycleState.paused:
//         controller?.pause();
//         break;
//       default:
//     }
//   }
//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     if (_isPublishing) {
//       _unpublishStream();
//     }
//     if (_sessionInited) {
//       controller?.endSession();
//     }
//     session.update({
//       widget.doctor ? 'doctor-reject' : 'patient-reject': true
//     });
//     super.dispose();
//   }
//
// }
