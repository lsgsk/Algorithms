import Foundation

if let tree = BTree<Int, String>(order: 3)
{
    tree.insert("Sasha", for: 5)
    tree.insert("Misha", for: 3)
    tree.insert("Anna", for: 10)
    tree.insert("Sveta", for: 8)
    tree.insert("Lena", for: 1)
    tree.insert("Anton", for: 4)
    tree.insert("Maxim", for: 9)
    tree.insert("Stepan", for: 2)
    print(tree.description)
}


