import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder_bloc.dart';
import 'package:timesmedlite/ui/widgets/m_dialog.dart';
import 'package:timesmedlite/ui/widgets/m_list_tile.dart';
import 'package:timesmedlite/utils/local_storage.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

class OrderAddressList extends StatelessWidget {
  final String type;

  const OrderAddressList({Key? key, this.type = 'sa'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = ApiBuilderBloc(
        path: type == 'sa' ? 'ShippingAddressList' : 'BillingAddressList', query: {'User_id': LocalStorage.getUID()});
    return MDialog(
        title: Row(
          children: [
            Text(type == 'sa' ? 'Shipping Address' : 'Billing Address'),
            const Spacer(),
            IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: Icon(Icons.close_rounded))
          ],
        ),
        child: Expanded(
          child: BlocProvider(
            create: (_) => bloc..add(const Load()),
            child: ApiBuilder(
              jsonBuilder: (list, load) {
                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (_, i) {
                    final data = list[i];
                    return MListTile(
                        onTap: () {
                          context.pop(data);
                        },
                        padding:
                            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${data['${type}_firstname'] ?? '-'}',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${data['${type}_mobile'] ?? '-'}, ${data['${type}_email'] ?? '-'}',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${data['${type}_address'] ?? '-'} - ${data['${type}_pincode'] ?? '-'}',
                            ),
                            Text(
                              '${data['${type}_landmark'] ?? '-'}',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            // if(kDebugMode)Text('${data}',),
                          ],
                        ));
                  },
                );
              },
            ),
          ),
        ));
  }
}
