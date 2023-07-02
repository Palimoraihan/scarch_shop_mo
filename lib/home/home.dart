import 'package:flutter/material.dart';
import 'package:mo_shop_app/cart/cart_page.dart';
import 'package:mo_shop_app/model/model_filter.dart';
import 'package:mo_shop_app/widget/filter_widget.dart';
import 'package:mo_shop_app/widget/format_curency.dart';
import 'package:mo_shop_app/widget/tree_widget/tree_view.dart';
import '../model/model_random.dart';
import '../model/model_user.dart';

import '../model/model_product.dart';
import '../widget/tree_widget/model_tree.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController textC = TextEditingController();

  List<Item> filterDatas = items;
  bool isItemAdded(item) {
    bool _isItemAdd = cartItems.contains(item);
    if (_isItemAdd) {
      return true;
    } else {
      return false;
    }
  }

  void filterData(List<ModelFilter> datas) {
    setState(() {
      filterDatas = items
          .where(
            (element1) => datas.any(
              (element2) => element1.category
                  .any((element3) => element3.id == element2.id),
            ),
          )
          .toList();
    });
    print(items.length);
    // List<Item> dataList = [];
    // for (var element1 in items) {
    //   for (var element2 in datas) {
    //     for (var element3 in element1.category) {
    //       if (element3.title.contains(element2.title)) {
    //       dataList.add(element1);
    //       break;
    //     }
    //     }

    //   }
    // }
    // setState(() {
    //   items = dataList;
    // });
    // print(dataList.length);
  }

  void searchItem(String keyword) {
    setState(() {
      filterDatas = items
          .where((element) =>
              element.name.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    });
  }

  List<Item> cartItems = [];
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome To Mo Shoop'),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => FilterWidget(
                    listData: dataList,
                    onTap: (data) {
                      print(data);
                      filterData(data!);
                    },
                  ),
                );
              },
              icon: Icon(Icons.filter_2_rounded)),
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => TreeView(
                          nodes: nodes,
                          onStackTap: (value) {},
                        ));
              },
              icon: Icon(Icons.filter_4_rounded)),
        ],
      ),
      body: Column(
        children: [
          ListTile(
              title: Text(
                myProfil.name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: NumberFormatText(
                exstarText: 'Rp',
                number: myProfil.myWallet.toInt(),
                style: TextStyle(fontSize: 24, color: Colors.blueAccent),
              )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: TextField(
              controller: textC,
              autocorrect: true,
              onChanged: (value) {
                searchItem(value);
              },
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                      onPressed: () => textC.clear(), icon: Icon(Icons.clear)),
                  hintText: 'Search...'),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: filterDatas.length,
                itemBuilder: (context, index) {
                  final item = filterDatas[index];
                  return ListTile(
                    leading: Icon(Icons.bubble_chart_rounded),
                    title: Text(item.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NumberFormatText(
                          exstarText: 'Rp',
                          number: item.price.toInt(),
                          style: TextStyle(color: Colors.amber),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(item.desc),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: item.category
                              .map(
                                (e) => Padding(
                                  padding: const EdgeInsets.only(left: 6),
                                  child: Chip(
                                    label: Text(e.title),
                                  ),
                                ),
                              )
                              .toList(),
                        )
                      ],
                    ),
                    trailing: TextButton(
                      onPressed: () {
                        setState(() {
                          if (!isItemAdded(item)) {
                            cartItems.add(item);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    'Belanjaan yang ini sudah kamu taru di cart coba liat deh')));
                          }
                        });
                      },
                      child: Text('Punya ku'),
                    ),
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartPage(itemsProduct: cartItems),
              ));
        },
        child: Stack(
          children: [
            Icon(Icons.shopping_cart),
            cartItems.isNotEmpty
                ? Positioned(
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        cartItems.length.toString(),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
