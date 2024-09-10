import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/di/dependency_injection.dart';
import 'package:timesmedlite/ui/components/show_message.dart';
import 'package:timesmedlite/ui/components/waiting_dialog.dart';
import 'package:timesmedlite/ui/pages/instant_call/day_end_dialog.dart';
import 'package:timesmedlite/ui/pages/instant_call/instant_call_list_dialog.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/local_storage.dart';

class WaitingListActions extends StatefulWidget {
  final GlobalKey<ExpandableFabState> fab;
  const WaitingListActions({Key? key, required this.fab}) : super(key: key);

  @override
  State<WaitingListActions> createState() => _WaitingListActionsState();
}

class _WaitingListActionsState extends State<WaitingListActions> {
  bool online = false;

  @override
  void initState() {
    online = LocalStorage.getBool(LocalStorage.ONLINE, def: true);
    super.initState();
  }

  Future toggleOnline() async {
    final temp = !online;
    //final call = Injector().apiService.get(path: 'Update_Doctor_Online', query: {'Status': temp ? 'Y' : 'N', 'Doctor_id': LocalStorage.getUID()});
    final call = Injector().apiService.get(path: 'InstantCallChangeStatus', query: {'Status': temp ? 'O' : 'F', 'Doctor_id': LocalStorage.getUID()});
    final res = await showWaitingDialog(context: context, call: call);
    if(res != null){
      LocalStorage.setBool(LocalStorage.ONLINE, temp);
      setState((){
        online = temp;
      });
      print(temp);
      showMessage(context: context, message: '${res.body.message}');

    }
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: ExpandableFab(
        key: widget.fab,
        distance: 54,
        children: [
          ActionButton(
              onPressed: () {
                widget.fab.currentState?.toggle();
                showDialog(context: context, builder: (c) => const InstantCallListDialog());
              },
              icon: const Icon(
                Icons.phone,
                color: Colors.amber,
                size: 20,
              ),
              label: 'Instant Call Status'),
          ActionButton(
            onPressed: () {
              widget.fab.currentState?.toggle();
              showDialog(context: context, builder: (c) => const DayEndDialog());
            },
            icon: const Icon(
              FontAwesomeIcons.calendarDay,
              color: Colors.amber,
              size: 17,
            ),
            label: 'Day End',
          ),
          ActionButton(
            onPressed: () {
              if(online) {
                toggleOnline();
              }
            },
            icon:  Icon(
              online ? Icons.circle_outlined : Icons.circle,
              color: Colors.red,
              size: 20,
            ),
            label: 'Instant Offline',
          ),
          ActionButton(
            onPressed: () {
              if(!online) {
                toggleOnline();
              }
            },
            icon: Icon(
              !online ? Icons.circle_outlined : Icons.circle,
              color: Colors.green,
              size: 20,
            ),
            label: 'Online',
          ),
        ],
      ),
    );
  }
}
