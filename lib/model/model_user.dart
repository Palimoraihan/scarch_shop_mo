import 'package:mo_shop_app/model/model_product.dart';

class ModelUser {
  ModelUser({required this.name, required this.myWallet,required this.hostoryRecord});
  String name;
  double myWallet;
  List<ListProd> hostoryRecord;
}
class ListProd {
  ListProd({required this.totalPrice,required this.listProduct});
  double totalPrice;
  List<Item> listProduct;
}
ModelUser myProfil = ModelUser(
  name: 'Palimo Raihan S',
  myWallet: 100000000,
  hostoryRecord: [],
);
