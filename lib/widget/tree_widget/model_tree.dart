class TreeNode {
  String title;
  int id;
  List<TreeNode> children;
  TreeNode({required this.title,required this.id,required this.children});
}

 final List<TreeNode> nodes = [
    TreeNode(
      title: 'Node 1',
      id: 1,
      children: [
        TreeNode(title: 'Child 1.1', id: 2, children: []),
        TreeNode(title: 'Child 1.2', id: 3, children: []),
      ],
    ),
    TreeNode(
      title: 'Node 2',
      id: 4,
      children: [
        TreeNode(title: 'Child 2.1', id: 5, children: []),
        TreeNode(
          title: 'Child 2.2',
          id: 6,
          children: [
            TreeNode(title: 'Grandchild 2.2.1', id: 7, children: []),
            TreeNode(title: 'Grandchild 2.2.2', id: 8, children: []),
          ],
        ),
      ],
    ),
    TreeNode(
      title: 'Node 3',
      id: 9,
      children: [
        TreeNode(title: 'Child 3.1', id: 10, children: []),
      
      ],
    ),
  ];