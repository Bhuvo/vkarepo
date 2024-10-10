import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder_bloc.dart';
import 'package:timesmedlite/ui/widgets/m_dialog.dart';
import 'package:timesmedlite/ui/widgets/m_list_tile.dart';
import 'package:timesmedlite/utils/local_storage.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

class OrderAddressList extends StatefulWidget {
  final String type;
  final Function (Map<String, dynamic> data)? onSelected;

  const OrderAddressList({Key? key, this.type = 'sa', this.onSelected}) : super(key: key);

  @override
  State<OrderAddressList> createState() => _OrderAddressListState();
}

class _OrderAddressListState extends State<OrderAddressList> {
  late final ApiBuilderBloc bloc = ApiBuilderBloc(
      path: widget.type == 'sa' ? 'ShippingAddressList' : 'BillingAddressList', query: {'User_id': LocalStorage.getUID()});


  @override
  Widget build(BuildContext context) {
    return MDialog(
        // title: Row(
        //   children: [
        //     Text(widget.type == 'sa' ? 'Shipping Address' : 'Billing Address'),
        //     const Spacer(),
        //     IconButton(
        //         onPressed: () {
        //           context.pop();
        //         },
        //         icon: const Icon(Icons.close_rounded))
        //   ],
        // ),
      padding: const EdgeInsets.only(top: 12),
        child: Expanded(
          child: BlocProvider(
            create: (_) => bloc..add(const Load()),
            child: ApiBuilder(
              jsonBuilder: (list, load) {
                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (_, i) {
                    final data = list[i];
                    final c = MListTile(
                        onTap: () {
                          if(widget.onSelected != null){
                            widget.onSelected!(data);
                            return;
                          }
                          // context.pop(data);
                        },
                        padding:
                            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${data['${widget.type}_firstname'] ?? '-'}',
                              style: const TextStyle(fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${data['${widget.type}_mobile'] ?? '-'}, ${data['${widget.type}_email'] ?? '-'}',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${data['${widget.type}_address'] ?? '-'} - ${data['${widget.type}_pincode'] ?? '-'}',
                            ),
                            Text(
                              '${data['${widget.type}_landmark'] ?? '-'}',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            // if(kDebugMode)Text('${data}',),
                          ],
                        ));
                    if(i == 0){
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24) + const EdgeInsets.only(top: 12),
                            child: Text('Select ${widget.type == 'sa' ? 'Shipping' : 'Billing'} Address', style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).dividerColor,
                            ),),
                          ),
                          c,
                        ],
                      );
                    }
                    return c;
                  },
                );
              },
            ),
          ),
        ));
  }
}
