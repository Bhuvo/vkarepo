import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timesmedlite/model/api_failure.dart';
import 'package:timesmedlite/model/patient.dart';

part 'patient_bloc.freezed.dart';

part 'patient_event.dart';

part 'patient_state.dart';

class PatientBloc extends Bloc<PatientEvent, PatientState> {
  Patient? patient;

  PatientBloc()
      : super(const Initial()) {
    on<Select>((event, emit) async {
      patient = event.patient;
      emit(Data(patient: event.patient));
    });
  }
}
