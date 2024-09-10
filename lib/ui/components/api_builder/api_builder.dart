import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timesmedlite/di/dependency_injection.dart';
import 'package:timesmedlite/model/api_failure.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder_bloc.dart';
import 'package:timesmedlite/ui/components/connectivity/connectivity_bloc.dart';
import 'package:timesmedlite/ui/components/nothing_widget.dart';
import 'package:timesmedlite/ui/components/shimmer/shimmer_list.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';

enum ApiBuilderType {
  list,
  separated,
  grid,
  custom,
  slider,
  single,
  searchList
}

class ApiBuilder<T> extends StatefulWidget {
  final ApiBuilderType type;
  final Axis direction;
  final bool shrinkWrap;
  final Widget? empty, loading;
  final EdgeInsets? padding;
  final String? searchLabel;
  final ScrollController? scrollController;
  final Widget Function(T data, int index)? builder;
  final Widget Function(List<T> data, bool loading)? customBuilder;
  final Widget Function(List<Map<String, dynamic>> data, bool loading)?
      jsonBuilder;
  final T Function(Map<String, dynamic>)? fromJson;

  const ApiBuilder({
    Key? key,
    this.scrollController,
    this.builder,
    this.searchLabel,
    this.padding,
    this.customBuilder,
    this.jsonBuilder,
    this.fromJson,
    this.type = ApiBuilderType.list,
    this.direction = Axis.vertical,
    this.shrinkWrap = false,
    this.empty,
    this.loading,
  }) : super(key: key);

  @override
  State<ApiBuilder<T>> createState() => _ApiBuilderState<T>();
}

class _ApiBuilderState<T> extends State<ApiBuilder<T>> {
  late final ScrollController controller;

  @override
  void initState() {
    controller = widget.scrollController ?? ScrollController();
    initScrollListener();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final connection = context.watch<ConnectivityBloc>().state;
    final apiState = context.watch<ApiBuilderBloc>().state;
    final read = context.read<ApiBuilderBloc>();

    return AnimatedSwitcher(
      reverseDuration: Duration(milliseconds: 300),
      duration: Duration(milliseconds: 300),
      transitionBuilder: (w, a) {
        return FadeTransition(
          opacity: a,
          child: w,
        );
      },
      child: connection.when(
          checking: () =>
              widget.loading ??
              const Center(child: CircularProgressIndicator()),
          disconnected: () => const NothingWidget(),
          connected: () {
            return apiState.when(
                loading: () =>
                    widget.loading ??
                    //const Center(child: CircularProgressIndicator()),
                    const ShimmerList(length: 2,),
                loadingMore: (List<Map<String, dynamic>> data) {
                  return bodyBuilder(state: apiState, data: data);
                },
                initial: () =>
                    widget.loading ??
                    //const Center(child: CircularProgressIndicator()),
                    const Center(child: CircularProgressIndicator()),
                refreshing: (List<Map<String, dynamic>> data) {
                  return bodyBuilder(state: apiState, data: data);
                },
                onData: (List<Map<String, dynamic>> data, _) {
                  return bodyBuilder(state: apiState, data: data);
                },
                empty: () {
                  return widget.empty ??
                      NothingWidget(
                        icon: CupertinoIcons.cube_box,
                        title: 'No Records',
                        message: '',
                        onRefresh: () {
                          read.add(const Refresh());
                        },
                      );
                },
                onError: (ApiFailure error) => NothingWidget(
                      icon: error.code == '0'
                          ? CupertinoIcons.cube_box
                          : CupertinoIcons.app,
                      title: error.message ?? 'Error',
                      message: '',
                      onRefresh: () {
                        read.add(const Refresh());
                      },
                    ));

            //return ;
          }),
    );
  }

  Widget bodyBuilder(
      {required ApiBuilderState state,
      required List<Map<String, dynamic>> data}) {
    return RefreshIndicator(
      child: LayoutBuilder(
        builder: (c, _) {
          if (widget.customBuilder != null) {
            print(widget.customBuilder!
                .call(data.map((e) => widget.fromJson!(e)).toList(), true));

            return widget.customBuilder!
                .call(data.map((e) => widget.fromJson!(e)).toList(), false);
          }
          if (widget.jsonBuilder != null) {
            return widget.jsonBuilder!.call(data, false);
          }
          switch (widget.type) {
            case ApiBuilderType.list:
              return ListView.builder(
                shrinkWrap: widget.shrinkWrap,
                controller: controller,
                padding: widget.padding,
                itemCount: data.length,
                itemBuilder: (c, i) {
                  return widget.builder!.call(widget.fromJson!(data[i]), i);
                },
              );
            case ApiBuilderType.separated:
              return ListView.separated(
                shrinkWrap: widget.shrinkWrap,
                controller: controller,
                padding: widget.padding,
                itemCount: data.length,
                itemBuilder: (c, i) {
                  return widget.builder!.call(widget.fromJson!(data[i]), i);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
              );
            case ApiBuilderType.single:
              if (data.isNotEmpty) {
                return widget.builder!.call(widget.fromJson!(data[0]), 0);
              } else {
                return Container();
              }
            case ApiBuilderType.searchList:
              return MSearchListView(
                shrinkWrap: widget.shrinkWrap,
                controller: controller,
                label: widget.searchLabel ?? 'Search',
                padding: widget.padding,
                itemCount: data.length,
                itemBuilder: (c, i) {
                  return widget.builder!.call(widget.fromJson!(data[i]), i);
                },
              );
            // case ApiBuilderType.custom: if(widget.customBuilder != null) {
            //   return widget.customBuilder!.call(list);
            // } else {
            //   return Container();
            // }
            default:
              return const Text('Missing IMP');
          }
        },
      ),
      onRefresh: () async {
        return context.read<ApiBuilderBloc>().add(const Refresh());
      },
    );
  }

  initScrollListener() {
    controller.addListener(() async {
      if ((controller.position.pixels >
          (controller.position.maxScrollExtent - 10))) {
        // offset += widget.limit;
        // get();
        // Future.delayed(const Duration(milliseconds: 10));
        // controller.animateTo(controller.position.maxScrollExtent + 100, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
      }
    });
  }
}
