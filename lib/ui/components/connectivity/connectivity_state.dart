part of 'connectivity_bloc.dart';

@freezed
class ConnectivityState with _$ConnectivityState {
  const factory ConnectivityState.checking() = Checking;
  const factory ConnectivityState.disconnected() = Disconnected;
  const factory ConnectivityState.connected() = Connected;
}