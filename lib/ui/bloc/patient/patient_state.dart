part of 'patient_bloc.dart';

@freezed
class PatientState with _$PatientState{
  const factory PatientState.onData({required Patient patient}) = Data;
  const factory PatientState.initial() = Initial;
}

