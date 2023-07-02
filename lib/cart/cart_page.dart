import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mo_shop_app/history_shop/history_shop_page.dart';
import '../model/model_product.dart';
import '../model/model_user.dart';
import '../widget/format_curency.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key, required this.itemsProduct});
  final List<Item> itemsProduct;

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double totalPrice = 0;
  List<ListProd> listHistory = [];

  double calculate() {
    double sum = 0;
    for (var element in widget.itemsProduct) {
      setState(() {
        sum += element.price * element.quantity;
      });
    }
    setState(() {
      totalPrice = sum;
    });
    return sum;
  }

  int allQuantity() {
    int sumQuantity = 0;
    for (var element in widget.itemsProduct) {
      sumQuantity += element.quantity;
    }
    print(sumQuantity);
    return sumQuantity;
  }

  void addHistory(ListProd dataHistory) {
    setState(() {
      listHistory.add(dataHistory);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Page'),
      ),
      body: widget.itemsProduct.isEmpty
          ? Center(
              child: Text('Belum ada di keranjanga'),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.itemsProduct.length,
                    itemBuilder: (context, index) {
                      Item item = widget.itemsProduct[index];
                      double sum = item.price;

                      return ListTile(
                        title: Text(
                          item.name,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        subtitle: NumberFormatText(
                          exstarText: 'Rp',
                          number: item.price.toInt(),
                          style: TextStyle(color: Colors.amber),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  sum = item.price * item.quantity++;
                                });
                              },
                              icon: Icon(Icons.add_circle_outline_outlined),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text('${item.quantity}'),
                            SizedBox(
                              width: 5,
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (item.quantity > 1) {
                                    item.quantity--;
                                  }
                                });
                              },
                              icon: Icon(Icons.remove_circle_outline_rounded),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Total Barang: ${allQuantity()}'),
                          NumberFormatText(
                            exstarText: 'Total Harga : Rp',
                            number: calculate().toInt(),
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (myProfil.myWallet <= calculate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Uang Kamu Tidak Cukup !'),
                                ),
                              );
                            } else {
                              addHistory(ListProd(
                                  totalPrice: totalPrice,
                                  listProduct: widget.itemsProduct));
                              Timer(Duration(milliseconds: 500), () {
                                  Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      HistoryShopPage(itemHitory: listHistory),
                                ),
                              );
                              });

                            
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Transaksi Berhasil Silakan Lihat Detail Transaksi'),
                                ),
                              );
                            }
                          },
                          child: Text('Beli Semua'))
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
