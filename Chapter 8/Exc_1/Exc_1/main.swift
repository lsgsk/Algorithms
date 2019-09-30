import Foundation

var hash = DirectHashTable()
hash.makeItems()
print(hash)
print("Check: " + (hash.find(37) ?? ""))
