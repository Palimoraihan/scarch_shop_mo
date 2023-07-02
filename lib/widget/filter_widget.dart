import 'package:flutter/material.dart';

import '../model/model_filter.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key, required this.listData, required this.onTap});
  final void Function(List<ModelFilter>? data) onTap;
  final List<ListFilter> listData;

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  List<ModelFilter> itemAded = [];
  List<String> resault = [];

  void _itemAddFunc(ModelFilter item) {
    bool _isAdded = itemAded.contains(item);
    if (_isAdded) {
      setState(() {
        itemAded.remove(item);
        resault.remove(item.title);
      });
    } else {
      setState(() {
        itemAded.add(item);
        resault.add(item.title);
      });
    }
  }

  void addAllField(ListFilter item) {
    for (var element in item.listFilter) {
      if (!itemAded.contains(element)) {
        setState(() {
          itemAded.addAll(item.listFilter);
          resault.addAll(item.listFilter.map((e) => e.title));
        });
      }
    }
  }

  bool isAllAdd(ListFilter item) {
    bool isAdded = false;
    for (var element in item.listFilter) {
      bool _isAdded = itemAded.contains(element);
      if (_isAdded) {
        isAdded = true;
      } else {
        isAdded = false;
      }
    }
    return isAdded;
  }

  @override
  Widget build(BuildContext context) {
    final sizeDevices = MediaQuery.of(context).size.height;
    print(sizeDevices);
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: sizeDevices*0.75),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.listData.length,
                itemBuilder: (context, index) {
                  final item = widget.listData[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(item.mainTitle),
                            TextButton(
                                onPressed: () {
                                  if (isAllAdd(item)) {
                                    setState(() {
                                      itemAded.removeWhere(
                                        (element) =>
                                            item.listFilter.contains(element),
                                      );
                                      resault.removeWhere((element) => item
                                          .listFilter
                                          .map((e) => e.title)
                                          .contains(element));
                                    });
                                  } else {
                                    setState(() {
                                      itemAded.addAll(item.listFilter);
                                      resault.addAll(
                                          item.listFilter.map((e) => e.title));
                                    });
                                  }
                                },
                                child: Text(
                                  isAllAdd(item) ? 'Remove All' : 'Select All',
                                  style: TextStyle(color: Colors.amber),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Wrap(
                            runSpacing: 10,
                            spacing: 10,
                            children: item.listFilter
                                .map(
                                  (e) => GestureDetector(
                                    onTap: () {
                                      _itemAddFunc(e);
                                    },
                                    child: Chip(
                                      backgroundColor: itemAded.contains(e)
                                          ? Colors.white
                                          : Colors.transparent,
                                      label: Text(
                                        e.title,
                                        style: TextStyle(
                                            color: itemAded.contains(e)
                                                ? Colors.black
                                                : Colors.grey),
                                      ),
                                    ),
                                  ),
                                )
                                .toList())
                      ],
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                widget.onTap(itemAded);
              },
              child: Text('Select'),
            ),
          ],
        ),
      ),
    );
  }
}
