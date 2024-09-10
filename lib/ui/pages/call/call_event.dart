part of 'call_bloc.dart';

@freezed
class CallEvent with _$CallEvent{
  const factory CallEvent.endCall() = EndCall;
  const factory CallEvent.toggleMic() = ToggleMic;
  const factory CallEvent.toggleSpeaker() = ToggleSpeaker;
  const factory CallEvent.toggleVideo() = ToggleVideo;
  const factory CallEvent.toggleView() = ToggleView;
  const factory CallEvent.switchCamera() = SwitchCamera;
}
