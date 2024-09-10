import 'package:flutter/cupertino.dart';

class ReusableCard extends StatelessWidget {
  final Color? colour;
  final Widget? cardChild;
  final Function? onPress;
  const ReusableCard(
    {required this.colour, this.cardChild, this.onPress});



@override
Widget build(BuildContext context) {
  return GestureDetector(
    onTap: () {
      if(onPress != null){
        onPress!();
      }
    },
    child: Container(
      child: cardChild ?? Container(),
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        color: colour,
      ),
    ),
  );
}
}