
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timesmedlite/di/vonage/vonage.dart';


part 'call_bloc.freezed.dart';
part 'call_event.dart';
part 'call_state.dart';

class CallBloc extends Bloc<CallEvent, CallState> {
  bool mute = false;
  bool speaker = true;
  bool view = false;
  bool video = true;
  bool frontCam = true;


  CallBloc() : super(const Initial()) {
    on<EndCall>((event, emit) {

    });
    on<ToggleMic>((event, emit) {
      mute = !mute;
      Vonage.toggleAudio(video);
      emit(Changed(mute, event));
    });
    on<ToggleSpeaker>((event, emit) {
      speaker = !speaker;

      emit(Changed(speaker, event));
    });
    on<ToggleVideo>((event, emit) {
      video = !video;
      Vonage.toggleVideo(video);
      emit(Changed(video, event));
    });
    on<ToggleView>((event, emit) {
      view = !view;
      emit(Changed(view, event));
    });
    on<SwitchCamera>((event, emit) {
      frontCam = !frontCam;
      emit(Changed(frontCam, event));
    });
  }
}
