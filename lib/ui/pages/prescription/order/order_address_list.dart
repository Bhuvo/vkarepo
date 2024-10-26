import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timesmedlite/di/dependency_injection.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder_bloc.dart';
import 'package:timesmedlite/ui/components/waiting_dialog.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/m_dialog.dart';
import 'package:timesmedlite/ui/widgets/m_list_tile.dart';
import 'package:timesmedlite/utils/local_storage.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

class OrderAddressList extends StatefulWidget {
  final String type;
  final bool? isSameSa;
  final Function (Map<String, dynamic> data)? onSelected;

  const OrderAddressList({Key? key, this.type = 'sa', this.onSelected, this.isSameSa}) : super(key: key);

  @override
  State<OrderAddressList> createState() => _OrderAddressListState();
}

class _OrderAddressListState extends State<OrderAddressList> {
  late final ApiBuilderBloc bloc = ApiBuilderBloc(
      path: widget.type == 'sa' ? 'ShippingAddressList' : 'BillingAddressList', query: {'User_id': LocalStorage.getUID()});


  int? _selectedIndex;
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
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    widget.type == 'ba'?  Padding(
                      padding: const EdgeInsets.only(right: 10,top: 8),
                      child: InkWell(
                          onTap: (){
                            showModalBottomSheet(context: context, builder: (context) => Padding(
                              padding: const EdgeInsets.only(top: 16,left: 10,right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Choose Address',style: Theme.of(context).textTheme.bodySmall?.copyWith(color: MTheme.THEME_COLOR),),
                                  Expanded(
                                    child: OrderAddressList( isSameSa: true,
                                      onSelected: (val){
                                      val['ba_id'] =val['sa_id'];
                                        widget.onSelected!(val);
                                        print('val is$val');
                                      },),
                                  ),
                                ],
                              ),
                            ));
                            // showDialog(context: context,useSafeArea: true, builder: (context) => OrderAddressList(
                            //   isSameSa: true,
                            //   onSelected: (val){
                            //     print('val is$val');
                            //   },
                            // ));
                          },
                          child: Text('same address as Shipping Address?', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: MTheme.THEME_COLOR),)),
                    ) : Container(),
                    Expanded(
                      child: ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (_, i) {
                          final data = list[i];
                          final c = MListTile(
                              onTap: () {
                                if(widget.onSelected != null){

                                  if(widget.isSameSa ?? false){
                                    widget.onSelected!(data);
                                    context.pop();
                                    return;
                                  }
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
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              MListTile(
                                // onTap: () {
                                  // if (widget.onSelected != null) {
                                  //   widget.onSelected!(data);
                                  //   context.pop();
                                  // }
                                // },
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${data['${widget.type}_firstname'] ?? '-'}',
                                          style: const TextStyle(fontWeight: FontWeight.w700),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          '${data['${widget.type}_mobile'] ?? '-'}, ${data['${widget.type}_email'] ?? '-'}',
                                          style: Theme.of(context).textTheme.bodySmall,
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          '${data['${widget.type}_address'] ?? '-'} - ${data['${widget.type}_pincode'] ?? '-'}',
                                        ),
                                        Text(
                                          '${data['${widget.type}_landmark'] ?? '-'}',
                                          style: Theme.of(context).textTheme.bodySmall,
                                        ),
                                      ],
                                    ),
                                    Radio<int>(
                                      value: i, // Set the radio value to the index
                                      groupValue: _selectedIndex, // This is the selected index
                                      onChanged: (value) async {
                                        print(data);
                                        setState(() {
                                          _selectedIndex = value; // Update the selected index
                                        });
                                        if(widget.isSameSa ?? false){
                                          print(data['sa_id']);
                                          showWaitingDialog(context: context,title: 'Please wait...',message: 'Creating billing address');
                                          var res = await Injector().vkaService.post(path: 'AddBillingAdByShippingAd',
                                          query: {
                                            'sa_id': data['sa_id'],
                                          }
                                          );
                                          print('res of create ${res.statusCode}${res.body}');
                                          context.pop();
                                        }
                                        if (widget.onSelected != null) {
                                          widget.onSelected!(data); // Call onSelected with the data
                                          // context.pop(); // Pop the context if needed
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              // if (i == 0)
                              //   Padding(
                              //     padding: const EdgeInsets.symmetric(horizontal: 24) + const EdgeInsets.only(top: 12),
                              //     child: Text(
                              //       'Select ${widget.type == 'sa' ? 'Shipping' : 'Billing'} Address',
                              //       style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              //         color: Theme.of(context).dividerColor,
                              //       ),
                              //     ),
                              //   ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ));
  }
}
