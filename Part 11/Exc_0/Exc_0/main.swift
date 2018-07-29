import Foundation

var avl = AvlTree()
/*avl.add(4);print(avl);print("")
avl.add(5);print(avl);print("")
avl.add(7);print(avl);print("")
avl.add(2);print(avl);print("")
avl.add(1);print(avl);print("")
avl.add(3);print(avl);print("")
avl.add(6);print(avl);print("")*/

avl.root = Node(10)
avl.root?.right = Node(15)
avl.root?.left = Node(8)
avl.root?.right?.left = Node(12)
avl.root?.right?.right = Node(17)
print(avl)
avl.add(20)
print(avl)
