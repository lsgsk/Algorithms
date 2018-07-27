import Foundation

var tree = Trie()
var key1 = "APPLE"
var key2 = "APP"
var key3 = "BEAR"
var key4 = "ANT"
var key5 = "BAT"
var key6 = "APE"
tree.addValue(&key1, 10)
tree.addValue(&key2, 20)
tree.addValue(&key3, 30)
tree.addValue(&key4, 40)
tree.addValue(&key5, 50)
tree.addValue(&key6, 60)
tree.print()

