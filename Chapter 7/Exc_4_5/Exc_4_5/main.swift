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
            //print("BinarySearch steps: \(steps) ")
            return mid
        }
    }
    //print("BinarySearch steps: \(steps) ")
    return -1
}
func RecBinarySearch(values : [Int], target: Int, min: Int, max: Int) -> Int{
    let mid = (min + max) / 2
    if (target < values[mid]){
        return RecBinarySearch(values: values, target: target, min: min, max: mid - 1 )
    } else if (target > values[mid]){
        return  RecBinarySearch(values: values, target: target, min: mid + 1, max:  max)
    }  else{
        return mid
    }
}

let sorted = [1,2, 2,2, 3,3,5,5,5,6,7,8,9,10, 12, 12, 14, 15, 16, 19, 20, 25, 26, 28, 29, 30]
print("BinarySearch of 15: \(BinarySearch(values: sorted, target: 15))")
print("RecBinarySearch of 15: \(RecBinarySearch(values: sorted, target: 15, min: 0, max: sorted.count-1))")



