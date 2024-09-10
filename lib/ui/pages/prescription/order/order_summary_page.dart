import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder_bloc.dart';
import 'package:timesmedlite/ui/components/circles.dart';
import 'package:timesmedlite/ui/components/price_view.dart';
import 'package:timesmedlite/ui/components/shimmer/shimmer_list.dart';
import 'package:timesmedlite/ui/pages/prescription/order/product_list_item.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/m_list_tile.dart';
import 'package:timesmedlite/ui/widgets/m_scaffold.dart';
import 'package:timesmedlite/utils/size_utils.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

class OrderSummaryPage extends StatelessWidget {
  final String orderId, txn;
  final num amount;
  const OrderSummaryPage({Key? key, required this.orderId, this.txn = '', this.amount = 0.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc =
    ApiBuilderBloc(path: 'historydetail', query: {'oid': orderId})..add(const Load());

    return MScaffold(
      title: Text('Payment'.toUpperCase()),
      appBarBottom: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Amount Paid',
              style: TextStyle(fontSize: 13),
            ),
            const SizedBox(
              height: 8,
            ),
            ColorFiltered(
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcATop),
              child: PriceView(
                value: amount,
                size: 30,
              ),
            )
          ],
        ),
      ),
      paddingTop: 150,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Divider(),
            const Circles(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Icon(
              Icons.done_rounded,
              size: 40,
            ),
                )),
            const SizedBox(height: 8,),
            const Text('Payment Successful', style: TextStyle(color: MTheme.THEME_COLOR, fontSize: 17, fontWeight: FontWeight.w600),),
            const SizedBox(height: 8,),
            Text('Transaction Number: ${txn}', style: Theme.of(context).textTheme.caption,),
            const SizedBox(height: 16,),
            BlocProvider(
              create: (_) => bloc,
              child: ApiBuilder(
                loading: ShimmerList(
                  length: 2,
                  height: 50,
                ),
                jsonBuilder: (data, load) {
                  num total = 0;

                  for (final e in data) {
                    total += (e['total_price'] ?? 0);
                  }

                  return Hero(
                      tag: 'order::items',
                      child: MListTile(
                          animate: false,
                          child: Column(
                            children: [
                              ...data.map(
                                    (e) => Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Theme.of(context)
                                                  .dividerColor,
                                              width: 0.5))),
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text.rich(
                                          TextSpan(children: [
                                            TextSpan(
                                              text:
                                              '${e['product_name']}',
                                            ),
                                            TextSpan(
                                                text:
                                                ' x ${e['product_quantity']}',
                                                style: TextStyle(
                                                    fontWeight:
                                                    FontWeight
                                                        .w700)),
                                          ]),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall
                                              ?.copyWith(
                                              color:
                                              Theme.of(context)
                                                  .textTheme
                                                  .caption
                                                  ?.color),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      PriceView(
                                        value: (e['total_price'] ?? 0)
                                        as num,
                                        size: 18,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              // Container(
                              //   padding: const EdgeInsets.symmetric(
                              //       horizontal: 16, vertical: 12),
                              //   color: Theme.of(context)
                              //       .scaffoldBackgroundColor,
                              //   child: Row(
                              //     children: [
                              //       Expanded(
                              //           child: Text(
                              //             'Total Amount',
                              //             style: Theme.of(context)
                              //                 .textTheme
                              //                 .titleSmall
                              //                 ?.copyWith(
                              //                 color: Theme.of(context)
                              //                     .textTheme
                              //                     .caption
                              //                     ?.color,
                              //                 fontSize: 12,
                              //                 fontWeight:
                              //                 FontWeight.w700),
                              //           )),
                              //       PriceView(
                              //         value: total,
                              //         size: 18,
                              //       )
                              //     ],
                              //   ),
                              // )
                            ],
                          )));
                },
              ),
            ),
            // Hero(
            //   tag: 'order::items',
            //   child: MListTile(
            //       animate: false,
            //       child: Column(
            //     children: [
            //       ...[{
            //       'name': 'A 1 5mg Tablet',
            //         'price': 12.33
            //       }, {
            //       'name': 'A 125 Suspension',
            //         'price': 25
            //       }, ].map((e) => Container(
            //         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            //         decoration: BoxDecoration(
            //           border: Border(
            //             bottom: BorderSide(
            //               color: Theme.of(context).dividerColor,
            //               width: 0.5
            //             )
            //           )
            //         ),
            //         child: Row(
            //           children: [
            //             Expanded(
            //                 child: Text(
            //                   '${e['name']}',
            //                   style: Theme.of(context).textTheme.titleSmall?.copyWith(
            //                       color: Theme.of(context).textTheme.caption?.color),
            //                 )),
            //             PriceView(
            //               value: (e['price'] ?? 0) as num,
            //               size: 18,
            //             )
            //           ],
            //         ),
            //       ),),
            //
            //     ],
            //   )),
            // ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Theme.of(context).dividerColor,
                          width: 0.5
                      )
                  )
              ),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                        'Total Amount',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: Theme.of(context).textTheme.caption?.color, fontSize: 14),
                      )),
                  PriceView(
                    value: amount,
                    size: 18,
                  )
                ],
              ),
            ),
            const SizedBox(height: 16,),
            TextButton.icon(onPressed: (){
              context.push(Routes.trackOrder, {
                'order_id': orderId
              });
            }, icon: Icon(CupertinoIcons.location, size: 16, color: MTheme.ICON_COLOR,), label: Text('Track your order'))
          ],
        ),
      ),
      bottom: Container(
        height: 50,
        margin: EdgeInsets.symmetric(
            horizontal: context.getWPercent(8), vertical: 12),
        width: double.maxFinite,
        child: OutlinedButton(
          child: const Text('Continue Shopping'),
          onPressed: () {
            context.pop();
          },
        ),
      ),
    );
  }
}
