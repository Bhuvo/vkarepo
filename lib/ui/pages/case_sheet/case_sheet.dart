import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/components/show_message.dart';
import 'package:timesmedlite/ui/widgets/MrowTextTextfieldWidget.dart';
import 'package:timesmedlite/ui/widgets/loading_widget.dart';
import 'package:timesmedlite/ui/widgets/m_divider.dart';
import 'package:timesmedlite/ui/widgets/space.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import '../../widgets/m_filled_button.dart';
import '../../widgets/m_row_text_dropdown.dart';
import '../../widgets/m_row_text_radio_widget.dart';
import 'case_sheet_controller/controller.dart';
import 'case_sheet_model/model.dart';

class CaseSheet extends StatefulWidget {
  final String? userId;
  final String? doctorId;
  final String? appointmentId;
  const CaseSheet({super.key, this.userId, this.doctorId, this.appointmentId});

  @override
  State<CaseSheet> createState() => _CaseSheetState();
}

class _CaseSheetState extends State<CaseSheet> {
  CaseSheetController controller = CaseSheetController();
  bool isLoading = false;

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    if (mounted) {
      setState(() {
        isLoading = true;
      });
    }
    await controller.getCaseSheetData(widget.userId ?? '310654');
    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      title: const Text(Consts.CASE_SHEET),
      body: isLoading
          ? LoadingWidget()
          : Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  key: ValueKey('sheet Data ${controller.caseSheetData}'),
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Space(),
                    Text(
                      'Diebetes',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Space(),
                    MrowTextTextFieldWidget(
                      title: 'Medical history : ',
                      initialValue: controller.caseSheetData.medicalHistory,
                      maxLines: 4,
                      onChanged: (val) {
                        controller.caseSheetData.medicalHistory = val;
                      },
                      isneedDivider: false,
                    ),
                    MrowTextTextFieldWidget(
                      title: 'Allergies : ',
                      initialValue: controller.caseSheetData.allergies,
                      maxLines: 4,
                      onChanged: (val) {
                        controller.caseSheetData.allergies = val;
                      },
                      isneedDivider: false,
                    ),
                    MrowTextTextFieldWidget(
                      title: 'First Complaints : ',
                      initialValue: controller.caseSheetData.firstComplaints,
                      maxLines: 4,
                      onChanged: (val) {
                        controller.caseSheetData.firstComplaints = val;
                      },
                      isneedDivider: false,
                    ),
                    MrowTextTextFieldWidget(
                      title: 'Current Treatment : ',
                      initialValue: controller.caseSheetData.currentTreatment,
                      maxLines: 4,
                      onChanged: (val) {
                        controller.caseSheetData.currentTreatment = val;
                      },
                      isneedDivider: false,
                    ),
                    MrowTextTextFieldWidget(
                      title: 'Previous Treatment : ',
                      initialValue: controller.caseSheetData.previousTreatment,
                      maxLines: 4,
                      onChanged: (val) {
                        controller.caseSheetData.previousTreatment = val;
                      },
                      isneedDivider: false,
                    ),
                    MrowTextTextFieldWidget(
                      title: 'Family History : ',
                      initialValue: controller.caseSheetData.familyHistory,
                      maxLines: 4,
                      onChanged: (val) {
                        controller.caseSheetData.familyHistory = val;
                      },
                      isneedDivider: false,
                    ),
                    MrowTextTextFieldWidget(
                      title: 'Review : ',
                      initialValue: controller.caseSheetData.review,
                      maxLines: 4,
                      onChanged: (val) {
                        controller.caseSheetData.review = val;
                      },
                      isneedDivider: false,
                    ),
                    Space(),
                    MDivider(),
                    Space(),
                    Text(
                      'Life Style',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Space(),
                    MRowTextRadioWidget(
                      title: 'Smoking : ',
                      initialValue: controller.caseSheetData.smoking,
                      onChanged: (val) {
                        controller.caseSheetData.smoking = val;
                      },
                      isneedDivider: false,
                    ),
                    MRowTextRadioWidget(
                      title: 'Drinking : ',
                      initialValue: controller.caseSheetData.drinking,
                      onChanged: (val) {
                        controller.caseSheetData.drinking = val;
                      },
                      isneedDivider: false,
                    ),
                    MRowTextRadioWidget(
                      title: 'Tobacco : ',
                      initialValue: controller.caseSheetData.tobacco,
                      onChanged: (val) {
                        controller.caseSheetData.tobacco = val;
                      },
                      isneedDivider: false,
                    ),
                    MRowTextDropDown(
                      title: 'Exercise : ',
                      items: ['Cardio', 'Yoga'],
                      initialValue: controller.caseSheetData.exercise,
                      onChanged: (val) {
                        controller.caseSheetData.exercise = val;
                      },
                      isneedDivider: false,
                    ),
                    MRowTextDropDown(
                      title: 'Diet : ',
                      items: ['Vegan', 'Vegetarian'],
                      initialValue: controller.caseSheetData.diet,
                      onChanged: (val) {
                        controller.caseSheetData.diet = val;
                      },
                      isneedDivider: false,
                    ),
                    Space(),
                    MDivider(),
                    Space(),
                    Text(
                      'Diabetes Profile',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Space(),
                    MRowTextDropDown(
                        title: 'Diabetes Type : ',
                        items: ['Type 1', 'Type 2'],
                        initialValue: controller.caseSheetData.diabetesType,
                        onChanged: (val) {
                          controller.caseSheetData.diabetesType = val;
                        },
                        isneedDivider: false),
                    MrowTextTextFieldWidget(
                      title: 'On set time : ',
                      isneedDivider: false,
                      initialValue: controller.caseSheetData.onsetTime,
                      onChanged: (val) {
                        controller.caseSheetData.onsetTime = val;
                      },
                    ),
                    MrowTextTextFieldWidget(
                      title: 'Diabetes on set from : ',
                      isneedDivider: false,
                      initialValue: controller.caseSheetData.diabetesOnsetFrom,
                      onChanged: (val) {
                        controller.caseSheetData.diabetesOnsetFrom = val;
                      },
                    ),
                    MRowTextRadioWidget(
                      title: 'Hypoglycemia : ',
                      initialValue: controller.caseSheetData.hypoglycemia,
                      onChanged: (val) {
                        controller.caseSheetData.hypoglycemia = val;
                      },
                      isneedDivider: false,
                    ),
                    MRowTextRadioWidget(
                      title: 'Diabetic foot : ',
                      initialValue: controller.caseSheetData.diabeticFoot,
                      onChanged: (val) {
                        controller.caseSheetData.diabeticFoot = val;
                      },
                      isneedDivider: false,
                    ),
                    MRowTextRadioWidget(
                      title: 'Peripheral Neuropathy : ',
                      initialValue:
                          controller.caseSheetData.peripheralNeuropathy,
                      onChanged: (val) {
                        controller.caseSheetData.peripheralNeuropathy = val;
                      },
                      isneedDivider: false,
                    ),
                    MRowTextRadioWidget(
                      title: 'Peripheral vascular disease : ',
                      initialValue:
                          controller.caseSheetData.peripheralVascularDisease,
                      onChanged: (val) {
                        controller.caseSheetData.peripheralVascularDisease =
                            val;
                      },
                      isneedDivider: false,
                    ),
                    MRowTextRadioWidget(
                      title: 'Nephropathy : ',
                      initialValue: controller.caseSheetData.nephropathy,
                      onChanged: (val) {
                        controller.caseSheetData.nephropathy = val;
                      },
                      isneedDivider: false,
                    ),
                    MRowTextRadioWidget(
                      title: 'CKD : ',
                      initialValue: controller.caseSheetData.ckd,
                      onChanged: (val) {
                        controller.caseSheetData.ckd = val;
                      },
                      isneedDivider: false,
                    ),
                    MRowTextRadioWidget(
                      title: 'Diabetic Retinopathy : ',
                      initialValue:
                          controller.caseSheetData.diabeticRetinopathy,
                      onChanged: (val) {
                        controller.caseSheetData.diabeticRetinopathy = val;
                      },
                      isneedDivider: false,
                    ),
                    MRowTextDropDown(
                      title: 'Hypertension',
                      items: ['Type 1', 'Type 2'],
                      initialValue: controller.caseSheetData.hypertension,
                      onChanged: (val) {
                        controller.caseSheetData.hypertension = val;
                      },
                      isneedDivider: false,
                    ),
                    MrowTextTextFieldWidget(
                      title: 'Lipid Diorders : ',
                      isneedDivider: false,
                      initialValue: controller.caseSheetData.lipidDisorders,
                      onChanged: (val) {
                        controller.caseSheetData.lipidDisorders = val;
                      },
                      maxLines: 4,
                    ),
                    MrowTextTextFieldWidget(
                      title: 'Other Aliments : ',
                      isneedDivider: false,
                      initialValue: controller.caseSheetData.otherAilments,
                      onChanged: (val) {
                        controller.caseSheetData.otherAilments = val;
                      },
                      maxLines: 4,
                    ),
                    MFilledButton(
                      text: 'Save',
                      onPressed: () async {
                        await controller.saveCaseSheetData(
                            widget.userId ?? '310654',
                            widget.doctorId ?? '37941',
                            widget.appointmentId ?? '11458',
                            controller.caseSheetData ?? Data());
                        showMessage(
                          context: context,
                          message: 'Case Sheet Saved Successfully',
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
