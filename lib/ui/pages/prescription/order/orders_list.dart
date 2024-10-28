import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder_bloc.dart';
import 'package:timesmedlite/ui/components/nothing_widget.dart';
import 'package:timesmedlite/ui/components/price_view.dart';
import 'package:timesmedlite/ui/pages/prescription/order/product_list_item.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/m_list_tile.dart';
import 'package:timesmedlite/ui/widgets/m_scaffold.dart';
import 'package:timesmedlite/utils/local_storage.dart';
import 'package:timesmedlite/utils/size_utils.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../../utils/local_storage.dart';
import '../../../components/patient_bottom_navigation.dart';
import 'controller/order_list_controller.dart';

class OrdersList extends StatefulWidget {
  OrdersList({Key? key}) : super(key: key);

  @override
  State<OrdersList> createState() => _OrdersListState();
}

class _OrdersListState extends State<OrdersList> {
  final ApiBuilderBloc bloc =
      ApiBuilderBloc(path: 'history', query: {'UserId': LocalStorage.getUID()});

  OrderListController controller = OrderListController();

  @override
  void initState() {
    // TODO: implement initState
    bloc..add(const Load());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print('value of order ${bloc.data}');
    Size size = MediaQuery.of(context).size;
    return MScaffold(
      title: Text(
        Consts.MY_ORDERS,
        style: TextStyle(
          fontSize: size.height * 0.0165,
        ),
      ),
      body: BlocProvider(
        create: (_) => bloc,
        child: ApiBuilder(
          empty:NothingWidget(),
            jsonBuilder: (list, _) {
             var dataList = list[0]['data'];
          return SingleChildScrollView(
            child: Column(
              children: [
                Text('Lab Orders'.toUpperCase(),style: const TextStyle(fontWeight: FontWeight.w700,fontSize: 16),),
                ListView.builder(
                  shrinkWrap: true,
                  physics:NeverScrollableScrollPhysics(),
                  itemCount: controller.labOrderModel.data?.length ?? 0,
                  itemBuilder: (c, i) {
                    final data = controller.labOrderModel.data?[i];
                    return MListTile(
                        padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
                        onTap: () {
                          context.push(Routes.trackOrder, {
                            'orderId': data?.orderId.toString(),
                            'islab': true
                          });
                        },
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '#${data?.orderId}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: MTheme.THEME_COLOR),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    // '${data?['payment_mode']}',
                                    'Cash on Test',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      //color: MTheme.ICON_COLOR
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  // Text(
                                  //   '${data['order_date']}',
                                  //   style: Theme.of(context).textTheme.bodySmall,
                                  // )
                                ],
                              ),
                            ),
                            PriceView(
                              value: data?.orderAmount ?? 0.0,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: Colors.grey.shade300,
                            ),
                          ],
                        ));
                  },
                ),
                Text('Prescription Orders'.toUpperCase(),style: const TextStyle(fontWeight: FontWeight.w700,fontSize: 16),),
                ListView.builder(
                  shrinkWrap: true,
                  physics:NeverScrollableScrollPhysics(),
                  itemCount: dataList.length,
                  itemBuilder: (c, i) {
                    final data = list[i];
                    return MListTile(
                        padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
                        onTap: () {
                          context.push(Routes.trackOrder,{
                            'orderId': data['order_id'].toString(),
                            'islab': false
                          });
                        },
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '#${data['order_id']}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: MTheme.THEME_COLOR),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    '${data['payment_mode']}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      //color: MTheme.ICON_COLOR
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    '${data['order_date']}',
                                    style: Theme.of(context).textTheme.bodySmall,
                                  )
                                ],
                              ),
                            ),
                            PriceView(
                              value: data['total_price'],
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: Colors.grey.shade300,
                            ),
                          ],
                        ));
                  },
                ),
              ],
            ),
          );
        }),
      ),
      bottom: const PatientBottomNavigation(),
    );
  }
}
