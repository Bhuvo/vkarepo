// import 'package:flutter/material.dart';
// import 'package:timesmedlite/const/consts.dart';
//
// class MButton extends StatelessWidget {
//   final Color fillColor;
//   final String label;
//   final double radius;
//   final Function() onPressed;
//   final Widget? leading, trailing;
//   final EdgeInsets padding;
//   const MButton({Key? key,
//     this.padding = const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
//     this.fillColor = Consts.BUTTON_COLOR, this.leading, this.trailing, required this.onPressed,required this.label, this.radius = 8}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return OutlinedButton(
//       onPressed: onPressed,
//       style: OutlinedButton.styleFrom(
//         backgroundColor: fillColor,
//         side: const BorderSide(color: Colors.white),
//         primary: Colors.black,
//         textStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(radius)
//         ),
//         padding: padding
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           if(leading != null)...[
//             leading!,
//             const SizedBox(width: 16,)
//           ],
//           Text(label,),
//           if(trailing != null)...[
//             const SizedBox(width: 16,),
//             trailing!,
//           ],
//         ],
//       ),
//       //fillColor: fillColor,
//     );
//   }
// }
