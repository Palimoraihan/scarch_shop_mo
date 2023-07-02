import 'package:flutter/material.dart';
import 'package:mo_shop_app/model/model_user.dart';
import 'package:mo_shop_app/widget/format_curency.dart';

class HistoryShopPage extends StatelessWidget {
  const HistoryShopPage({super.key, required this.itemHitory});
  final List<ListProd> itemHitory;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My History Payment'),
        ),
        body: ListView.builder(
          itemCount: itemHitory.length,
          itemBuilder: (context, index) {
            final item = itemHitory[index];
            return ListTile(
              title: NumberFormatText(number: item.totalPrice.toInt()),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: item.listProduct.map((e) => Text(e.name)).toList(),
                  ),
                  Column(
                    children: item.listProduct.map((e) => Text(e.quantity.toString())).toList(),
                  )
                ],
              ),
            );
          },
        ));
  }
}
