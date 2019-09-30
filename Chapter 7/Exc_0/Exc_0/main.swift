func LinearSearch(values: [Int], target: Int) -> Int{
    var steps = 0
    for i in 0..<values.count{
        steps += 1
        if values[i] == target{
            print("LinearSearch steps: \(steps) ")
            return i
        }
        if values[i] > target{
            print("LinearSearch steps: \(steps) ")
            return -1
        }
    }
    print("LinearSearch steps: \(steps) ")
    return -1
}
func BinarySearch(values : [Int], target: Int) -> Int{
    var min = 0
    var max = values.count - 1
    var steps = 0
    while (min <= max){
        steps += 1
        let mid = (min + max) / 2
        if (target < values[mid]){
            max = mid - 1
        } else if (target > values[mid]){
            min = mid + 1
        }  else{
            print("BinarySearch steps: \(steps) ")
            return mid
        }
    }
    print("BinarySearch steps: \(steps) ")
    return -1
}

func InterpolationSearch(values : [Int], target: Int) -> Int{
    var minimal = 0
    var maximum = values.count - 1
    var steps = 0
    while (minimal <= maximum){
        steps += 1
        let mid = min(maximum, minimal + (maximum - minimal) * (target - values[minimal]) / (values[maximum] - values[minimal]))
        if (values[mid] == target){
            print("InterpolationSearch steps: \(steps) ")
            return mid
        } else if (target < values[mid]){
            maximum = mid - 1
        } else if (target > values[mid]){
            minimal = mid + 1
        }
    }
    print("InterpolationSearch steps: \(steps) ")
    return -1
}

import Foundation

let sorted = [1,2, 2,2, 3,3,5,5,5,6,7,8,9,10, 12, 12, 14, 15, 16, 19, 20, 25, 26, 28, 29, 30]
print("LinearSearch of 15: \(LinearSearch(values: sorted, target: 15))\n")
print("BinarySearch of 15: \(BinarySearch(values: sorted, target: 15))\n")
print("InterpolationSearch of 15: \(InterpolationSearch(values: sorted, target: 15))\n")
print("BinarySearch of 3: \(BinarySearch(values: sorted, target: 3))\n")
print("InterpolationSearch of 3: \(InterpolationSearch(values: sorted, target: 3))\n")


