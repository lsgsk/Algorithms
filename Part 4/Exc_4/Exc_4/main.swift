
import Foundation

func removeElementAtIndex1(_ array: [Int], _ index: Int) -> [Int]{
    if (index < 0 || index > array.count-1){
        return array
    }
    var newArray = [Int](repeating: 0, count: array.count-1)
    var position = 0
    for i in 0 ..< array.count{
        if i != index
        {
            newArray[position] = array[i]
            position += 1
        }
    }
    return newArray
}

func removeElementAtIndex2(_ array: [Int], _ index: Int) -> [Int]{
    var array = array
    array.remove(at: index)
    return array
}



let array = [5, 7, 10, 15, 23, 42]
print(removeElementAtIndex1(array, 0))
print(removeElementAtIndex1(array, 3))
print(removeElementAtIndex1(array, 5))
print(removeElementAtIndex1(array, 6))

print(removeElementAtIndex2(array, 3))
