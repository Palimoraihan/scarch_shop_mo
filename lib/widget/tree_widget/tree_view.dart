import 'package:flutter/material.dart';
import 'package:mo_shop_app/widget/tree_widget/list_tree.dart';
import 'package:mo_shop_app/widget/tree_widget/model_tree.dart';

class TreeView extends StatefulWidget {
  const TreeView(
      {super.key, required this.nodes, required this.onStackTap});
  final List<TreeNode> nodes;
  final Function(List<int>) onStackTap;

  @override
  State<TreeView> createState() => _TreeViewState();
}

class _TreeViewState extends State<TreeView> {
  List<int> selectedId = [];
  List<TreeNode> filterdNode = [];
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filterdNode = widget.nodes;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          
          child: ListView.builder(
            itemCount: filterdNode.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => TreeNodeWidget(
                node: filterdNode[index],
                selectedId: selectedId,
                onSelectChange: (value) {
                  // print('$value frome change');
                },),
          ),
        ),
        ElevatedButton(onPressed: widget.onStackTap(selectedId), child: Text('Apply'))
      ],
    );
  }
}
