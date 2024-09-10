import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timesmedlite/ui/components/price_view.dart';
import 'package:timesmedlite/ui/widgets/m_list_tile.dart';


class  ProductListItem extends StatelessWidget {
  final Map<String, dynamic> data;
  final VoidCallback? addToCart, removeFromCart;
  final Function(int quantity)? updateCart;
  final int? quantity;
  const ProductListItem({Key? key, required this.data, this.quantity, this.addToCart, this.removeFromCart, this.updateCart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MListTile(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Expanded(
                    child: Text(
                  '${data['drug_name'] ?? ''}',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Theme.of(context).textTheme.caption?.color),
                )),
                PriceView(
                  value: num.tryParse('${data['Price'] ?? '0'}') ?? 0,
                  size: 18,
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            if(quantity == null) OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 16)),
                onPressed: addToCart,
                icon: const Icon(
                  CupertinoIcons.cart_badge_plus,
                  color: Colors.white,
                  size: 16,
                ),
                label: const Text(
                  'Add to Cart',
                  style: TextStyle(fontSize: 13),
                )) else Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 40),
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(

                          padding: const EdgeInsets.all(0)),
                      onPressed: (){
                        if(quantity == 1){
                          removeFromCart?.call();
                        } else {
                          updateCart?.call(quantity! - 1);
                        }
                      },
                      child: const Icon(
                        CupertinoIcons.minus,
                        color: Colors.white,
                        size: 24,
                      ),),
                ),
                const SizedBox(width: 10,),
                Text('$quantity', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
                const SizedBox(width: 10,),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 40),
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(

                          padding: const EdgeInsets.all(0)),
                      onPressed: (){
                        updateCart?.call(quantity! + 1);
                      },
                      child: const Icon(
                        CupertinoIcons.plus,
                        color: Colors.white,
                        size: 24,
                      ),),
                ),
              ],
            )
          ],
        ));
  }
}
