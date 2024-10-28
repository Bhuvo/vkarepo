import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timesmedlite/utils/size_utils.dart';

import '../widgets/m_scaffold.dart';

class NothingWidget extends StatelessWidget {
  final String title, message;
  final IconData icon;
  final Function()? onTap;
  final VoidCallback? onRefresh;
  final Color? messageColor;

   const NothingWidget(
      {Key? key,
      this.icon = CupertinoIcons.app,
      this.title = 'No Internet',
      this.message = 'Please check your connection',
        this.onTap ,
      this.onRefresh, this.messageColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: context.getWPercent(5)),
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: Theme.of(context).dividerColor,
            size: size.height * 0.05,
          ),
          const SizedBox(height: 16),
          if (title.isNotEmpty)
            Text(
              title,
              style: TextStyle(
                  fontSize: size.height * 0.026,
                  color: Colors.grey.withOpacity(0.5),
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          const SizedBox(height: 4),
          if (message.isNotEmpty)
            InkWell(
              onTap: onTap ?? (){},
              child: Text(
                message,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color:messageColor ?? Theme.of(context).dividerColor,
                      fontSize: size.height * 0.016,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
          const SizedBox(height: 4),
          if (onRefresh != null)
            IconButton(
              onPressed: onRefresh,
              icon: const Icon(Icons.refresh_rounded),
              color: Colors.grey,
              iconSize: size.height * 0.04,
            )
        ],
      ),
    );
  }
}
