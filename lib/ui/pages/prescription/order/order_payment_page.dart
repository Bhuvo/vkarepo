import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder_bloc.dart';
import 'package:timesmedlite/ui/components/price_view.dart';
import 'package:timesmedlite/ui/pages/prescription/order/product_list_item.dart';
import 'package:timesmedlite/ui/widgets/m_scaffold.dart';
import 'package:timesmedlite/utils/size_utils.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

class OrderPaymentPage extends StatelessWidget {
  final num amount;
  const OrderPaymentPage({Key? key, this.amount = 0.0}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MScaffold(
      title: Text('Payment'.toUpperCase()),
      appBarBottom: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Amount', style: TextStyle(fontSize: 13),),
            const SizedBox(height: 8,),
            ColorFiltered(colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcATop), child: PriceView(
              value: amount,
              size: 30,
            ),)
          ],
        ),
      ),
      body: Container(),
      bottom: Container(
        height: 50,
        margin: EdgeInsets.symmetric(horizontal: context.getWPercent(8), vertical: 12),
        width: double.maxFinite,
        child: OutlinedButton(
          child: const Text('Proceed'),
          onPressed: (){
            context.pop(true);
          },
        ),
      ),
    );
  }
}
