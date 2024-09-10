import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckItem extends StatelessWidget {
  final bool done;
  final String label;
  const CheckItem({Key? key, required this.label, this.done = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(done ? Icons.check_circle : CupertinoIcons.clear_circled_solid, color: done? Colors.green : Colors.red, size: 14,),
        const SizedBox(width: 4,),
        Text(label.toUpperCase(), style: TextStyle(color: done ? Colors.black87 : Colors.black54, fontWeight: FontWeight.w600, fontSize: 12),),
        const SizedBox(width: 16,)
      ],
    );
  }
}
