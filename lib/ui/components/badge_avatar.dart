import 'package:flutter/material.dart';

import 'status_indicator.dart';
import 'user_avatar.dart';

class BadgeAvatar extends StatelessWidget {
  final String? badge, caption;
  final Color? captionColor;
  final String? imageUrl;

  const BadgeAvatar(
      {Key? key, this.badge, this.caption, this.captionColor, this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 56,
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Stack(
        children: [
          Align(
              alignment: Alignment.topCenter,
              child:
              // UserAvatar(
              //   radius: 28,
              // ),
              Container(
                width: 28 * 2,
                height: 28 * 2,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme
                        .of(context)
                        .dividerColor,
                    border: Border.all(color: Colors.white)
                  //boxShadow: MTheme.SHADOW_LIGHT
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.network(
                        "https://www.timesmed.com/images/doc-imgs/$imageUrl",
                        fit: BoxFit.fitHeight,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.12,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.056,)
                    ],
                  ),
                ),
              )
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (badge != null)
                    StatusIndicator(
                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                      label: badge!,
                      bold: true,
                    ),
                  if (caption != null)
                    Text(
                      caption!,
                      style: TextStyle(
                          color: captionColor ?? Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w600),
                    )
                ],
              ))
        ],
      ),
    );
  }
}
