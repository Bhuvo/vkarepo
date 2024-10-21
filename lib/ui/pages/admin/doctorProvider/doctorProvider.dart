import 'package:flutter_bloc/flutter_bloc.dart';

import 'doctor_provider_event.dart';
import 'doctor_provider_state.dart';

class DoctorProvider  extends Bloc<DoctorProviderEvent,DoctorProviderState>{
  DoctorProvider(super.initialState);

}