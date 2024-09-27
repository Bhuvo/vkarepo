
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:timesmedlite/di/dependency_injection.dart';
import 'package:timesmedlite/facade/razorpay_facade.dart';
import 'package:timesmedlite/model/order_cart_item.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder_bloc.dart';
import 'package:timesmedlite/ui/components/show_message.dart';
import 'package:timesmedlite/ui/components/waiting_dialog.dart';
import 'package:timesmedlite/ui/pages/prescription/order/product_list_item.dart';
import 'package:timesmedlite/ui/widgets/m_scaffold.dart';
import 'package:timesmedlite/utils/date_utils.dart';
import 'package:timesmedlite/utils/local_storage.dart';
import 'package:timesmedlite/utils/size_utils.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

class PrescriptionList extends StatefulWidget {
  final List<Map<String, dynamic>> data;

  PrescriptionList({Key? key, required this.data}) : super(key: key);

  @override
  State<PrescriptionList> createState() => _PrescriptionListState();
}

class _PrescriptionListState extends State<PrescriptionList> {
  final Map<String, int> cart = {};

  final PRODUCT_KEY = 'Drug_id';

  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    final res = await fetchCart();
    for(final e in res){
      setState(() {
        cart['${e.Product_id}'] = e.Qty;
      });
    }
  }


  Future<List<OrderCartItem>> fetchCart() async {
    List<OrderCartItem> list = [];
    final res = await Injector().apiService.get(path: 'PharmaCartList', query: {
      'User_id': LocalStorage.getUID()
    });
    if(res.isSuccessful && res.body?.data is List){
       for(final e in res.body?.data ?? []){
         list.add(OrderCartItem.fromJson(e));
       }
    }
    return list;
  }
  onSuccess(PaymentSuccessResponse d, num amount) async {
    final res = await Injector().apiService.rawGet(path: 'RazorpayResponse', query: {
      'Res_Order_id': d.orderId,
      'Res_PaymentID': d.paymentId,
      'Res_Signature': d.signature
    });
    print(res.bodyString);
    if(res.isSuccessful){
      final json = jsonDecode(res.bodyString);
      showMessage(context: context, message: 'Order Placed');
      if(mounted) {
        context.replace(Routes.orderSummary, {
          ...json,
          'amount': amount,
          'txn': d.paymentId
        });
      }
    }
  }
  proceed() async {
    if(cart.isNotEmpty){
      showWaitingDialog(context: context);
      var cartRes = await fetchCart();
      for(final e in cart.keys){
        var product;
        for(final f in widget.data){
          if(f[PRODUCT_KEY] == e){
            product = f;
          }
        }
        OrderCartItem? cartItem;
        print(product);
        print(product.runtimeType);

        for(final f in cartRes){
          if('${f.Product_id}' == e){
            cartItem = f;
          }
        }
        if(product != null) {
          final res = await Injector().apiService.get(
              path: 'PharmaAddEditCart', query: {
            'User_id': LocalStorage.getUID(),
            'Product_id': e,
            'Product_Name': product['drug_name'],
            'Qty': cart[e],
            'Product_mrp': product['Mrp'],
            'Product_Price': product['Price'],
            'Cart_id': cartItem == null ? 0 : cartItem.Cart_id
          });
          if(kDebugMode){
            print(res.bodyString);
          }
        }
      }
      cartRes = await fetchCart();
      context.pop();
      if(mounted) {
        final address = await context.push(Routes.addressForm);
        if(address != null){
          num total = 0;
          for(final e in cartRes){
            final q = e.Qty;
            final a = num.tryParse('${e.Product_Price}') ?? 0;
            total += (q * a);
          }

          final r = await context.push(Routes.paymentForm, {'amount': total});
          if(r == true){
            showWaitingDialog(context: context);
            final res = await Injector().apiService.rawGet(path: 'CreateOrder', query: {
              ...address,
              'user_id': LocalStorage.getUID(),
              'order_amount': total,
              'order_date': MDateUtils.dateToQueryDate(DateTime.now().toIso8601String())
            });
            context.pop();
            print(res.bodyString);
            if(res.bodyString != null){
              try{
                final json = jsonDecode(res.bodyString);
                RazorpayFacade.pay(orderId: json['Data'], amount: num.tryParse('${json['OrderAmount']}') ?? 0, onSuccess: (d) {
                  onSuccess(d, total);
                  //context.pop();
                }, onFailure: (_){
                  showMessage(context: context, message: 'Failed to Pay');
                });
              }catch(_){}
            }
          }


        }
      }
    }


  }

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      title: Text('Prescribe'.toUpperCase()),
      body: ListView.builder(
        itemCount: widget.data.length,
        itemBuilder: (c, i) {
          final d = widget.data[i];
          return ProductListItem(
            data: d,
            addToCart: () {
              setState(() {
                cart[d[PRODUCT_KEY]] = 1;
              });
            },
            quantity: cart[d[PRODUCT_KEY]],
            removeFromCart: () {
              setState(() {
                cart.remove(d[PRODUCT_KEY]);
              });
            },
            updateCart: (i) {
              setState(() {
                cart[d[PRODUCT_KEY]] = i;
              });
            },
          );
        },
      ),
      bottom: Container(
        height: 50,
        margin: EdgeInsets.symmetric(
            horizontal: context.getWPercent(8), vertical: 12),
        width: double.maxFinite,
        child: OutlinedButton(
          child: const Text('Proceed'),
          onPressed: proceed,
        ),
      ),
    );
  }
}
