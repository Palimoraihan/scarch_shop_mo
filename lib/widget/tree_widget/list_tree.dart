import 'package:flutter/material.dart';
import 'package:mo_shop_app/widget/tree_widget/model_tree.dart';

class TreeNodeWidget extends StatefulWidget {
  const TreeNodeWidget(
      {super.key,
      required this.node,
      required this.selectedId,
      required this.onSelectChange});
  final TreeNode node;
  final List<int> selectedId;
  final Function(List<int> value) onSelectChange;

  @override
  State<TreeNodeWidget> createState() => _TreeNodeWidgetState();
}

class _TreeNodeWidgetState extends State<TreeNodeWidget> {
  bool _isSelected = false;
  bool _isTap = false;
  List<int> hasTap = [];

  //Single Check
  void onChange(bool? value) {
    _isSelected = value ?? false;
    setState(() {
      if (_isSelected) {
        widget.selectedId.add(widget.node.id);
      } else {
        widget.selectedId.remove(widget.node.id);
      }
      widget.onSelectChange(widget.selectedId);
    });
  }

  //MultiCheck
  void _selectAllChildren(TreeNode node) {
    setState(() {
      widget.selectedId.add(node.id);
    });

    for (var child in node.children) {
      _selectAllChildren(child);
    }
  }

  void _deselectAllChildren(TreeNode node) {
    setState(() {
      widget.selectedId.remove(node.id);
    });

    for (var child in node.children) {
      _deselectAllChildren(child);
    }
  }

  void onTap() {
    setState(() {
      _isTap = !_isTap;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        children: [
          ListTile(
            onTap: onTap,
            title: Text(widget.node.title),
            trailing: Checkbox(
              value: widget.selectedId.contains(widget.node.id),
              onChanged: (value) {
                // onChange(value);

                if (value == true) {
                  _selectAllChildren(widget.node);
                } else {
                  _deselectAllChildren(widget.node);
                }
                setState(() {
                  widget.onSelectChange(widget.selectedId);
                });
              },
            ),
          ),
          if (_isTap)
            Column(
              children: widget.node.children
                  .map(
                    (child) => TreeNodeWidget(
                        node: child,
                        selectedId: widget.selectedId,
                        onSelectChange: widget.onSelectChange),
                  )
                  .toList(),
            )
        ],
      ),
    );
  }
}
