import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/model/inr_patient.dart';
import 'package:timesmedlite/model/patient.dart';
import 'package:timesmedlite/model/user.dart';
import 'package:timesmedlite/ui/components/user_age_gender.dart';
import 'package:timesmedlite/ui/components/user_tile.dart';
import 'package:timesmedlite/ui/components/user_info.dart';
import 'package:timesmedlite/ui/providers/patient_provider.dart';
import 'package:timesmedlite/ui/providers/user_provider.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../routes/routes.dart';

class LineListItem extends StatelessWidget {
  final InrPatient? data;
  const LineListItem({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MListTile(
      // actions: [
      //   CustomSlidableAction(
      //     padding: const EdgeInsets.all(0),
      //     onPressed: (BuildContext context) {
      //       print("Routes.myInrDetailsRoutes.myInrDetailsRoutes.myInrDetailsRoutes.myInrDetailsRoutes.myInrDetailsRoutes.myInrDetailsRoutes.myInrDetails : ${data?.Doctor_Id}   ${data?.Patient_Id}  ");
      //       context.push(Routes.myInrDetails, {'DcoID': data?.Doctor_Id,'PatID': data?.Patient_Id.toString()});
      //     },
      //     backgroundColor: Colors.transparent,
      //     child: const MIconButton(
      //       color: MTheme.THEME_COLOR,
      //       child: Icon(Icons.remove_red_eye_rounded, color: MTheme.THEME_COLOR,),
      //     ),
      //   )
      // ],
      onTap: (){
        print("card tab clicked");
        print("Routes.myInrDetailsRoutes.myInrDetailsRoutes.myInrDetailsRoutes.myInrDetailsRoutes.myInrDetailsRoutes.myInrDetailsRoutes.myInrDetails : ${data?.Doctor_Id}   ${data?.Patient_Id}  ");
        context.push(Routes.myInrDetails, {'DcoID': data?.Doctor_Id,'PatID': data?.Patient_Id.toString()});
      },
      child: PatientProvider(
        data: Patient.fromJson(data!.toJson()),
        child: Column(
          children: [
             UserTile(
              caption: const UserAgeGender(),
              trailing: Row(
                children: const [
                  //UserInfo(Info.custom, icon: Icons.date_range, lable: 'Api date missing',),
                   UserInfo(Info.id),
                ],
              ),
            ),
            MGradientContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children:  [
                      const UserInfo(Info.phone),
                      const Spacer(),
                      Wrap(
                        children: [
                          const Text('Target INR:', style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w600),),
                          const SizedBox(width: 8,),
                          Text('${data?.Traget_INR_From} - ${data?.Traget_INR_To}', style: TextStyle(color: Colors.red.shade500, fontSize: 14, fontWeight: FontWeight.w600),),
                        ],
                      )
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
