import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder_bloc.dart';
import 'package:timesmedlite/ui/components/price_view.dart';
import 'package:timesmedlite/ui/pages/prescription/order/product_list_item.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/m_list_tile.dart';
import 'package:timesmedlite/ui/widgets/m_scaffold.dart';
import 'package:timesmedlite/utils/local_storage.dart';
import 'package:timesmedlite/utils/size_utils.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../components/patient_bottom_navigation.dart';

class OrdersList extends StatelessWidget {
  OrdersList({Key? key}) : super(key: key);

  final ApiBuilderBloc bloc =
      ApiBuilderBloc(path: 'history', query: {'UserId': LocalStorage.getUID()});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MScaffold(
      title: Text(
        Consts.MY_ORDERS,
        style: TextStyle(
          fontSize: size.height * 0.0165,
        ),
      ),
      body: BlocProvider(
        create: (_) => bloc..add(const Load()),
        child: ApiBuilder(jsonBuilder: (list, _) {
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (c, i) {
              final data = list[i];
              return MListTile(
                  padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
                  onTap: () {
                    context.push(Routes.trackOrder, data);
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
          );
        }),
      ),
      bottom: const PatientBottomNavigation(),
    );
  }
}
