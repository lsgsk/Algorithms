func InterpolationSearch(values : [Int], target: Int) -> Int{
    var minimal = 0
    var maximum = values.count - 1
    var steps = 0
    while (minimal <= maximum){
        steps += 1
        let mid = min(maximum, minimal + (maximum - minimal) * (target - values[minimal]) / (values[maximum] - values[minimal]))
        if (values[mid] == target){
            return mid
        } else if (target < values[mid]){
            maximum = mid - 1
        } else if (target > values[mid]){
            minimal = mid + 1
        }
    }
    return -1
}

func RecInterpolationSearch(values : [Int], target: Int, minimal: Int, maximum: Int) -> Int{
    while (minimal <= maximum){
        let mid = min(maximum, minimal + (maximum - minimal) * (target - values[minimal]) / (values[maximum] - values[minimal]))
        if (values[mid] == target){
            return mid
        } else if (target < values[mid]){
            return RecInterpolationSearch(values: values, target: target, minimal: minimal, maximum: mid - 1)
        } else if (target > values[mid]){
             return RecInterpolationSearch(values: values, target: target, minimal: mid + 1, maximum: maximum)
        }
    }
    return -1
}

import Foundation

let sorted = [1,2, 2,2, 3,3,5,5,5,6,7,8,9,10, 12, 12, 14, 15, 16, 19, 20, 25, 26, 28, 29, 30]
print("InterpolationSearch of 15: \(InterpolationSearch(values: sorted, target: 15))")
print("RecInterpolationSearch of 15: \(RecInterpolationSearch(values: sorted, target: 15, minimal: 0, maximum: sorted.count-1))")


