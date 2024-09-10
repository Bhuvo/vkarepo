import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timesmedlite/ui/theme/theme.dart';

class PriceView extends StatelessWidget {
  final String symbol, trailing;
  final num value;
  final double size;
  const PriceView({Key? key, this.symbol = '₹', this.trailing = '/-', this.value = 0, this.size = 17}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
      style: TextStyle(fontSize: size, fontWeight: FontWeight.w600,),
      children: [
        TextSpan(text: symbol, style: const TextStyle(color: MTheme.ICON_COLOR),),
        TextSpan(text: NumberFormat.currency(symbol: '', locale: 'en-IN').format(value), style: const TextStyle(color: MTheme.THEME_COLOR),),
        TextSpan(text: trailing, style: const TextStyle(color: MTheme.THEME_COLOR),),
      ]
    ));
  }
}
