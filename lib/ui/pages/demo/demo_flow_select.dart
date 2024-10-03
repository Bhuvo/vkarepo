import 'package:flutter/material.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

enum FlowType {
  doctor, patient
}
class FlowProvider extends InheritedWidget {
  final FlowType flow;
  const FlowProvider({required super.child, super.key, required this.flow});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static FlowType? of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<FlowProvider>()?.flow;
}
ValueNotifier<FlowType> FLOW = ValueNotifier(FlowType.doctor);

class DemoFlowSelect extends StatelessWidget {
  const DemoFlowSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flows = {
      'Doctor Flow': FlowType.doctor,
      'Patient Flow': FlowType.patient,
    };
    return MScaffold(
      title: const Text('Demo Screen'),
      automaticallyImplyLeading: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(flows.length, (i){
          final key = flows.keys.toList()[i];
          final value = flows[key];
          return MListTile(
            onTap: (){
              FLOW.value = value!;
              FLOW.notifyListeners();
              context.replace(Routes.splash);
            },
            child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Text(key, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 15, color: MTheme.THEME_COLOR),),
                const Spacer(),
                const Icon(Icons.chevron_right, color: Colors.grey,)
              ],
            )),
          );
        }),
      ),
    );
  }
}
