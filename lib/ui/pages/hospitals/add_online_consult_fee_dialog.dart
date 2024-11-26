import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder.dart';
import 'package:timesmedlite/ui/components/user_info.dart';
import 'package:timesmedlite/ui/pages/hospitals/schedule_time_list_item.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/m_dialog.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../di/dependency_injection.dart';
import '../../../utils/local_storage.dart';
import '../../components/api_builder/api_builder.dart';
import '../../components/api_builder/api_builder_bloc.dart';
import '../../components/show_message.dart';
import '../../components/waiting_dialog.dart';
import '../../routes/routes.dart';

class AddOnlineConsultFeeDialog extends StatefulWidget {
  ApiBuilderBloc  bloc;
  final String? doctorId;
  var data;
   AddOnlineConsultFeeDialog({Key? key,required this.data,required this.bloc, this.doctorId}) : super(key: key);

  @override
  State<AddOnlineConsultFeeDialog> createState() => _AddOnlineConsultFeeDialogState();
}

class _AddOnlineConsultFeeDialogState extends State<AddOnlineConsultFeeDialog> {
  List<String> selDays = [];



    String CallMode='';
    String Consulation='';
    TextEditingController textcharge=TextEditingController();
    TextEditingController videocharge=TextEditingController();
    int IntervalOnline=0;

    @override
    void initState() {
    CallMode=widget.data['Mode_Name'];
    Consulation=widget.data['Condition_Name'];
    textcharge.text=widget.data['eclinicPhone'];
    videocharge.text=widget.data['eclinicVideo'];

    try {
      IntervalOnline=int.parse(widget.data['IntervalForOnline']);
    } catch (e, s) {
      IntervalOnline=0;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print(widget.data);
    return MDialog(title: Row(
      children: [
        const Expanded(child: Text('ADD ONLINE CONSULTATION SCHEDULE LIST')),
        IconButton(onPressed: (){
          context.popDialog();
        }, icon: const Icon(Icons.close_rounded))
      ],
    ),child: Expanded(
      child:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              MListTile(
                margin: const EdgeInsets.all(0),
                padding: const EdgeInsets.all(16),
                child: MRadioChip<String>(
                  items: const [
                    MRadioItem(value: 'Instant Only', label: 'Instant Only'),
                    MRadioItem(value: 'Schedule Only', label: 'Schedule Only'),
                    MRadioItem(value: 'Both Instant and Schedule', label: 'Both Instant and Schedule'),
                  ],
                  type: MRadioChipType.radio,
                  direction: Axis.vertical,
                  label: 'Call Mode',
                  value: CallMode,
                  onChanged: (s){
                    setState(() {
                    CallMode=s;
                    });
                  },
                ),
              ),
              const SizedBox(height: 16,),
              MListTile(
                margin: const EdgeInsets.all(0),
                padding: const EdgeInsets.all(16),
                child: MRadioChip<String>(
                  items: const [
                    MRadioItem(value: 'Text Consultation Only', label: 'Text Consultation Only'),
                    MRadioItem(value: 'Video Consultation Only', label: 'Video Consultation Only'),
                    MRadioItem(value: 'Both Video and Text Consultation', label: 'Both Video and Text Consultation'),
                  ],
                  type: MRadioChipType.radio,
                  direction: Axis.vertical,
                  label: 'Consultation',
                  value: Consulation,
                  onChanged: (s){
                    setState(() {
                      Consulation=s;
                    });
                  },
                ),
              ),
              const SizedBox(height: 16,),
              MTextField(
                label: 'Text Consultation Charge',
                type: MInputType.decimal,
                controller: textcharge,
              ),
              const SizedBox(height: 12,),
              MTextField(
                label: 'Video Consultation Charge',
                type: MInputType.decimal,
                controller: videocharge,
              ),
              const SizedBox(height: 12,),
              MCounterField(
                key: ValueKey('qty::$IntervalOnline'),
                value: IntervalOnline,
                onChanged: (d) {
                  setState(() {
                    IntervalOnline = d!;
                  });
                },
                label: 'Set Call Interval',

              ),
              const SizedBox(height: 12,),
              SizedBox(
                width: double.maxFinite,
                height: 50,
                child: OutlinedButton(onPressed: () async{
                  int Condition, Mode;
                  if(Consulation=="Text Consultation Only")
                    {
Condition=1;
                    }
                  else if(Consulation=="Video Consultation Only"){
                    Condition=2;

                  }else{
                    Condition=3;

                  }

                  if(CallMode=="Instant Only")
                  {
                    Mode=1;
                  }
                  else if(CallMode=="Schedule Only"){
                    Mode=2;

                  }else{
                    Mode=3;

                  }

                  print("Condition$Condition     Mode$Mode   Time$IntervalOnline  DoctrId${LocalStorage.getUID()}   TextFee${textcharge}   Voice$videocharge"
                      "Condition$Condition   Mode$Mode");

                  final call = Injector().apiService.get2(path: 'UpdateOnlineFee', query: {
                    "Time": IntervalOnline.toString(),
                    "Doctor_id": widget.doctorId ?? LocalStorage.getUID(),
                    "TxtFee": textcharge.text,
                    "VideoFee": videocharge.text,
                    "Condition": Condition,
                    "Mode": Mode,
                  });
                  final res = await showWaitingDialog(
                      context: context, call: call);
                  if (res?.body.message == "Updated") {

                    context.pop();
                    context.pop();
                    context.push(Routes.hospitalsBasedOnDoctor, {
                      'doctorId' : widget.doctorId
                    });
                    print(
                        ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::${res?.body?.message}");

                  }


                }, child: const Text('Update')),
              ),
              const SizedBox(height: 16,),
              MListTile(
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(),
                    Wrap(
                      children: [
                        UserInfo(Info.custom, icon: FontAwesomeIcons.phone, lable: 'Call Mode:', iconSize: 16,),
                        Text('${widget.data['Mode_Name']}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: MTheme.THEME_COLOR) ,),
                      ],
                    ),
                    SizedBox(height: 8,),
                    Wrap(
                      children: [
                        UserInfo(Info.custom, icon: FontAwesomeIcons.headphones, lable: 'Consultation Type:', iconSize: 16,),
                        Text('${widget.data['Condition_Name']}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: MTheme.THEME_COLOR) ,),
                      ],
                    ),
                    SizedBox(height: 8,),
                    Wrap(
                      children: [
                        UserInfo(Info.custom, icon: FontAwesomeIcons.solidClock, lable: 'Call Duration:', iconSize: 16,),
                        Text('${widget.data['IntervalForOnline']}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: MTheme.THEME_COLOR) ,),
                      ],
                    ),
                    SizedBox(height: 8,),
                    Wrap(
                      children: [
                        UserInfo(Info.custom, icon: FontAwesomeIcons.indianRupeeSign, lable: 'Text Fee:', iconSize: 16,),
                        Text('${widget.data['eclinicPhone']}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: MTheme.THEME_COLOR) ,),
                      ],
                    ),
                    SizedBox(height: 8,),
                    Wrap(
                      children: [
                        UserInfo(Info.custom, icon: FontAwesomeIcons.indianRupeeSign, lable: 'Video Fee:', iconSize: 16,),
                        Text('${widget.data['eclinicVideo']}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: MTheme.THEME_COLOR) ,),
                      ],
                    ),
                  ],
                ),)
            ],
          ),
        ),
      ),
    ));
  }
}
