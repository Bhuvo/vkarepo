import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/di/dependency_injection.dart';
import 'package:timesmedlite/model/patient.dart';
import 'package:timesmedlite/ui/components/show_message.dart';
import 'package:timesmedlite/ui/components/waiting_dialog.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/local_storage.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

class PatientRegister extends StatefulWidget {
  final Patient data;

  const PatientRegister(
      {Key? key, this.data = const Patient(id: 0,)})
      : super(key: key);

  @override
  State<PatientRegister> createState() => _PatientRegisterState(data);
}

class _PatientRegisterState extends State<PatientRegister> {
  final GlobalKey<FormState> form = GlobalKey();
  Patient data;
  _PatientRegisterState(this.data);

  @override
  void initState() {
    if(data.doctorId == null) data = data.copyWith(doctorId: LocalStorage.getUser().id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      title: Text(Consts.PATIENT_REGISTRATION.toUpperCase()),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Form(
            key: form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MTextField(
                  label: 'Patient Registration Number',
                  value: data.regNo,
                  type: MInputType.numeric,
                  onChanged: (d) {
                    data = data.copyWith(regNo: d);
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                MTextField(
                  label: 'First Name',
                  value: data.firstName,
                  onChanged: (d) {
                    data = data.copyWith(firstName: d);
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                MTextField(
                  label: 'Last Name',
                  value: data.lastName,
                  onChanged: (d) {
                    data = data.copyWith(lastName: d);
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                MTextField(
                  label: 'Age',
                  value: data.age,
                  type: MInputType.numeric,
                  onChanged: (d) {
                    data = data.copyWith(age: d);
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                MRadioChip<String>(
                  value: data.gender,
                  onChanged: (d) {
                    setState(() {
                      data = data.copyWith(gender: d);
                    });
                  },
                  items: const [
                    MRadioItem(
                        value: 'Male',
                        icon: FontAwesomeIcons.person,
                        label: 'Male'),
                    MRadioItem(
                        value: 'Female',
                        icon: FontAwesomeIcons.personDress,
                        label: 'Female'),
                  ],
                  label: 'Gender',
                ),
                const SizedBox(
                  height: 16,
                ),
                MTextField(
                  label: 'Phone Number',
                  value: data.phone,
                  type: MInputType.phone,
                  onChanged: (d) {
                    data = data.copyWith(phone: d);
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                MTextField(
                  label: 'WhatsApp Number',
                  value: data.whatsapp,
                  type: MInputType.phone,
                  onChanged: (d) {
                    data = data.copyWith(whatsapp: d);
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                MTextField(
                  label: 'Mail Id',
                  value: data.email,
                  type: MInputType.email,
                  onChanged: (d) {
                    data = data.copyWith(email: d);
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                MTextField(
                  label: 'Password',
                  type: MInputType.password,
                  value: data.password,
                  onChanged: (d) {
                    data = data.copyWith(password: d);
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Target INR',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Expanded(
                      child: MTextField(
                        label: 'From',
                        type: MInputType.decimal,
                        value: data.inrFrom,
                        onChanged: (d) {
                          data = data.copyWith(inrFrom: d);
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: MTextField(
                        label: 'To',
                        type: MInputType.decimal,
                        value: data.inrTo,
                        onChanged: (d) {
                          data = data.copyWith(inrTo: d);
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                        child: OutlinedButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: const Text(
                        'Close',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red)),
                    )),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: OutlinedButton(
                            onPressed: () async {
                              if (form.currentState!.validate()) {
                                showWaitingDialog(context: context);
                                final res = await Injector()
                                    .apiService
                                    .register(
                                        path: 'VKA_PatientRegistration',
                                        query: data.toJson());
                                context.pop();

                                if (res.isSuccessful) {
                                  if (res.body?.code == '1') {
                                    context.pop(data);
                                  }
                                  showMessage(
                                      context: context,
                                      message: res.body?.message ?? '');
                                } else {
                                  showMessage(
                                      context: context,
                                      message:
                                          'Request failed, Please check your connection.');
                                }
                              }
                            },
                            child: const Text('Save'))),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
