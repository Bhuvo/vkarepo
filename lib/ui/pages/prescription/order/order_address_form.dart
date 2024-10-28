import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timesmedlite/di/dependency_injection.dart';
import 'package:timesmedlite/facade/api_facade.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder_bloc.dart';
import 'package:timesmedlite/ui/pages/prescription/order/order_address_list.dart';
import 'package:timesmedlite/ui/pages/prescription/order/product_list_item.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/m_dialog.dart';
import 'package:timesmedlite/ui/widgets/m_drop_down.dart';
import 'package:timesmedlite/ui/widgets/m_scaffold.dart';
import 'package:timesmedlite/ui/widgets/m_tab_bar.dart';
import 'package:timesmedlite/ui/widgets/m_text_field.dart';
import 'package:timesmedlite/utils/local_storage.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';
import 'package:timesmedlite/utils/size_utils.dart';

class OrderAddressForm extends StatefulWidget {
  const OrderAddressForm({Key? key}) : super(key: key);

  @override
  State<OrderAddressForm> createState() => _OrderAddressFormState();
}

class _OrderAddressFormState extends State<OrderAddressForm>
    with SingleTickerProviderStateMixin {
  late TabController tab;
  static const List<String> tabs = ['SHIPPING ADDRESS', 'BILLING ADDRESS'];

  final Map<String, dynamic>
      // bData = {}, sData = {},
      result = {};

  @override
  void initState() {
    tab = TabController(length: tabs.length, vsync: this);
    // init();
    super.initState();
  }

  init() async {
    await Future.delayed(const Duration(milliseconds: 500));
    final res = await showDialog(
        context: context, builder: (_) => const OrderAddressList());
    if (res != null) {
      result['sa_id'] = res['sa_id'];
      tab.animateTo(1);

      final res2 = await showDialog(
          context: context,
          builder: (_) => const OrderAddressList(
                type: 'ba',
              ));
      if (res2 != null) {
        result['ba_id'] = res2['ba_id'];
        context.pop(result);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      title: Text('Address'.toUpperCase()),
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0) +
                    const EdgeInsets.only(top: 12),
                child: MTabBar(
                  tab,
                  tabs,
                  scrollable: false,
                ),
              ),
              Expanded(
                  child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: tab,
                children: [
                  OrderAddressList(
                    onSelected: (d) {
                      result['sa_id'] = d['sa_id'];
                      // tab.animateTo(1);
                    },
                  ),
                  OrderAddressList(
                    type: 'ba',
                    onSelected: (d) {
                      result['ba_id'] = d['ba_id'];
                    },
                  ),
                  // AddressForm(onChanged: (d){
                  //   for(final e in d.keys){
                  //     sData['sa_$e'] = d[e];
                  //   }
                  // },),
                  // AddressForm(onChanged: (d){
                  //   for(final e in d.keys){
                  //     bData['ba_$e'] = d[e];
                  //   }
                  // },),
                ],
              ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: IconButton.filled(onPressed: ()async {
                Map<String, dynamic> map = {};
                switch (tab.index) {
                  case 0:
                    {

                      final Map<String, dynamic>? sData = await showDialog(
                          context: context,
                          builder: (_) =>  AddressForm(
                                data: map,
                                type: 'sa',
                              ));

                      print(sData);
                      if (sData == null) {
                        return;
                      }

                      for (final e in map.keys) {
                        sData['sa_$e'] = map[e];
                      }

                      if (sData['sa_id'] == null) {
                        sData['sa_id'] = 0;
                      }
                      sData['user_id'] = LocalStorage.getUID();
                      final call = Injector()
                          .apiService
                          .get(path: 'ShippingAddress', query: sData);
                      final res =
                          await ApiFacade.callApi(context: context, call: call);
                      print(res?.bodyString);
                      if (res != null) {
                        sData['sa_id'] = res.body?.data;
                        result['sa_id'] = res.body?.data;
                        // tab.animateTo(1);
                      }
                      break;
                    }
                  case 1:
                    {
                      final Map<String, dynamic>? bData = await showDialog(
                          context: context,
                          builder: (_) => AddressForm(
                                data: map,
                                type: 'ba',
                              ));
                      if (bData == null) {
                        return;
                      }

                      for (final e in map.keys) {
                        bData['ba_$e'] = map[e];
                      }



                      if (bData['ba_id'] == null) {
                        bData['ba_id'] = 0;
                      }
                      bData['user_id'] = LocalStorage.getUID();
                      final call = Injector()
                          .apiService
                          .get(path: 'BillingAddress', query: bData);
                      final res =
                          await ApiFacade.callApi(context: context, call: call);

                      print(res?.bodyString);
                      if (res != null) {
                        bData['ba_id'] = res.body?.data;
                        result['ba_id'] = res.body?.data;
                        if (mounted) {
                          context.pop(result);
                        }
                      }
                      break;
                    }
                }
                //context.push(Routes.paymentForm);

            }, icon: const Icon(Icons.add),style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(MTheme.THEME_COLOR),
              iconColor: WidgetStatePropertyAll(Colors.white),
              iconSize: WidgetStatePropertyAll(32),

            ),),
          )
        ],
      ),
      bottom: Container(
        height: 50,
        margin: EdgeInsets.symmetric(
            horizontal: context.getWPercent(8), vertical: 12),
        width: double.maxFinite,
        child: OutlinedButton(
          child: const Text('Confirm Address'),
          onPressed: (){
            print('result ${result}'); //{ba_id: 54440, sa_id: 42115}
             context.pop(result);
          },
          // onPressed: () async {
          //   Map<String, dynamic> map = {};
          //   switch (tab.index) {
          //     case 0:
          //       {
          //
          //         final Map<String, dynamic>? sData = await showDialog(
          //             context: context,
          //             builder: (_) =>  AddressForm(
          //                   data: map,
          //                   type: 'sa',
          //                 ));
          //
          //         print(sData);
          //         if (sData == null) {
          //           return;
          //         }
          //
          //         for (final e in map.keys) {
          //           sData['sa_$e'] = map[e];
          //         }
          //
          //         if (sData['sa_id'] == null) {
          //           sData['sa_id'] = 0;
          //         }
          //         sData['user_id'] = LocalStorage.getUID();
          //         final call = Injector()
          //             .apiService
          //             .get(path: 'ShippingAddress', query: sData);
          //         final res =
          //             await ApiFacade.callApi(context: context, call: call);
          //         print(res?.bodyString);
          //         if (res != null) {
          //           sData['sa_id'] = res.body?.data;
          //           result['sa_id'] = res.body?.data;
          //           // tab.animateTo(1);
          //         }
          //         break;
          //       }
          //     case 1:
          //       {
          //         final Map<String, dynamic>? bData = await showDialog(
          //             context: context,
          //             builder: (_) => AddressForm(
          //                   data: map,
          //                   type: 'ba',
          //                 ));
          //         if (bData == null) {
          //           return;
          //         }
          //
          //         for (final e in map.keys) {
          //           bData['ba_$e'] = map[e];
          //         }
          //
          //
          //
          //         if (bData['ba_id'] == null) {
          //           bData['ba_id'] = 0;
          //         }
          //         bData['user_id'] = LocalStorage.getUID();
          //         final call = Injector()
          //             .apiService
          //             .get(path: 'BillingAddress', query: bData);
          //         final res =
          //             await ApiFacade.callApi(context: context, call: call);
          //
          //         print(res?.bodyString);
          //         if (res != null) {
          //           bData['ba_id'] = res.body?.data;
          //           result['ba_id'] = res.body?.data;
          //           if (mounted) {
          //             context.pop(result);
          //           }
          //         }
          //         break;
          //       }
          //   }
          //   //context.push(Routes.paymentForm);
          // },
        ),
      ),
    );
  }
}

