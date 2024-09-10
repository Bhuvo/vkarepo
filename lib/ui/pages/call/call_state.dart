part of 'call_bloc.dart';

@freezed
class CallState with _$CallState{
  const factory CallState.initial() = Initial;
  const factory CallState.reconnecting() = Recconecting;
  const factory CallState.failed() = Failed;
  const factory CallState.connected() = Connected;
  const factory CallState.changed(bool value, CallEvent event) = Changed;
}
