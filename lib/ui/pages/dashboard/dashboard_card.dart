import 'package:flutter/material.dart';
import 'package:timesmedlite/ui/theme/theme.dart';

class DashboardCard extends StatelessWidget {
  final String title, subTitle;
  final String? asset;
  final double radius;
  final Color color;
  final Function()? onTap;
  final EdgeInsets margin;
  final int flex;

  const DashboardCard(
      {Key? key,
      this.onTap,
      this.flex = 1,
      this.margin =  const EdgeInsets.all(6),
      required this.title,
      required this.subTitle,
      this.asset = 'assets/images/ic_1.png',
      this.radius = 8,
      this.color = Colors.green})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final body = Container(
      margin: margin,
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
        boxShadow: MTheme.SHADOW_LIGHT
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(radius),
          child: Stack(
            children: [
              if(asset != null)Positioned(
                  left: 0,
                  bottom: 0,
                  child: Image.asset(asset!, width: 100,)),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 10, 12, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(title, textAlign: TextAlign.end, style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white, fontSize: 30),),
                      const SizedBox(height: 16,),
                      Text(subTitle, textAlign: TextAlign.end, style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 11)),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
    if(flex == 0){
      return body;
    }
    return Expanded(child: body, flex: flex,);
  }
}
