import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timesmedlite/di/dependency_injection.dart';
import 'package:timesmedlite/facade/api_facade.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder_bloc.dart';
import 'package:timesmedlite/ui/pages/prescription/order/order_address_list.dart';
import 'package:timesmedlite/ui/pages/prescription/order/product_list_item.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
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

  final Map<String, dynamic> bData = {}, sData = {}, result = {};

  @override
  void initState() {
    tab = TabController(length: tabs.length, vsync: this);
    init();
    super.initState();
  }

  init() async {
    await Future.delayed(const Duration(milliseconds: 500));
    final res = await showDialog(context: context, builder: (_) => const OrderAddressList());
    if(res != null){
      result['sa_id'] = res['sa_id'];
      tab.animateTo(1);

      final res2 = await showDialog(context: context, builder: (_) => const OrderAddressList(type: 'ba',));
      if(res2 != null){
        result['ba_id'] = res2['ba_id'];
       context.pop(result);
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      title: Text('Address'.toUpperCase()),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: MTabBar(
              tab,
              tabs,
              scrollable: false,
            ),
          ),
          Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
            controller: tab,
            children: [
              AddressForm(onChanged: (d){
                for(final e in d.keys){
                  sData['sa_$e'] = d[e];
                }
              },),
              AddressForm(onChanged: (d){
                for(final e in d.keys){
                  bData['ba_$e'] = d[e];
                }
              },),
            ],
          ))
        ],
      ),
      bottom: Container(
        height: 50,
        margin: EdgeInsets.symmetric(
            horizontal: context.getWPercent(8), vertical: 12),
        width: double.maxFinite,
        child: OutlinedButton(
          child: const Text('Proceed'),
          onPressed: () async {
            switch(tab.index){
              case 0: {
                if(sData['sa_id'] == null) {
                  sData['sa_id'] = 0;
                }
                sData['user_id'] = LocalStorage.getUID();
                final call = Injector().apiService.get(path: 'ShippingAddress', query: sData);
                final res = await ApiFacade.callApi(context: context, call: call);

                print(res?.bodyString);
                if(res != null){
                  sData['sa_id'] = res.body?.data;
                  result['sa_id'] = res.body?.data;
                  tab.animateTo(1);
                }
                break;
              }
              case 1: {
                if(bData['ba_id'] == null) {
                  bData['ba_id'] = 0;
                }
                bData['user_id'] = LocalStorage.getUID();
                final call = Injector().apiService.get(path: 'BillingAddress', query: bData);
                final res = await ApiFacade.callApi(context: context, call: call);

                print(res?.bodyString);
                if(res != null){
                  bData['ba_id'] = res.body?.data;
                  result['ba_id'] = res.body?.data;
                  if(mounted) {
                    context.pop(result);
                  }
                }
                break;
              }
            }
            //context.push(Routes.paymentForm);
          },
        ),
      ),
    );
  }
}

class AddressForm extends StatelessWidget {
  Map<String, dynamic> data = {};
  final Function(Map<String, dynamic> data)? onChanged;
  AddressForm({Key? key,  this.onChanged}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          MTextField(
            label: 'Name',
            type: MInputType.text,
            value: data['firstname'],
            onChanged: (d){
              data['firstname'] = d;
              onChanged?.call(data);
            },
          ),
          const SizedBox(
            height: 8,
          ),
          MTextField(
            label: 'Mobile Number',
            type: MInputType.phone,
            value: data['mobile'],
            onChanged: (d){
              data['mobile'] = d;
              onChanged?.call(data);
            },
          ),
          const SizedBox(
            height: 8,
          ),
          MTextField(
            label: 'Email',
            type: MInputType.email,
            value: data['email'],
            onChanged: (d){
              data['email'] = d;
              onChanged?.call(data);
            },
          ),
          const SizedBox(
            height: 8,
          ),
          MDropDown(
            label: 'Country',
            hint: 'Select Country',
            items: ['India'],
            value: data['country'],
            onChanged: (d){
              data['country'] = d;
              onChanged?.call(data);
            },
          ),
          const SizedBox(
            height: 8,
          ),
          MDropDown(
            label: 'State',
            hint: 'Select State',
            items: ['Tamil Nadu'],
            value: data['state'],
            onChanged: (d){
              data['state'] = d;
              onChanged?.call(data);
            },
          ),
          const SizedBox(
            height: 8,
          ),
          MTextField(
            label: 'Landmark',
            value: data['landmark'],
            onChanged: (d){
              data['landmark'] = d;
              onChanged?.call(data);
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
            value: data['address'],
            onChanged: (d){
              data['address'] = d;
              onChanged?.call(data);
            },
          ),
          const SizedBox(
            height: 8,
          ),
          MTextField(label: 'Pincode', type: MInputType.numeric, maxLength: 6,value: data['pincode'],
            onChanged: (d){
              data['pincode'] = d;
              onChanged?.call(data);
            }, ),
        ],
      ),
    );
  }
}
