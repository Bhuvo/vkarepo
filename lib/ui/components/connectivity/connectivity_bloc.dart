import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'connectivity_bloc.freezed.dart';
part 'connectivity_state.dart';
part 'connectivity_event.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  ConnectivityBloc() : super(const ConnectivityState.checking()){
    Connectivity().onConnectivityChanged.listen((ConnectivityResult? event) {
      if(event?.name == 'none'){
        emit(const Disconnected());
      } else {
        emit(const Connected());
      }
    });
  }

}