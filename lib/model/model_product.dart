import 'package:mo_shop_app/model/model_filter.dart';

class Item {
  final String name;
  final double price;
  final String desc;
  final List<ModelFilter> category;
  int quantity;


  Item(this.name, this.price, this.desc,this.category,{this.quantity = 1});
}

List<Item> items = [
    Item('Shoose Nike', 300000, 'Beli sekarang sepatu pria dan wanita', [
      ModelFilter(title: 'Eger', id: 5),
      ModelFilter(title: 'H&p', id: 6),
    ]),
    Item('Jaket Local', 150000, 'Jaket lokal hanya disini kawan', [
      ModelFilter(title: 'Indo', id: 7),
      ModelFilter(title: 'Pacific', id: 8),
    ]),
    Item('Laptop Asus', 8000000,
        'Tech yang anda tunggu sudah ada silakan checkout sekarang juga', [
      ModelFilter(title: 'Republik Of Gaming', id: 4),
      ModelFilter(title: 'Asus', id: 3),
    ]),
    Item('Redmi Not 9', 2500000, 'Ayo gebyar Redmi sekarang juga', [
      ModelFilter(
        title: 'Xiomi',
        id: 1,
      ),
    ]),
    Item('Shoose Nike', 320000, 'Beli sekarang sepatu pria dan wanita', [
      ModelFilter(title: 'H&p', id: 6),
    ]),
    Item('Jaket Local', 150000, 'Jaket lokal hanya disini kawan', [
      ModelFilter(
        title: 'Eger',
        id: 5,
      ),
    ]),
    Item('Laptop Asus', 8000000,
        'Tech yang anda tunggu sudah ada silakan checkout sekarang juga', [
      ModelFilter(title: 'Samsung', id: 2),
    ]),
  ];