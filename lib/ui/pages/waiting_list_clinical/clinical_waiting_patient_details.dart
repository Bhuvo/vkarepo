import 'package:flutter/material.dart';
import 'package:timesmedlite/ui/pages/call/call_actions.dart';
import 'package:timesmedlite/ui/widgets/m_scaffold.dart';
import 'package:timesmedlite/utils/local_storage.dart';

import '../../widgets/m_expandable_fab.dart';

class ClinicalWaitingPatient extends StatefulWidget {
  final int? patID;
  final int? apId;
  const ClinicalWaitingPatient({super.key, this.patID, this.apId});

  @override
  State<ClinicalWaitingPatient> createState() => _ClinicalWaitingPatientState();
}

class _ClinicalWaitingPatientState extends State<ClinicalWaitingPatient> {
  @override
  Widget build(BuildContext context) {
    return MScaffold(
      title: const Text('Waiting List Details'),
      body: Container(),
      floatingActionButton: CallActions(
        appointmentid: widget.apId ?? 0,
        docID: LocalStorage.getUID(),
        patID: widget.patID ?? 0,
        fab: GlobalKey<ExpandableFabState>(),
      ),
    );
  }
}
