import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:timesmedlite/ui/widgets/m_scaffold.dart';
import 'package:timesmedlite/ui/widgets/m_text_field.dart';
import 'package:timesmedlite/ui/widgets/space.dart';
import 'package:timesmedlite/utils/size_utils.dart';

class AdminSignUpPage extends StatelessWidget {
  const AdminSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      hero: false,
      paddingTop: context.getWPercent(10),
      //bodyPadding: EdgeInsets.only(top: context.getWPercent(60), bottom: 56),
      customHeader: Container(
          alignment: Alignment.center,
          height: context.getWPercent(30),
          padding: const EdgeInsets.all(20),
          child: Hero(
              tag: 'LOGO',
              child: SvgPicture.asset(
                'assets/svg/tm_logo_w.svg',
                fit: BoxFit.fitWidth,
                color: Colors.white,
                height: context.height * 0.1,
                width: context.width * 0.1,
              ))),
      body:Padding( padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 64,
          ),
          Text(
            'SignUp',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Text(
            'Please sign up to continue.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 32,
          ),

          Form(child:Column(
            children: [
              MTextField(
                label:'Admin Name',
                onTap: (){

                },
              ),
              Space(10),
              MTextField(
                label:'Admin Phone Number',
                onTap: (){

                }
              ),
              Space(10),
              MTextField(
                type: MInputType.password,
                suffixIcon: Icon(Icons.remove_red_eye),
                label:'Password',
                onTap: (){

                }
              ),
            ],
          ))
        ],
      ),
      ),
    );
  }
}
