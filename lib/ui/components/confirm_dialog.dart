import 'package:flutter/material.dart';
import 'package:timesmedlite/ui/widgets/m_dialog.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

showConfirmDialog(
    {required BuildContext context,
    String title = 'Confirm',
    String message = 'Want to continue?',
    Map<String, Function()> actions = const {}}) {
  return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return MDialog(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                Text(message),
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                  height: 50,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                          child: OutlinedButton(
                        onPressed: () {
                          context.popDialog();
                        },
                        child: const Text(
                          'Close',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red)),
                      )),
                      const SizedBox(
                        width: 16,
                      ),
                      ...List.generate(actions.length, (i){
                        final key = actions.keys.toList()[i];
                        final action = actions[key];
                        return Expanded(
                            child: SizedBox(
                              height: 50,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  if(i != 0)const SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child: OutlinedButton(
                                        onPressed: action,
                                        child: Text(key)),
                                  ),
                                ],
                              ),
                            ));
                      })
                    ],
                  ),
                )
              ],
            ),
          ),
          title: Text(title),
        );
      });
}
