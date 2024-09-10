import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/components/content_view.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/m_scaffold.dart';

import '../../../model/clinical_note_loadsummary.dart';

class ClinicalNotesView extends StatelessWidget {
  const ClinicalNotesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)?.settings.arguments as ClinicalNotesLoadSummary;
    print("DATA:::::::::::::::::::::::::::::::::${data.Summary_id}");
    return MScaffold(
      title: const Text(Consts.CLINICAL_NOTES),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ContentView(
                    label: 'Height',
                    content: "${data.Height} cm",
                    isExpanded: true,
                    icon: FontAwesomeIcons.personArrowUpFromLine,
                  ),
                  ContentView(
                    label: 'Weight',
                    content: '${data.Weight} kg',
                    isExpanded: true,
                    icon: FontAwesomeIcons.weightScale,
                  ),
                ],
              ),
              Row(
                children: [
                  ContentView(
                      label: 'Pulse',
                      content: '${data.Pulse} /min',
                      isExpanded: true,
                      icon: FontAwesomeIcons.heartPulse),
                  ContentView(
                      label: 'Temperature',
                      content: '${data.Temp} c',
                      isExpanded: true,
                      icon: FontAwesomeIcons.thermometerHalf),
                ],
              ),
              ContentView(
                  label: 'Disease Complaints',
                  content: data.Disease_name.toString()),
              ContentView(
                  label: 'Allergies', content: data.Allergies.toString()),
              ContentView(label: 'Symptoms', content: data.Symptoms.toString()),
              ContentView(
                  label: 'Diagnosis', content: data.Diagnoses.toString()),
              ContentView(label: 'Causes', content: data.Causes.toString()),
              ContentView(
                  label: 'Investigation',
                  content: data.Investigation.toString()),
              ContentView(label: 'Notes', content: data.Notes.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
