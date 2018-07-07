import Foundation

func findMedian(_ array : [Int]) -> Int{
    if  array.isEmpty {
        return 0
    }
    else
        if array.count % 2 == 0{
            let mid = array.count / 2;
            return (array[mid - 1] + array[ mid ]) / 2
        }
        else{
            return array[ array.count / 2]
    }
}

print("Array median: \(findMedian([]))")
print("Array median: \(findMedian([5, 12, 15, 30, 42, 56, 86]))")
print("Array median: \(findMedian([5, 12, 16, 30, 42, 56]))")

