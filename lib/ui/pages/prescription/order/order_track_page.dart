import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder_bloc.dart';
import 'package:timesmedlite/ui/components/circles.dart';
import 'package:timesmedlite/ui/components/price_view.dart';
import 'package:timesmedlite/ui/components/shimmer/shimmer_list.dart';
import 'package:timesmedlite/ui/components/user_avatar.dart';
import 'package:timesmedlite/ui/pages/prescription/order/product_list_item.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timesmedlite/ui/widgets/m_icon_button.dart';
import 'package:timesmedlite/ui/widgets/m_list_tile.dart';
import 'package:timesmedlite/ui/widgets/m_scaffold.dart';
import 'package:timesmedlite/ui/widgets/map/m_marker.dart';
import 'package:timesmedlite/ui/widgets/map/map_widget.dart';
import 'package:timesmedlite/ui/widgets/map/polyline_painter.dart';
import 'package:timesmedlite/ui/widgets/map/shimmer_map.dart';
import 'package:timesmedlite/ui/widgets/map/utils.dart';
import 'package:timesmedlite/utils/lat_lng_utils.dart';
import 'package:timesmedlite/utils/size_utils.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';
import 'package:latlng/latlng.dart';

class OrderTrackPage extends StatefulWidget {
  final String orderId;

  const OrderTrackPage({Key? key, required this.orderId}) : super(key: key);

  @override
  State<OrderTrackPage> createState() => _OrderTrackPageState();
}

class _OrderTrackPageState extends State<OrderTrackPage> {
  late ApiBuilderBloc details, track;

  @override
  void initState() {
    details =
        ApiBuilderBloc(path: 'historydetail', query: {'oid': widget.orderId})..add(const Load());
    track = ApiBuilderBloc(
        path: 'TrackOrderStatus', query: {'OrderId': widget.orderId});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      title: Text('Track Order'.toUpperCase()),
      bodyPadding: const EdgeInsets.symmetric(vertical: 16),
      body: BlocProvider(

        create: (context) => track..add(const Load()),
        child: ApiBuilder(
            loading: ShimmerMap(),
            jsonBuilder: (list, load) {
          final data = list.first;
          final userLatLng = LatLng(double.tryParse('${data['UserLat']}') ?? 0, double.tryParse('${data['UserLong']}') ?? 0);
          final salesLatLng = LatLng(double.tryParse('${data['SalesLat']}') ?? 0, double.tryParse('${data['SalesLong']}') ?? 0);
          LatLng center = getCenterLatLng([userLatLng, salesLatLng]);
          final zoom = clamp(userLatLng.getDistance(salesLatLng) * 2, 2, 18);
          center = LatLng(center.latitude - (0.015 * (zoom/13)), center.longitude);
          return Stack(
            children: [
              MapWidget(
                center: center,
                zoom: zoom,
                lines: [
                  PolyLine(points: [userLatLng, salesLatLng], strokeWidth: 2, dash: true, color: Colors.black54),
                  PolyLine(points: [userLatLng, salesLatLng], strokeWidth: 4, curved: true, color: Colors.blueAccent),
                ],
                markers: [
                  MMarker(
                    latLng: userLatLng,
                    icon: CupertinoIcons.home,
                    color: Colors.black54,
                  ),
                  MMarker(
                    latLng: salesLatLng,
                    icon: Icons.storefront,
                    color: Colors.blueAccent,
                  ),
                ],
              ),
              IgnorePointer(
                ignoring: false,
                child: RefreshIndicator(
                  onRefresh: () async {
                    details.add(const Refresh());
                    track.add(const Refresh());
                  },
                  child: ListView(
                    reverse: true,
                    padding: EdgeInsets.only(bottom: 64),
                    children: [
                      MListTile(
                          child: Column(
                        children: [
                          ListTile(
                            leading: Icon(
                              Icons.location_on,
                              color: Theme.of(context).textTheme.bodySmall?.color,
                              size: 20,
                            ),
                            title: Text(
                              '220, Whites Road, Royyapettah, Chennai',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            subtitle: Text(
                              'Delivery Address',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            horizontalTitleGap: 0,
                            dense: true,
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.access_time_filled,
                              color: Theme.of(context).textTheme.bodySmall?.color,
                              size: 20,
                            ),
                            title: Text(
                              '20 - 30 mins',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            subtitle: Text(
                              'Estimated delivery time',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            horizontalTitleGap: 0,
                            dense: true,
                          ),
                          const Divider(
                            endIndent: 0,
                            indent: 0,
                          ),
                          ListTile(
                            leading: UserAvatar(
                              radius: 24,
                            ),
                            title: Text(
                              '${data['DeliveryPerson_Name']}',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            subtitle: Text(
                              '${data['DeliveryStatus']}',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            trailing: MIconButton(
                              child: Icon(
                                Icons.phone_rounded,
                                color: Colors.green,
                              ),
                              solid: Colors.green.withOpacity(0.1),
                              onTap: () {
                                ///TODO: implement phone intent
                                //launch('tel:${data['DeliveryPerson_ContactNumber']}')
                              },
                            ),
                            dense: true,
                          ),
                          const SizedBox(
                            height: 16,
                          )
                        ],
                      )),
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
                                                                    .bodySmall
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
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 12),
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
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
                                                        fontWeight:
                                                            FontWeight.w700),
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.75,
                      )
                    ],
                  ),
                ),
              ),
              //Text('${data}'),

            ],
          );
        }),
      ),
      bottom: Container(
        height: 50,
        margin: EdgeInsets.symmetric(
            horizontal: context.getWPercent(8), vertical: 12),
        width: double.maxFinite,
        child: OutlinedButton(
          child: const Text('Order Status'),
          onPressed: () {
            context.push(Routes.orderStatusTimeline, {'order_id': widget.orderId});
          },
        ),
      ),
    );
  }
}
