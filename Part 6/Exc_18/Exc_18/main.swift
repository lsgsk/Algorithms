import Foundation

func Bucketsort(values: inout [Int], max: Int, blockcount: Int) {
    var blocks = Array(repeating: ListStack<Int>(), count: blockcount)
    for i in 0..<blocks.count{
        blocks[i] = ListStack<Int>()
    }
    let size = max / blockcount
    
    for item in values {
        let busketindex = (item/size)
        print("\(item) => \(busketindex)")
        blocks[busketindex].push(item: item)
    }
    
    var index =  0
    for busket in blocks{
        busket.selectionSort()
        while let item = busket.pop() {
            values[index] = item
            index += 1
        }
    }
    
}

print("Hello, World!")
var array = [2, 12, 5, 11, 7, 1, 14, 8, 4, 9, 3, 6, 10, 15, 0, 13]
print(array)
Bucketsort(values: &array, max: 20, blockcount: 5)
print(array)

