import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../../model/saved_presc.dart';
import '../../../components/api_builder/api_builder.dart';
import '../../../components/api_builder/api_builder_bloc.dart';
import '../../../widgets/m_dialog.dart';
import '../drug_list_item.dart';
import 'drug_list_item_template.dart';

class SingleTempalteViewDialog extends StatefulWidget {
  final appointment_id_for_this_template,Template_Name,Description;
   SingleTempalteViewDialog({Key? key,this.appointment_id_for_this_template,this.Description,this.Template_Name}) : super(key: key);

  @override
  State<SingleTempalteViewDialog> createState() => _SingleTempalteViewDialogState();
}

class _SingleTempalteViewDialogState extends State<SingleTempalteViewDialog> {
  @override
  Widget build(BuildContext context) {
    final bloc = ApiBuilderBloc(path: 'SavedPresc', query: {
      'Appointment_id': widget.appointment_id_for_this_template,
    });

    return MDialog(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      title: Row(
        children: [
          Text(widget.Template_Name),
          const Spacer(),
          IconButton(
              onPressed: () {
                context.popDialog();
              },
              icon: const Icon(Icons.close_rounded))
        ],
      ),
      child:Padding(
        padding: const EdgeInsets.all(4.0),
        child: BlocProvider(
          create: (c) => bloc..add(const Load()),
          child: ApiBuilder<SavedPrescription>(

            direction: Axis.vertical,
            shrinkWrap: true,
            fromJson: SavedPrescription.fromJsonFactory,
            builder: (SavedPrescription data, int index) {
              print("data ::::::::::::::::: ${data}");
              return DrugListItemTemplate(data: data,appointmentid:  widget.appointment_id_for_this_template,Template_Name: widget.Template_Name,Description: widget.Description,);
            },
          ),
        ),
      ),
    );
  }
}
