import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelines/timelines.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder_bloc.dart';
import 'package:timesmedlite/ui/components/circles.dart';
import 'package:timesmedlite/ui/components/price_view.dart';
import 'package:timesmedlite/ui/components/shimmer/shimmer_list.dart';
import 'package:timesmedlite/ui/components/user_avatar.dart';
import 'package:timesmedlite/ui/pages/prescription/order/product_list_item.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/m_icon_button.dart';
import 'package:timesmedlite/ui/widgets/m_list_tile.dart';
import 'package:timesmedlite/ui/widgets/m_scaffold.dart';
import 'package:timesmedlite/ui/widgets/map/map_widget.dart';
import 'package:timesmedlite/utils/size_utils.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

class OrderStatusPage extends StatefulWidget {
  final String orderId;

  const OrderStatusPage({Key? key, required this.orderId}) : super(key: key);

  static const List<Map<String, dynamic>> stages = [
    {
      'id': 0,
      'name': 'Order Placed',
      'desc': 'Your order was placed for delivery.'
    },
    {
      'id': 1,
      'name': 'Pending',
      'desc':
          'Your order was pending for confirmation. Will confirmed within 5 minutes.'
    },
    {
      'id': 2,
      'name': 'Confirmed',
      'desc': 'Your order is Confirmed. Will deliver soon within 20 minutes.'
    },
    {
      'id': 3,
      'name': 'Processing',
      'desc': 'Your order is processing to deliver you on time.'
    },
    {
      'id': 4,
      'name': 'Delivered',
      'desc': 'Order is deliver to you and marked as delivered by customer.'
    },
  ];

  @override
  State<OrderStatusPage> createState() => _OrderStatusPageState();
}

class _OrderStatusPageState extends State<OrderStatusPage> {
  late ApiBuilderBloc details, track;

  @override
  void initState() {
    details =
        ApiBuilderBloc(path: 'historydetail', query: {'oid': widget.orderId})
          ..add(const Load());
    track = ApiBuilderBloc(
        path: 'TrackOrderStatus', query: {'OrderId': widget.orderId})
      ..add(const Load());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    

    return MScaffold(
      title: Text('Order Status'.toUpperCase()),
      body: RefreshIndicator(
        onRefresh: () async {
          details.add(const Refresh());
          track.add(const Refresh());
          return;
        },
        child: ListView(
          children: [
            BlocProvider(
              create: (context) => track,
              child: ApiBuilder(
                  loading: ShimmerList(
                    length: 4,
                    height: 50,
                  ),
                  jsonBuilder: (data, load) {
                final current = data.first['DeliveryStatusId'] ?? 0;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Timeline.tileBuilder(
                    theme: TimelineThemeData(nodePosition: 0),
                    builder: TimelineTileBuilder.connected(
                      firstConnectorBuilder: (c) => SolidLineConnector(
                        color: Colors.green.withOpacity(0.9),
                      ),

                      connectorBuilder: (c, i, t) {
                        final it = OrderStatusPage.stages[i]['id'];
                        Color color = Colors.grey.withOpacity(0.5);
                        if (it >= current - 1) {
                          return SolidLineConnector(
                            color: color,
                          );
                        }
                        color = Colors.green;
                        return SolidLineConnector(
                          color: color,
                        );
                      },
                      indicatorBuilder: (c, i) {
                        Color color = Colors.grey.withOpacity(0.5);
                        final it = OrderStatusPage.stages[i]['id'];
                        if (it >= current) {
                          return OutlinedDotIndicator(
                            color: color,
                            child: const SizedBox(
                              width: 24,
                              height: 24,
                            ),
                          );
                        }
                        color = Colors.green;
                        return DotIndicator(
                          color: color,
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Icon(
                              it <= current ? Icons.done_rounded : null,
                              size: 24,
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                      //lastConnectorStyle: ConnectorStyle.dashedLine,
                      contentsAlign: ContentsAlign.basic,
                      contentsBuilder: (context, i) {
                        final status = OrderStatusPage.stages[i];

                        return Transform.translate(
                          offset: const Offset(0, 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 5),
                                child: Text(
                                  status['name'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.color),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  status['desc'],
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: OrderStatusPage.stages.length,
                    ),
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                  ),
                );
              }),
            ),
            const SizedBox(
              height: 16,
            ),
            BlocProvider(
              create: (_) => details,
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
                                              color:
                                                  Theme.of(context).dividerColor,
                                              width: 0.5))),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text.rich(
                                          TextSpan(children: [
                                            TextSpan(
                                              text: '${e['product_name']}',
                                            ),
                                            TextSpan(
                                                text:
                                                    ' x ${e['product_quantity']}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700)),
                                          ]),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall
                                              ?.copyWith(
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall
                                                      ?.color),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      PriceView(
                                        value: (e['total_price'] ?? 0) as num,
                                        size: 18,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                color: Theme.of(context).scaffoldBackgroundColor,
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                      'Total Amount',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall
                                                  ?.color,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700),
                                    )),
                                    PriceView(
                                      value: total,
                                      size: 18,
                                    )
                                  ],
                                ),
                              )
                            ],
                          )));
                },
              ),
            ),
          ],
        ),
      ),
      bottom: Container(
        height: 50,
        margin: EdgeInsets.symmetric(
            horizontal: context.getWPercent(8), vertical: 12),
        width: double.maxFinite,
        child: OutlinedButton(
          child: const Text('Track Order'),
          onPressed: () {
            context.pop();
          },
        ),
      ),
    );
  }
}