class AddressForm extends StatefulWidget {
  final Map<String, dynamic> data;
  final String type;
  final Function(Map<String, dynamic> data)? onChanged;

  const AddressForm(
      {Key? key, this.onChanged, this.type = 'sa', required this.data})
      : super(key: key);

  @override
  State<AddressForm> createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {


  @override
  Widget build(BuildContext context) {
    return MDialog(
      title: Row(
        children: [
          Text('Add ${widget.type == 'sa' ? 'Shipping Address' : 'Billing Address'}'),
          const Spacer(),
          IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(Icons.close_rounded))
        ],
      ),
      action: OutlinedButton(
        onPressed: () {
          final Map<String, dynamic> map = {};
          map.addAll(widget.data);
          context.pop(map);
        },
        child: const Text('Add'),
      ),
      child: Expanded(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              MTextField(
                label: 'Name',
                type: MInputType.text,
                value: widget.data['firstname'],
                onChanged: (d) {
                  widget.data['firstname'] = d;
                  widget.onChanged?.call(widget.data);
                },
              ),
              const SizedBox(
                height: 8,
              ),
              MTextField(
                label: 'Mobile Number',
                type: MInputType.phone,
                value: widget.data['mobile'],
                onChanged: (d) {
                  widget.data['mobile'] = d;
                  widget.onChanged?.call(widget.data);
                },
              ),
              const SizedBox(
                height: 8,
              ),
              MTextField(
                label: 'Email',
                type: MInputType.email,
                value: widget.data['email'],
                onChanged: (d) {
                  widget.data['email'] = d;
                  widget.onChanged?.call(widget.data);
                },
              ),
              const SizedBox(
                height: 8,
              ),
              MDropDown(
                label: 'Country',
                hint: 'Select Country',
                items: ['India'],
                value: widget.data['country'],
                onChanged: (d) {
                  widget.data['country'] = d;
                  widget.onChanged?.call(widget.data);
                },
              ),
              const SizedBox(
                height: 8,
              ),
              MDropDown(
                label: 'State',
                hint: 'Select State',
                items: ['Tamil Nadu'],
                value: widget.data['state'],
                onChanged: (d) {
                  widget.data['state'] = d;
                  widget.onChanged?.call(widget.data);
                },
              ),
              const SizedBox(
                height: 8,
              ),
              MTextField(
                label: 'Landmark',
                value: widget.data['landmark'],
                onChanged: (d) {
                  widget.data['landmark'] = d;
                  widget.onChanged?.call(widget.data);
                },
              ),
              const SizedBox(
                height: 8,
              ),
              MTextField(
                label: 'Address',
                type: MInputType.text,
                maxLines: 10,
                minLines: 4,
                value: widget.data['address'],
                onChanged: (d) {
                  widget.data['address'] = d;
                  widget.onChanged?.call(widget.data);
                },
              ),
              const SizedBox(
                height: 8,
              ),
              MTextField(
                label: 'Pincode',
                type: MInputType.numeric,
                maxLength: 6,
                value: widget.data['pincode'],
                onChanged: (d) {
                  widget.data['pincode'] = d;
                  widget.onChanged?.call(widget.data);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
