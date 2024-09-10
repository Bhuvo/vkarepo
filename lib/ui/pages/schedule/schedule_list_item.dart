// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:timesmedlite/const/consts.dart';
// import 'package:timesmedlite/model/user.dart';
// import 'package:timesmedlite/ui/components/status_indicator.dart';
// import 'package:timesmedlite/ui/components/user_age_gender.dart';
// import 'package:timesmedlite/ui/components/user_tile.dart';
// import 'package:timesmedlite/ui/components/user_info.dart';
// import 'package:timesmedlite/ui/pages/schedule/schedule_details_page.dart';
// import 'package:timesmedlite/ui/providers/user_provider.dart';
// import 'package:timesmedlite/ui/routes/routes.dart';
// import 'package:timesmedlite/ui/theme/theme.dart';
// import 'package:timesmedlite/ui/widgets/widgets.dart';
// import 'package:timesmedlite/utils/navigator_utils.dart';
//
// import '../../../utils/local_storage.dart';
// import '../../components/api_builder/api_builder.dart';
// import '../../components/api_builder/api_builder_bloc.dart';
//
// class ScheduleListItem extends StatelessWidget {
//    ScheduleListItem({Key? key}) : super(key: key);
//
//   final bloc = ApiBuilderBloc(
//         path: 'PatientDetails', query: {'Patient_Id': '52070'// needs to change once we receive the patient id from previous screen
//   }, raw: true);
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       // UserProvider(
//       // data: Consts.DUMMY_USER,
//       // child:
//       BlocProvider(
//   create: (context) => bloc..add(const Load()),
//   child:ApiBuilder<User>(
//   fromJson: User.fromJsonFactory,
//     customBuilder: (data, load) {
//     return MListTile(
//         actions: [
//           CustomSlidableAction(
//             padding: const EdgeInsets.all(0),
//             onPressed: (BuildContext context) {  },
//             backgroundColor: Colors.transparent,
//             child: const MIconButton(
//               color: MTheme.THEME_COLOR,
//               child: Icon(Icons.remove_red_eye_rounded, color: MTheme.THEME_COLOR,),
//             ),
//           )
//         ],
//         onTap: (){
//           //context.push(Routes.patientInrDetails,{'patientdetails': data.first.patientid} );
//           Navigator.push(context, MaterialPageRoute(builder: (context)=>ScheduleDetailsPage(patientID: data.first.patientid,TTR:data.first.TTR ,patientage:data.first.patientage,gender:data.first.gender,phoneNumber:data.first.phoneNumber,TTRfrom: data.first.TTRfrom,TTRto: data.first.TTRto,)));
//         },
//         child: Column(
//           children: [
//              UserTile(
//               caption:Text('Age: ${data.first.patientage}, ${data.first.gender}', ),
//               trailing:UserInfo(Info.custom, icon: FontAwesomeIcons.userCheck, lable:"${data.first.patientid.toString()}", textColor: MTheme.THEME_COLOR, textSize: 12, iconSize: 14,),
//
//             ),
//             MGradientContainer(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children:  [
//                       UserInfo(Info.custom, icon: Icons.phone, lable:"${data.first.phoneNumber.toString()}", textColor: MTheme.THEME_COLOR, textSize: 12, iconSize: 14,),
//                       Spacer(),
//                       StatusIndicator(label: 'Pending')
//                     ],
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//     ) ;
//     })
// );
//   //  );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/model/user.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder_bloc.dart';
import 'package:timesmedlite/ui/components/status_indicator.dart';
import 'package:timesmedlite/ui/components/user_age_gender.dart';
import 'package:timesmedlite/ui/components/user_tile.dart';
import 'package:timesmedlite/ui/components/user_info.dart';
import 'package:timesmedlite/ui/pages/schedule/schedule_details_page.dart';
import 'package:timesmedlite/ui/providers/user_provider.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../providers/patient_provider.dart';

class ScheduleListItem extends StatelessWidget {
  final ApiBuilderBloc bloc;
  final data;
  const ScheduleListItem({Key? key,this.data,required this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return PatientProvider(
      data: data,
      child: MListTile(
        // actions: [
        //   CustomSlidableAction(
        //     padding: const EdgeInsets.all(0),
        //     onPressed: (BuildContext context) {  },
        //     backgroundColor: Colors.transparent,
        //     child: const MIconButton(
        //       color: MTheme.THEME_COLOR,
        //       child: Icon(Icons.remove_red_eye_rounded, color: MTheme.THEME_COLOR,),
        //     ),
        //   )
        // ],
        onTap: ()async{
          print("XXXXX${data.id} ${data.doctorId } ${data.age } ${data.gender } ${data.phone } ${data.inrFrom } ${data.inrTo }");
         await context.push(Routes.myInrDetails, {'DcoID': data?.doctorId,'PatID': data?.id.toString()});
         bloc.add(Load());//Navigator.push(context, MaterialPageRoute(builder: (context)=>ScheduleDetailsPage(patientID: data.id,TTR:data.ttr ,patientage:data.age,gender:data.gender,phoneNumber:data.phone,TTRfrom: data.inrFrom,TTRto: data.inrTo,)));
        },
        child: Column(
          children: [
            const UserTile(
              caption: UserAgeGender(),
              trailing: UserInfo(Info.id),
            ),
            MGradientContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children:  [
                      UserInfo(Info.phone),
                      Spacer(),
                      StatusIndicator(label: 'Pending')
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
