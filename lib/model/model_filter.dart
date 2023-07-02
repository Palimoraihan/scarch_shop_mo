class ListFilter {
  String mainTitle;
  List<ModelFilter> listFilter;
  ListFilter({required this.mainTitle, required this.listFilter});
}

class ModelFilter {
  String title;
  int id;
  ModelFilter({required this.title, required this.id});
}

List<ListFilter> dataList = [
  ListFilter(mainTitle: 'Electronik', listFilter: dataFilterListForElec),
  ListFilter(mainTitle: 'Pakaian', listFilter: dataFilterListForPak),
  ListFilter(mainTitle: 'Food & Drink', listFilter: dataFilterListForFo),

];
List<ModelFilter> dataFilterListForElec = [
  ModelFilter(
    title: 'Xiomi',
    id: 1,
  ),
  ModelFilter(title: 'Samsung', id: 2),
  ModelFilter(title: 'Asus', id: 3),
  ModelFilter(title: 'Republik Of Gaming', id: 4),
];

List<ModelFilter> dataFilterListForPak = [
  ModelFilter(
    title: 'Eger',
    id: 5,
  ),
  ModelFilter(title: 'H&p', id: 6),
  ModelFilter(title: 'Indo', id: 7),
  ModelFilter(title: 'Pacific', id: 8),
];

List<ModelFilter> dataFilterListForFo = [
  ModelFilter(
    title: 'Junk Food',
    id: 9,
  ),
  ModelFilter(title: 'Soda Drink', id: 10),
  ModelFilter(title: 'Jus', id: 11),
  ModelFilter(title: 'Home Made Food & Drink', id: 12),
];

