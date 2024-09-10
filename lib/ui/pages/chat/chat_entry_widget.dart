import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';

class ChatEntryWidget extends StatelessWidget {
  const ChatEntryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const iconPadding = EdgeInsets.symmetric(vertical: 2);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Material(
        color: Colors.white,
        elevation: 10,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28)
        ),
        clipBehavior: Clip.antiAlias,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: iconPadding,
              child: IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.smiley_fill, color: Colors.grey.shade800,), padding: const EdgeInsets.all(10),),
            ),
            const Expanded(child: TextField(
              maxLines: 5,
              minLines: 1,
              textAlign: TextAlign.justify,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 8),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                fillColor: Colors.transparent,
                hintText: 'Message...'
              ),
            )),
            Padding(
              padding: iconPadding,
              child: IconButton(onPressed: (){}, icon: Transform.rotate(
                  angle: 0.7,
                  child: Icon(Icons.attach_file_rounded, color: Colors.grey.shade800,)), padding: const EdgeInsets.all(10),),
            ),
            Padding(
              padding: iconPadding,
              child: MIconButton(onTap: (){}, child: Icon(FontAwesomeIcons.solidPaperPlane, color: Colors.white,), padding: const EdgeInsets.all(10),
              solid: MTheme.THEME_COLOR,

              ),
            ),
            const SizedBox(width: 4,),
          ],
        ),
      ),
    );
  }
}
