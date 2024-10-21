import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timesmedlite/model/api_failure.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder_facade.dart';

part 'api_builder_bloc.freezed.dart';

part 'api_builder_event.dart';

part 'api_builder_state.dart';

class ApiBuilderBloc extends Bloc<ApiBuilderEvent, ApiBuilderState> {
  final String path;
  Map<String, dynamic> query;
  List<Map<String, dynamic>> data = [];
  final int limit;
  final bool raw, api2, timesmedApi,vka;
  int offset;
  ApiBuilderBloc duplicate() => ApiBuilderBloc(path: path, raw: raw, api2: api2, timesmedApi: timesmedApi,vka: vka, query: query, )..data = data;
  ApiBuilderBloc(
      {required this.path,
        this.vka = false,
      this.limit = 20,
      this.offset = 0,
      this.raw = false,
      this.timesmedApi = false,
      this.api2 = false,
      this.query = const {}})
      : super(const InitialState()) {
    on<Load>((event, emit) async {
      if (state is Loading || state is Refreshing || state is LoadingMore) {
        return;
      }
      emit(const Loading());
      await Future.delayed(const Duration(milliseconds: 300));
      await fetch(event, emit);
    });
    on<LoadMore>((event, emit) async {
      if (state is Loading || state is Refreshing || state is LoadingMore) {
        return;
      }
      emit(LoadingMore(data: data));
      offset += 1;
      await fetch(event, emit);
    });
    on<Refresh>((event, emit) async {
      if (state is Refreshing) return;
      emit(const Loading());
      offset = 0;
      log('refreshing ${path}');
      await Future.delayed(const Duration(milliseconds: 300));
      await fetch(event, emit, refresh: true);
    });
    on<UpdateQuery>((event, emit) async {
      emit(const Loading());
      query = event.query;
      offset = 0;
      await fetch(event, emit, refresh: true);
    });
  }

  fetch(event, emit, {bool refresh = false}) async {
    final res = await ApiBuilderFacade.fetchList(
        path: path, query: query, limit: limit, offset: offset, raw: raw, api2: api2, timesmedApi: timesmedApi,vka: vka);
    res.fold((l) => emit(Error(error: l)), (r) {
      data = refresh ? [] : data;
      if(refresh) data.clear();
      data.addAll(r);
      log('${path} fetched: ${data.toString()}');
      emit(Data(data: data, updatedAt: DateTime.now()));
      if(data.isEmpty){
        emit(const Empty());
      }
    });
  }
}
