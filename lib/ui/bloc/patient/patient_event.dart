part of 'patient_bloc.dart';

@freezed
class PatientEvent with _$PatientEvent{
  const factory PatientEvent.select(Patient patient) = Select;
}

