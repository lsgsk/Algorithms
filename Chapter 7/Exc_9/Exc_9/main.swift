func SmartBinarySearch(values : [Int], target: Int) -> Int{
    var min = 0
    var max = values.count - 1
    while (min <= max){
        let mid = (min + max) / 2
        if (target < values[mid]){
            max = mid - 1
        } else if (target > values[mid]){
            min = mid + 1
        }  else{
            var position = mid - 1
            while (position >= 0 && values[position] == target){
                position -= 1
            }
            return position + 1
        }
    }
    return -1
}

let sorted = [1,2, 2,2, 3,3,5,5,5,6,7,8,9,10, 12, 12, 14, 15, 16, 19, 20, 25, 26, 28, 29, 30]
print("BinarySearch of 15: \(SmartBinarySearch(values: sorted, target: 3))\n")




