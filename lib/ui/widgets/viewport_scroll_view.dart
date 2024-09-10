import 'package:flutter/widgets.dart';

class ViewportScrollView extends StatelessWidget {
  final Widget child;

  const ViewportScrollView({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return SingleChildScrollView(
          child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
                maxWidth: viewportConstraints.maxWidth
              ),
              child: IntrinsicHeight(
                child: child,
              )));
    });
  }
}
