import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/components/user_info.dart';
import 'package:timesmedlite/ui/components/user_tile.dart';
import 'package:timesmedlite/ui/providers/user_provider.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';

import '../../../model/get_all_hospital_by_doctor.dart';
import 'edit_hospital_dialog.dart';

class HospitalListItem extends StatelessWidget {
  GetAllHospitalByDoctor getAllHospitalByDoctor;

  HospitalListItem({Key? key, required this.getAllHospitalByDoctor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserProvider(
      data: Consts.DUMMY_USER.copyWith(
          fullName: getAllHospitalByDoctor.hospitalName.toString(),
          image: getAllHospitalByDoctor.hospitalImage.toString() == ''
              ? null
              : getAllHospitalByDoctor.hospitalImage.toString()),
      child: MListTile(
        child: Row(
          children: [
            Expanded(
              child: UserTile(
                crossAxisAlignment: CrossAxisAlignment.start,
                emptyAvatar: FontAwesomeIcons.solidHospital,
                caption: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Type: ${getAllHospitalByDoctor.hospitalType.toString()}',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UserInfo(
                          Info.custom,
                          icon: FontAwesomeIcons.phone,
                          lable: getAllHospitalByDoctor.hospitalPhoneNumber
                              .toString(),
                          iconSize: MediaQuery.of(context).size.height * 0.015,
                        ),
                        // SizedBox(width: 5,),
                        // UserInfo(Info.custom, icon: FontAwesomeIcons.solidCalendarCheck, lable: getAllHospitalByDoctor.timing.toString(), iconSize: 16,),
                      ],
                    )
                  ],
                ),
              ),
            ),
            MIconButton(
              child: Icon(
                Icons.edit,
                color: MTheme.THEME_COLOR,
                size: 20,
              ),
              color: MTheme.THEME_COLOR,
              padding: EdgeInsets.all(4),
              onTap: () async {
                showDialog(
                  context: context,
                  builder: (c) => EditHospitalDialog(
                      getAllHospitalByDoctor: getAllHospitalByDoctor),
                );
              },
            ),
            const SizedBox(
              width: 16,
            ),
          ],
        ),
      ),
    );
  }
}
