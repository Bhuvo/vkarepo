import 'package:flutter/material.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/pages/dashboard/dashboard_header.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePageBase extends StatefulWidget {
  final String title;
  final Widget body;
  final Widget? bottom;

  const HomePageBase(
      {Key? key, required this.title, required this.body, this.bottom})
      : super(key: key);

  @override
  State<HomePageBase> createState() => _HomePageBaseState();
}

class _HomePageBaseState extends State<HomePageBase> {
  @override
  void initState() {
    requestPermission();
    super.initState();
  }

  requestPermission() async {
    await Permission.camera.request().then((status) {});
    await Permission.microphone.request().then((status) {});
  }

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      title: Text(widget.title.toUpperCase()),
      //drawer: const MDrawer(items: Consts.DRAWER_ITEMS, header: DashboardHeader(),),
      appBarBottom: const DashboardHeader(),
      paddingTop: 140,
      bottom: widget.bottom,
      body: widget.body,
    );
  }
}
