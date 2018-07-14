import Foundation

var hash = SortedDirectHashTable()
hash.makeItems()
print(hash)
print("Find for key 37: \(hash.find(37) ?? "")")
