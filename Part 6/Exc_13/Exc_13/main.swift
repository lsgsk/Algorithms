
import Foundation

print("Hello, World!")
var array = [2, 12, 5, 11, 7, 1, 14, 8, 4, 9, 3, 6, 10, 15, 0, 13]
print(array)
Quicksort(values: &array, start: 0, end: array.count-1)
print(array)
