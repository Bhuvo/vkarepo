import 'package:flutter/material.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

class MDrawer extends StatelessWidget {
  final List<MDrawerItem> items;
  final Widget? header;
  const MDrawer({Key? key, required this.items, this.header}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(gradient: MTheme.GRADIENT),
        child: SafeArea(
          child: Column(
            children: [
              if(header != null) header!,
              const Divider(height: 1,color: Colors.white30,),
              ...List.generate(items.length, (i) {
                final item = items[i];
                final isSelected = item.route == ModalRoute.of(context)?.settings.name;
                return Column(
                  children: [
                    Opacity(
                      opacity: isSelected ? 1.0 : 0.5,
                      child: Material(
                          color: Colors.transparent,
                          child: ListTile(
                            title: Text(
                              item.label.toUpperCase(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            leading: item.icon != null
                                ? Icon(
                                    item.icon,
                                    color: Colors.white,
                                  )
                                : null,
                            onTap: () {
                              context.pop();
                              if(item.route != ModalRoute.of(context)?.settings.name) {
                                context.push(item.route);
                              }
                            },
                          )),
                    ),
                    const Divider(
                      height: 1,
                      color: Colors.white30,
                    ),
                  ],
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}

class MDrawerItem {
  final String label, route;
  final String? asset;
  final IconData? icon;

  const MDrawerItem(this.label, this.route, {this.icon, this.asset});
}
