import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:timesmedlite/ui/theme/theme.dart';

class MTextContent extends StatelessWidget {
  final String? head;
  final String content;
  final EdgeInsets margin;

  const MTextContent(
      {Key? key,
      this.head,
      required this.content,
      this.margin = const EdgeInsets.symmetric(horizontal: 16)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = Text(content, style: Theme.of(context).textTheme.bodySmall,);
    if (head == null) {
      return Padding(
        padding: margin,
        child: text,
      );
    }
    return Padding(
      padding: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (head != null) ...[
            Text(
              head!,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: MTheme.THEME_COLOR, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 8,
            )
          ],
          text
        ],
      ),
    );
  }
}
class MTextContent2 extends StatelessWidget {
  final String? head;
  final String content;
  final EdgeInsets margin;
  final Color? contentColor;
  final TextStyle? headStyle;
  final bool flex, gulugulu, bold;

  const MTextContent2(
      {Key? key,
      this.head,
      this.contentColor,
      this.headStyle,
      this.flex = false,
      this.bold = false,
      this.gulugulu = false,
      required this.content,
      this.margin = const EdgeInsets.symmetric(horizontal: 16, vertical: 1)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final text = AutoSizeText(content, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: contentColor ?? MTheme.THEME_COLOR, fontWeight: bold? FontWeight.w700 : FontWeight.normal),);
    if (head == null) {
      return Padding(
        padding: margin,
        child: text,
      );
    }
    return Padding(
      padding: margin,
      child: Row(
        //mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (head != null) ...[
            AutoSizeText(
              head!,
              style: headStyle ?? Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith( fontWeight: bold ? FontWeight.w600 : FontWeight.w500),
            ),
             SizedBox(
              width: size.width * 0.01,
            )
          ],
          if(gulugulu) const Spacer(),
          if(flex)
          Flexible(child: text)
          else text
        ],
      ),
    );
  }
}
